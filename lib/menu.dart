import 'package:flutter/material.dart';

// Kelas MenuPage adalah StatelessWidget yang menampilkan halaman menu utama
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // Method untuk menampilkan SnackBar dengan pesan tertentu
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar di bagian atas halaman
      appBar: AppBar(
        title: const Text('Football Shop'),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
      ),
      // Body halaman dengan layout vertikal di tengah
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol untuk melihat semua produk
            ElevatedButton.icon(
              onPressed: () {
                // Menampilkan SnackBar ketika tombol ditekan
                _showSnackBar(context, 'Kamu telah menekan tombol All Products');
              },
              icon: const Icon(Icons.sports_soccer), // Icon bola
              label: const Text('All Products'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna background biru
                foregroundColor: Colors.white, // Warna teks dan icon putih
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20), // Jarak antar tombol

            // Tombol untuk melihat produk milik user
            ElevatedButton.icon(
              onPressed: () {
                // Menampilkan SnackBar ketika tombol ditekan
                _showSnackBar(context, 'Kamu telah menekan tombol My Products');
              },
              icon: const Icon(Icons.inventory_2), // Icon inventori
              label: const Text('My Products'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Warna background hijau
                foregroundColor: Colors.white, // Warna teks dan icon putih
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20), // Jarak antar tombol

            // Tombol untuk membuat produk baru
            ElevatedButton.icon(
              onPressed: () {
                // Menampilkan SnackBar ketika tombol ditekan
                _showSnackBar(context, 'Kamu telah menekan tombol Create Product');
              },
              icon: const Icon(Icons.add_box), // Icon kotak tambah
              label: const Text('Create Product'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna background merah
                foregroundColor: Colors.white, // Warna teks dan icon putih
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}