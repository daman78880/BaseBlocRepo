import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // Mock product data
    final product = {
      'id': 4,
      'title': 'Handmade Fresh Table',
      'slug': 'handmade-fresh-table',
      'price': 687,
      'description': 'Andy shoes are designed to keeping in...',
      'category': {
        'id': 5,
        'name': 'Others',
        'image': 'https://placehold.co/600x400',
        'slug': 'others',
      },
      'images': [
        'https://placehold.co/600x400',
        'https://placehold.co/600x400',
      ],
      'creationAt': '2023-01-03T16:51:33.000Z',
      'updatedAt': '2023-01-03T16:51:33.000Z',
    };

    final images = product['images'] as List<dynamic>?;
    final category = product['category'] as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (product['title'] ?? '') as String,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
              (product['title'] ?? '') as String,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Slug: ${product['slug']}',
              style: textTheme.bodySmall?.copyWith(color: colorScheme.outline),
            ),
            const SizedBox(height: 8),
            Text(
              ' ${product['price']}',
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                if (category != null && category['image'] != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      category['image'].toString(),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(width: 12),
                Text(
                  'Category: ${category?['name'] ?? ''}',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              product['description']?.toString() ?? '',
              style: textTheme.bodyLarge,
            ),
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
                  'Created: ${product['creationAt'].toString()}',
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
                  'Updated: ${product['updatedAt'].toString()}',
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
