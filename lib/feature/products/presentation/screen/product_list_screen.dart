import 'package:bloc_demo_project/feature/login/data/models/login_response_model.dart'
    show LoginResponseModel;
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final LoginResponseModel loginResponseModel;
  const ProductListScreen({super.key, required this.loginResponseModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // Sample/mock data
    final products = [
      {
        'id': 4,
        'title': 'Handmade Fresh Table',
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
      },
      {
        'id': 5,
        'title': 'Modern Lamp',
        'price': 120,
        'description': 'A beautiful modern lamp.',
        'category': {
          'id': 2,
          'name': 'Home',
          'image': 'https://placehold.co/600x400',
          'slug': 'home',
        },
        'images': ['https://placehold.co/600x400'],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final product = products[index] as Map<String, dynamic>;
          final images = product['images'] as List<dynamic>?;
          final category = product['category'] as Map<String, dynamic>?;
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
                    images != null && images.isNotEmpty
                        ? Image.network(
                          images[0] as String,
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
                product['title']?.toString() ?? '',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    'Category: ${category?['name'] ?? ''}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product['price']}',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: colorScheme.outline,
              ),
              onTap: () {
                // Navigate to detail (to be implemented)
              },
            ),
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
