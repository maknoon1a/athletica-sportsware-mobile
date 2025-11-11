import 'package:flutter/material.dart';
import 'package:athletica_sportswear/widgets/left_drawer.dart';
import 'package:athletica_sportswear/widgets/product_card.dart';
import 'package:athletica_sportswear/screens/form_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      foregroundColor: Colors.white,
    );

    void showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Shop'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Produk',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // 🔹 Tombol-tombol sejajar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // All Products
                  ElevatedButton.icon(
                    onPressed: () {
                      showSnackBar("Kamu telah menekan tombol All Products");
                    },
                    icon: const Icon(Icons.shopping_bag),
                    label: const Text("All Products"),
                    style: buttonStyle.copyWith(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.blue.shade600),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // My Products
                  ElevatedButton.icon(
                    onPressed: () {
                      showSnackBar("Kamu telah menekan tombol My Products");
                    },
                    icon: const Icon(Icons.person),
                    label: const Text("My Products"),
                    style: buttonStyle.copyWith(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.green.shade600),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Create Product (buka form tambah produk)
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
                      backgroundColor:
                          WidgetStateProperty.all(Colors.red.shade600),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Produk dummy
            Expanded(
              child: ListView(
                children: const [
                  ProductCard(
                    name: 'Nike Phantom GX',
                    price: 2999000,
                    description:
                        'Sepatu bola premium dengan kontrol bola maksimal.',
                    thumbnail:
                        'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0d3e92c7-97f4-4dcf-8ef9-3e1d05cf0e15/phantom-gx-elite-fg-sepatu-bola-renda-kW6bVz.png',
                    category: 'Sepatu',
                    isFeatured: true,
                  ),
                  ProductCard(
                    name: 'Adidas Predator',
                    price: 2799000,
                    description:
                        'Sepatu legendaris untuk pengendalian bola tingkat tinggi.',
                    thumbnail:
                        'https://assets.adidas.com/images/w_600,f_auto,q_auto/b4b3439a4d6a49c6a929ae74012e37df_9366/Predator_Accuracy.1_Firm_Ground_Boots_HQ1024_22_model.jpg',
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
