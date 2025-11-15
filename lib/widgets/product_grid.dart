// lib/widgets/product_grid.dart

import 'package:flutter/material.dart';
import '../utils/feedback_utils.dart';

// Data Dummy dengan path gambar dan spesifikasi (Asumsikan assets/images/ sudah disiapkan)
final List<Map<String, dynamic>> products = const [
  {
    'name': 'Laptop Gaming RTX', 
    'price': 'Rp 18.500.000', 
    'imagePath': 'assets/images/laptop.jpg', // Ganti dengan file Anda
    'specs': ['RTX 4060', 'Core i7', '16GB RAM']
  },
  {
    'name': 'Mouse Wireless Silent', 
    'price': 'Rp 450.000', 
    'imagePath': 'assets/images/mouse.jpg', // Ganti dengan file Anda
    'specs': ['Silent Click', 'Bluetooth 5.0', '1600 DPI']
  },
  {
    'name': 'Mechanical Keyboard TKL', 
    'price': 'Rp 1.150.000', 
    'imagePath': 'assets/images/keyboard.jpg', // Ganti dengan file Anda
    'specs': ['Brown Switch', 'RGB', 'Tenkeyless']
  },
  {
    'name': 'Monitor Ultra-Wide 4K', 
    'price': 'Rp 7.800.000', 
    'imagePath': 'assets/images/monitor.jpg', // Ganti dengan file Anda
    'specs': ['32 inch', '4K UHD', 'HDR 10']
  },
];

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        // Disesuaikan agar muat gambar dan spesifikasi
        childAspectRatio: 0.7, 
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final specs = product['specs'] as List<String>;

        return Card(
          elevation: 4, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell( 
            onTap: () => showInteractionFeedback(context, 'Melihat detail ${product['name']}'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 1. Gambar Produk
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        product['imagePath'] as String,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback jika gambar tidak ditemukan
                          return const Icon(Icons.image_not_supported, size: 50, color: Colors.grey);
                        },
                      ),
                    ),
                  ),
                ),
                // 2. Detail Teks & Harga
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), 
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        product['price'] as String,
                        style: TextStyle(color: Colors.amber[800], fontSize: 13, fontWeight: FontWeight.bold), 
                      ),
                      const SizedBox(height: 5),
                      // 3. Spesifikasi
                      ...specs.map((spec) => Text(
                        '• $spec',
                        style: const TextStyle(fontSize: 11, color: Colors.black54),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )).toList(),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}