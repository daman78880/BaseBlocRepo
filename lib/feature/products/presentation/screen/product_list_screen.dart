import 'package:bloc_demo_project/feature/login/domain/entities/user.dart'
    show User;
import 'package:bloc_demo_project/feature/products/domain/entities/produsts.dart'
    show ProductListLocal;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_bloc.dart'
    show ProductsBloc;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_event.dart'
    show ProductsEvent;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:loader_overlay/loader_overlay.dart';

class ProductListScreen extends StatelessWidget {
  final User user;
  const ProductListScreen({super.key, required this.user});

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
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          state.when(
            initial: () {
              context.loaderOverlay.show();
            },
            loading: (isLoading) {
              if (isLoading) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }
            },
            success: (products, listGetState) {},
            failure: (error) {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: (isLoading) {
              return const SizedBox.shrink();
            },
            failure: (error) => const SizedBox.shrink(),
            success: (products, listGetState) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: products.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  ProductListLocal product = products[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child:
                            product.images.isNotEmpty
                                ? Image.network(
                                  product.images.first,
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
                            'Category: ${product.category}',
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
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorScheme.primary,
        child: Icon(Icons.add, color: colorScheme.onPrimary),
      ),
    );
  }
}
