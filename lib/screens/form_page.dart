import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:athletica_sportswear/widgets/left_drawer.dart';
import 'package:athletica_sportswear/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int _price = 0;
  String _description = '';
  String _detail = '';
  String _thumbnail = '';
  String _category = 'jersey';
  String _productGroup = 'football';
  bool _isFeatured = false;
  String _size = 'M';
  String _gender = 'unisex';
  int _stockQuantity = 0;
  bool _isAvailable = true;

  // Sesuai dengan Django model choices
  final List<Map<String, String>> _categories = [
    {'value': 'jersey', 'label': 'Jersey'},
    {'value': 'shorts', 'label': 'Shorts'},
    {'value': 'shoes', 'label': 'Shoes'},
    {'value': 'tracksuit', 'label': 'Tracksuit'},
    {'value': 'accessories', 'label': 'Accessories'},
    {'value': 'equipment', 'label': 'Equipment'},
  ];

  final List<Map<String, String>> _sportChoices = [
    {'value': 'football', 'label': 'Football'},
    {'value': 'basketball', 'label': 'Basketball'},
    {'value': 'badminton', 'label': 'Badminton'},
    {'value': 'volleyball', 'label': 'Volleyball'},
    {'value': 'running', 'label': 'Running'},
    {'value': 'gym', 'label': 'Gym/Fitness'},
  ];

  final List<Map<String, String>> _sizes = [
    {'value': 'XS', 'label': 'Extra Small'},
    {'value': 'S', 'label': 'Small'},
    {'value': 'M', 'label': 'Medium'},
    {'value': 'L', 'label': 'Large'},
    {'value': 'XL', 'label': 'Extra Large'},
    {'value': 'XXL', 'label': 'Double Extra Large'},
  ];

  final List<Map<String, String>> _genders = [
    {'value': 'men', 'label': 'Men'},
    {'value': 'women', 'label': 'Women'},
    {'value': 'unisex', 'label': 'Unisex'},
    {'value': 'kids', 'label': 'Kids'},
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Product Name
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
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Price
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price (Rp)',
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
                  if (price == null || price < 0) {
                    return 'Price must be a valid positive number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Description
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
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Detail
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Additional Details (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => setState(() => _detail = value),
              ),
              const SizedBox(height: 16),

              // Thumbnail URL
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
                  final pattern = r'^(https?:\/\/).+\.(jpg|jpeg|png|gif|webp)$';
                  if (!RegExp(pattern, caseSensitive: false).hasMatch(value)) {
                    return 'Invalid URL format (must be image link)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Category
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                value: _category,
                items: _categories
                    .map((cat) => DropdownMenuItem(
                          value: cat['value'],
                          child: Text(cat['label']!),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _category = value!),
              ),
              const SizedBox(height: 16),

              // Sport/Product Group
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Sport Category',
                  border: OutlineInputBorder(),
                ),
                value: _productGroup,
                items: _sportChoices
                    .map((sport) => DropdownMenuItem(
                          value: sport['value'],
                          child: Text(sport['label']!),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _productGroup = value!),
              ),
              const SizedBox(height: 16),

              // Size
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Size',
                  border: OutlineInputBorder(),
                ),
                value: _size,
                items: _sizes
                    .map((size) => DropdownMenuItem(
                          value: size['value'],
                          child: Text('${size['value']} - ${size['label']}'),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _size = value!),
              ),
              const SizedBox(height: 16),

              // Gender
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                value: _gender,
                items: _genders
                    .map((gender) => DropdownMenuItem(
                          value: gender['value'],
                          child: Text(gender['label']!),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _gender = value!),
              ),
              const SizedBox(height: 16),

              // Stock Quantity
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Stock Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    setState(() => _stockQuantity = int.tryParse(value) ?? 0),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stock quantity cannot be empty';
                  }
                  final stock = int.tryParse(value);
                  if (stock == null || stock < 0) {
                    return 'Stock must be a valid positive number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Featured Switch
              SwitchListTile(
                title: const Text('Featured Product?'),
                subtitle: const Text('Show in featured section'),
                value: _isFeatured,
                activeColor: Colors.black,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),

              // Available Switch
              SwitchListTile(
                title: const Text('Available for Sale?'),
                subtitle: const Text('Product can be purchased'),
                value: _isAvailable,
                activeColor: Colors.black,
                onChanged: (value) => setState(() => _isAvailable = value),
              ),
              const SizedBox(height: 20),

              // Save Button
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save Product'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Ganti URL sesuai deployment lo
                    final response = await request.postJson(
                      "http://localhost:8000/create-flutter/",
                      jsonEncode({
                        'name': _name,
                        'price': _price,
                        'description': _description,
                        'detail': _detail,
                        'thumbnail': _thumbnail,
                        'category': _category,
                        'product_group': _productGroup,
                        'is_featured': _isFeatured,
                        'size': _size,
                        'gender': _gender,
                        'stock_quantity': _stockQuantity,
                        'is_available': _isAvailable,
                      }),
                    );

                    if (context.mounted) {
                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Product successfully created!"),
                            backgroundColor: Colors.black,
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response['message'] ?? "Failed to create product"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
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