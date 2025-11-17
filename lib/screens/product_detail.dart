import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Thumbnail
            if (product.thumbnail.isNotEmpty)
              Image.network(
                product.thumbnail,
                width: double.infinity,
                height: 350,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 350,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Brand
                  Row(
                    children: [
                      Icon(Icons.store, size: 18, color: Colors.grey[700]),
                      const SizedBox(width: 6),
                      Text(
                        product.brand,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Price
                  Row(
                    children: [
                      Icon(Icons.sell, size: 18, color: Colors.green[700]),
                      const SizedBox(width: 6),
                      Text(
                        "Rp ${product.price}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Stock
                  Row(
                    children: [
                      Icon(Icons.inventory, size: 18, color: Colors.blue[700]),
                      const SizedBox(width: 6),
                      Text(
                        "Stock: ${product.stock}",
                        style: TextStyle(fontSize: 14, color: Colors.blue[700]),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // Description
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16.0, height: 1.6),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
