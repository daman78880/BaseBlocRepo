import 'package:flutter/material.dart';

class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // Mock product data
    final product = {
      'title': 'Handmade Fresh Table',
      'price': 687,
      'description': 'Andy shoes are designed to keeping in...',
      'categoryId': 3,
      'images': ['https://placehold.co/600x400'],
    };
    // Mock categories for dropdown
    final categories = [
      {'id': 1, 'name': 'Clothes'},
      {'id': 2, 'name': 'Home'},
      {'id': 3, 'name': 'Others'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Product',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              controller: TextEditingController(
                text: product['title'].toString(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
              controller: TextEditingController(
                text: product['price'].toString(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
              controller: TextEditingController(
                text: product['description'].toString(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              value: product['categoryId'].toString(),
              items:
                  categories
                      .map(
                        (cat) => DropdownMenuItem<String>(
                          value: cat['id'].toString(),
                          child: Text(cat['name'].toString()),
                        ),
                      )
                      .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Image URL',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              controller: TextEditingController(
                text:
                    (product['images'] != null &&
                            (product['images'] as List).isNotEmpty)
                        ? (product['images'] as List)[0].toString()
                        : '',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Update Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
