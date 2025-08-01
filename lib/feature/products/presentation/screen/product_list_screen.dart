import 'package:bloc_demo_project/core/common_widgets/button_bouncing_effect.dart'
    show ButtonBouncingEffect;
import 'package:bloc_demo_project/core/constants/common_enums.dart'
    show ListGetType;
import 'package:bloc_demo_project/core/routes/routes.dart' show RouteNames;
import 'package:bloc_demo_project/feature/login/domain/entities/user.dart'
    show User;
import 'package:bloc_demo_project/feature/products/domain/entities/products_list_local.dart'
    show ProductListLocal;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_bloc.dart'
    show ProductsBloc;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_event.dart'
    show ProductsEvent;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../core/common_widgets/common_image_loader.dart'
    show CommonImageAsset, CommonImageLoader, CommonImageType;

class ProductListScreen extends StatefulWidget {
  final User user;
  const ProductListScreen({super.key, required this.user});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductListLocal> _products = [];
  bool _isLoadingMore = false;
  bool _isFetching = false;
  bool _isMaxReached = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isFetching || _isLoadingMore || _isMaxReached) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _isFetching = true;
      context.read<ProductsBloc>().add(
        ProductsEvent.getList(listGetState: ListGetType.isFromPagination),
      );
      Future.delayed(const Duration(milliseconds: 300), () {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ProductsBloc, ProductsState>(
              listener: (context, state) {
                state.whenOrNull(
                  loading: (isLoading) {
                    if (isLoading) {
                      context.loaderOverlay.show();
                    } else {
                      context.loaderOverlay.hide();
                    }
                  },
                  loadingMore: (isLoadingMore) {
                    _isLoadingMore = isLoadingMore;
                  },
                  success: (products, listGetType, maxReached) {
                    if (listGetType == ListGetType.isFromPagination) {
                      _isMaxReached = maxReached;
                      _isLoadingMore = false;
                      _products = List<ProductListLocal>.from(_products)
                        ..addAll(
                          products.where(
                            (newItem) =>
                                !_products.any((e) => e.id == newItem.id),
                          ),
                        );
                    } else {
                      _isMaxReached = maxReached;
                      _products = products.toList(); // <-- critical fix here
                    }
                  },
                  failure: (_) {
                    _isLoadingMore = false;
                  },
                );
              },
              builder: (context, state) {
                print('========== _products: ${_products.length}');
                if (_products.isEmpty) {
                  return const Center(child: Text("No products found"));
                }

                return ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _products.length + (_isLoadingMore ? 1 : 0),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    if (_isLoadingMore && index == _products.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final product = _products[index];
                    return ButtonBouncingEffect(
                      onTap: () {
                        context.pushNamed(
                          RouteNames.productList,
                          extra: product,
                        );
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child:
                                product.images?.isNotEmpty ?? false
                                    ? CommonImageLoader(
                                      asset: CommonImageAsset(
                                        path: product.images!.first,
                                        type: CommonImageType.network,
                                      ),
                                      width: 64,
                                      height: 64,
                                      fit: BoxFit.cover,
                                    )
                                    : Container(
                                      width: 64,
                                      height: 64,
                                      color: colorScheme.surfaceVariant,
                                    ),
                          ),
                          title: Text(
                            product.title ?? '',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                'Category: ${product.category?.name}',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.primary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${product.price}',
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_forward_ios,
                                color: colorScheme.outline,
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<ProductsBloc>().add(
                                    ProductsEvent.selectProduct(index: index),
                                  );
                                },
                                icon: Icon(
                                  product.isSelected == true
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorScheme.primary,
        child: Icon(Icons.add, color: colorScheme.onPrimary),
      ),
    );
  }
}
