import 'package:flutter/material.dart';
import 'package:athletica_sportswear/models/product_entry.dart';
import 'package:athletica_sportswear/widgets/left_drawer.dart';
import 'package:athletica_sportswear/screens/product_detail.dart';
import 'package:athletica_sportswear/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool showMyProductsOnly = false;
  int? currentUserId;

  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // TODO: Ganti URL sesuai deployment lo
    // Untuk emulator Android: http://10.0.2.2:8000/json/
    // Untuk Chrome: http://localhost:8000/json/
    final response = await request.get('http://localhost:8000/json/');

    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        ProductEntry product = ProductEntry.fromJson(d);
        
        // Simpan user ID dari produk pertama yang muncul dengan user yang sama
        if (currentUserId == null && product.userId != null) {
          // Asumsikan user yang login punya ID yang sama dengan product pertama yang muncul
          // Atau bisa juga didapatkan dari response login
          currentUserId = product.userId;
        }
        
        // Filter produk berdasarkan toggle
        if (showMyProductsOnly) {
          if (product.userId == currentUserId) {
            listProduct.add(product);
          }
        } else {
          listProduct.add(product);
        }
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // Filter Buttons
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showMyProductsOnly = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !showMyProductsOnly 
                          ? Colors.black 
                          : Colors.grey[300],
                      foregroundColor: !showMyProductsOnly 
                          ? Colors.white 
                          : Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'All Products',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showMyProductsOnly = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showMyProductsOnly 
                          ? Colors.black 
                          : Colors.grey[300],
                      foregroundColor: showMyProductsOnly 
                          ? Colors.white 
                          : Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'My Products',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Product List
          Expanded(
            child: FutureBuilder(
              future: fetchProducts(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        showMyProductsOnly 
                            ? 'You have no products yet.' 
                            : 'No products available.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (_, index) => ProductEntryCard(
                      product: snapshot.data![index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              product: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}