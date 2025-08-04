import 'package:bloc_demo_project/core/common_widgets/common_image_loader.dart'
    show CommonImageAsset, CommonImageLoader, CommonImageType;
import 'package:bloc_demo_project/feature/products/domain/entities/products_list_local.dart'
    show ProductListLocal;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_bloc.dart'
    show ProductsBloc;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_event.dart'
    show ProductsEvent;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_state.dart'
    show ProductsLoading, ProductsProductDetail, ProductsState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductListLocal productDetail;
  const ProductDetailScreen({Key? key, required this.productDetail})
    : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.productDetail.id != null) {
      print('========== widget.productDetail.id: ${widget.productDetail.id}');
      context.read<ProductsBloc>().add(
        ProductsEvent.getProductDetail(id: widget.productDetail.id ?? 0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productDetail.title ?? '',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          print('========== state: $state and type ${state.runtimeType}');
          if (state is ProductsLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
        },
        builder: (context, state) {
          if (state is ProductsProductDetail) {
            final images = state.product.images;
            final category = state.product.category;
            final product = state.product;
            // final images = [
            //   'https://images.unsplash.com/photo-1583565929583-c5aa76ab16f3?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            //   'https://images.unsplash.com/photo-1556800695-a5b593d1586b?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            //   'https://images.unsplash.com/photo-1738957300226-a74a4d401d23?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            // ];
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (images != null && images.isNotEmpty)
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        itemCount: images.length,
                        itemBuilder:
                            (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CommonImageLoader(
                                  asset: CommonImageAsset(
                                    path: images[index].toString(),
                                    type: CommonImageType.network,
                                  ),
                                ),
                              ),
                            ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    product.title ?? '',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Slug: ${product.slug}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ' ${product.price}',
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      if (category != null && category.image != null)
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CommonImageLoader(
                              asset: CommonImageAsset(
                                path: category.image.toString(),
                                type: CommonImageType.network,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(width: 12),
                      Text(
                        'Category: ${category?.name ?? ''}',
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(product.description ?? '', style: textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: colorScheme.outline,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Created: ${product.creationAt?.toString()}',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.update, size: 18, color: colorScheme.outline),
                      const SizedBox(width: 8),
                      Text(
                        'Updated: ${product.updatedAt?.toString()}',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
