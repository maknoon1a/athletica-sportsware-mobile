import 'package:flutter/material.dart';
import 'package:athletica_sportswear/widgets/left_drawer.dart';
import 'package:athletica_sportswear/widgets/product_card.dart';
import 'package:athletica_sportswear/screens/form_page.dart';

// Halaman utama - tampilin tombol-tombol aksi & daftar produk
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Style button yang konsisten buat semua tombol
    final buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      foregroundColor: Colors.white,
    );

    // Helper function buat nampilin snackbar
    void showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Shop'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul section
            const Text(
              'Daftar Produk',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Tombol-tombol aksi (horizontal scroll kalo layar kecil)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Tombol All Products - nampilin semua produk
                  ElevatedButton.icon(
                    onPressed: () =>
                        showSnackBar("Kamu telah menekan tombol All Products"),
                    icon: const Icon(Icons.shopping_bag),
                    label: const Text("All Products"),
                    style: buttonStyle.copyWith(
                      backgroundColor: WidgetStateProperty.all(Colors.grey[800]),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Tombol My Products - filter produk milik user
                  ElevatedButton.icon(
                    onPressed: () =>
                        showSnackBar("Kamu telah menekan tombol My Products"),
                    icon: const Icon(Icons.person),
                    label: const Text("My Products"),
                    style: buttonStyle.copyWith(
                      backgroundColor: WidgetStateProperty.all(Colors.grey[700]),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Tombol Create Product - buka form tambah produk
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductFormPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Create Product"),
                    style: buttonStyle.copyWith(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Daftar produk dummy (nanti bisa diganti dengan data dari API)
            Expanded(
              child: ListView(
                children: const [
                  ProductCard(
                    name: 'Nike Phantom GX',
                    price: 2999000,
                    description: 'Sepatu bola premium dengan kontrol bola maksimal.',
                    thumbnail: 'https://static.nike.com/a/images/t_web_pdp_936_v2/f_auto/0f1cce41-4f49-484a-bc5e-16f782c71b32/PHANTOM+GX+CLUB+FG%2FMG.png',
                    category: 'Sepatu',
                    isFeatured: true,
                  ),
                  ProductCard(
                    name: 'Adidas Predator',
                    price: 2799000,
                    description: 'Sepatu legendaris untuk pengendalian bola tingkat tinggi.',
                    thumbnail: 'https://static.nike.com/a/images/t_web_pdp_936_v2/f_auto/0f1cce41-4f49-484a-bc5e-16f782c71b32/PHANTOM+GX+CLUB+FG%2FMG.png',
                    category: 'Sepatu',
                    isFeatured: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}