import 'package:bloc_demo_project/feature/products/domain/entities/products_list_local.dart'
    show ProductListLocal;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_bloc.dart'
    show ProductsBloc;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_state.dart'
    show ProductsProductDetail, ProductsState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductListLocal prductDetail;
  const ProductDetailScreen({Key? key, required this.prductDetail})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          prductDetail.title ?? '',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductsProductDetail) {
            final images = state.product.images;
            final category = state.product.category;
            final product = state.product;

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
                                child: Image.network(
                                  images[index].toString(),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            category.image.toString(),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
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

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
