import 'package:flutter/material.dart';
import 'package:athletica_sportswear/screens/menu.dart';
import 'package:athletica_sportswear/screens/form_page.dart';
import 'package:athletica_sportswear/screens/products_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
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
                SizedBox(height: 4),
                Text(
                  'Your one-stop football gear shop',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Home Menu
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
          ),

          // Product List Menu
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Product List'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductListPage()),
              );
            },
          ),

          // Add Product Menu
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Add Product'),
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
// 