import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';
import 'menu.dart';

// Halaman form untuk nambah produk baru
// Ada validasi di setiap input biar datanya bener semua
class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  // Key untuk ngecek validasi form secara keseluruhan
  final _formKey = GlobalKey<FormState>();

  // Variabel penampung input user
  String _name = '';
  int _price = 0;
  String _description = '';
  String _thumbnail = '';
  String _category = 'Shoes';
  bool _isFeatured = false;

  // Opsi kategori yang tersedia
  final List<String> _categories = ['Shoes', 'Jersey', 'Accessories'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Pasang key biar bisa divalidasi nanti
          child: ListView(
            children: [
              // Input nama produk
              // Harus diisi, minimal 3 karakter, maksimal 50
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  if (value.length < 3) {
                    return 'Name must be at least 3 characters';
                  }
                  if (value.length > 50) {
                    return 'Name cannot exceed 50 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input harga produk
              // Harus angka, gak boleh negatif
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    setState(() => _price = int.tryParse(value) ?? 0),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Price cannot be empty';
                  }
                  final price = int.tryParse(value);
                  if (price == null) {
                    return 'Price must be a number';
                  }
                  if (price < 0) {
                    return 'Price cannot be negative';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input deskripsi produk
              // Minimal 10 karakter, maksimal 200
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => setState(() => _description = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description cannot be empty';
                  }
                  if (value.length < 10) {
                    return 'Description must be at least 10 characters';
                  }
                  if (value.length > 200) {
                    return 'Description cannot exceed 200 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input URL gambar produk
              // Harus format URL valid dan berakhiran .jpg/.png/.jpeg/.gif
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
                  // Regex buat ngecek format URL gambar
                  final pattern = r'^(https?:\/\/).+\.(jpg|jpeg|png|gif)$';
                  if (!RegExp(pattern).hasMatch(value)) {
                    return 'Invalid URL format (must start with http/https and end with .jpg/.png)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Dropdown pilih kategori
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                value: _category,
                items: _categories
                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (value) => setState(() => _category = value!),
              ),
              const SizedBox(height: 16),

              // Switch buat nandain produk featured atau bukan
              SwitchListTile(
                title: const Text('Featured Product?'),
                value: _isFeatured,
                activeColor: Colors.black,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),
              const SizedBox(height: 20),

              // Tombol save - validasi dulu sebelum nampilin dialog
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  // Cek validasi semua field
                  if (_formKey.currentState!.validate()) {
                    // Kalo valid, munculin dialog konfirmasi
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Product Information'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name: $_name'),
                              const SizedBox(height: 4),
                              Text('Price: $_price'),
                              const SizedBox(height: 4),
                              Text('Description: $_description'),
                              const SizedBox(height: 4),
                              Text('Thumbnail: $_thumbnail'),
                              const SizedBox(height: 4),
                              Text('Category: $_category'),
                              const SizedBox(height: 4),
                              Text('Featured: ${_isFeatured ? "Yes" : "No"}'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog dulu
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MenuPage(),
                                ),
                              );
                            },
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