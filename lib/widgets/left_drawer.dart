import 'package:flutter/material.dart';
import '../screens/menu.dart';
import '../screens/form_page.dart';

// Drawer alias menu samping yang bisa di-swipe dari kiri
// Isinya navigasi ke halaman-halaman utama
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Biar header nempel sempurna di atas
        children: [
          // Header drawer - bagian atas yang ada icon & judul
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.sports_soccer, color: Colors.white, size: 48),
                SizedBox(height: 10),
                Text(
                  'Football Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Menu ke Halaman Utama
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pop(context); // Tutup drawer dulu
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
          ),

          // Menu ke Form Tambah Produk
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}