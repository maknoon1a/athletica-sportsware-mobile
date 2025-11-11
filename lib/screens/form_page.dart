import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  // Kunci global untuk mengontrol status form (valid atau tidak)
  final _formKey = GlobalKey<FormState>();

  // Variabel penampung input pengguna
  String _name = '';          // Nama produk
  int _price = 0;             // Harga produk
  String _description = '';   // Deskripsi produk
  String _thumbnail = '';     // URL gambar produk
  String _category = 'Shoes'; // Kategori default
  bool _isFeatured = false;   // Status featured produk

  // Daftar kategori untuk dropdown
  final List<String> _categories = ['Shoes', 'Jersey', 'Accessories'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Hubungkan form dengan GlobalKey agar bisa divalidasi
          child: ListView(
            children: [
              // ==================== INPUT NAMA PRODUK ====================
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                // Setiap kali user mengetik, simpan nilainya ke variabel _name
                onChanged: (value) => setState(() => _name = value),
                // Validator digunakan untuk memastikan input valid sebelum disubmit
                validator: (value) {
                  // Cek apakah kosong
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  // Cek panjang minimal
                  else if (value.length < 3) {
                    return 'Name must be at least 3 characters';
                  }
                  // Cek panjang maksimal agar tidak terlalu panjang
                  else if (value.length > 50) {
                    return 'Name cannot exceed 50 characters';
                  }
                  return null; // Jika valid
                },
              ),
              const SizedBox(height: 16),

              // ==================== INPUT HARGA PRODUK ====================
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number, // Biar muncul keyboard angka
                onChanged: (value) =>
                    setState(() => _price = int.tryParse(value) ?? 0),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Price cannot be empty';
                  }
                  final price = int.tryParse(value);
                  // Cek apakah input bisa diubah ke angka
                  if (price == null) {
                    return 'Price must be a number';
                  }
                  // Cegah harga negatif
                  else if (price < 0) {
                    return 'Price cannot be negative';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ==================== INPUT DESKRIPSI PRODUK ====================
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3, // Biar textarea lebih luas
                onChanged: (value) => setState(() => _description = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description cannot be empty';
                  }
                  // Biar deskripsi gak terlalu pendek
                  else if (value.length < 10) {
                    return 'Description must be at least 10 characters';
                  }
                  // Batas panjang maksimal biar gak kebanyakan karakter
                  else if (value.length > 200) {
                    return 'Description cannot exceed 200 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ==================== INPUT URL THUMBNAIL ====================
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Thumbnail URL',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _thumbnail = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Thumbnail URL cannot be empty';
                  }

                  // Pola regex (regular expression) untuk validasi URL
                  // ^(https?:\/\/) → harus diawali http:// atau https://
                  // .+\.(jpg|jpeg|png|gif)$ → harus diakhiri ekstensi gambar valid
                  final pattern = r'^(https?:\/\/).+\.(jpg|jpeg|png|gif)$';

                  // RegExp digunakan untuk mencocokkan pola (string matching)
                  // Di sini kita memastikan format URL valid dan berisi file gambar
                  if (!RegExp(pattern).hasMatch(value)) {
                    return 'Invalid URL format (must start with http/https and end with .jpg/.png)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ==================== DROPDOWN KATEGORI PRODUK ====================
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                value: _category, // Nilai awal kategori
                items: _categories.map((String category) {
                  // Buat setiap opsi dropdown dari list
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                // Simpan kategori yang dipilih user
                onChanged: (value) => setState(() => _category = value!),
              ),
              const SizedBox(height: 16),

              // ==================== SWITCH FEATURED PRODUK ====================
              // Memberi opsi apakah produk ini termasuk produk unggulan
              SwitchListTile(
                title: const Text('Featured Product?'),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),
              const SizedBox(height: 20),

              // ==================== TOMBOL SIMPAN PRODUK ====================
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  // Jalankan validasi seluruh form
                  if (_formKey.currentState!.validate()) {
                    // Kalau semua valid, munculkan pop-up menampilkan data yang dimasukkan user
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Product Information'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text('Name: $_name'),
                              Text('Price: $_price'),
                              Text('Description: $_description'),
                              Text('Thumbnail: $_thumbnail'),
                              Text('Category: $_category'),
                              Text(
                                'Featured: ${_isFeatured ? "Yes" : "No"}',
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          // Tombol untuk menutup dialog
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
