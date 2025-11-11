import 'package:flutter/material.dart';

// Card untuk nampilin satu produk
// Bentuknya horizontal: gambar di kiri, info di kanan
class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String description;
  final String thumbnail;
  final String category;
  final bool isFeatured;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Shadow tipis biar ada depth dikit
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black12, width: 1), // Border tipis
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar thumbnail produk
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                thumbnail,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                // Kalo gambar gagal load, tampilin placeholder abu-abu
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 40),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),

            // Info produk (nama, kategori, deskripsi, harga)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris pertama: nama produk & badge "Featured" (kalo ada)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Badge "Featured" muncul cuma kalo isFeatured == true
                      if (isFeatured)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Featured',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Kategori (dengan warna abu-abu)
                  Text(
                    category,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 6),

                  // Deskripsi produk (maksimal 2 baris)
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Kalo kepanjangan, tampilin "..."
                  ),
                  const SizedBox(height: 6),

                  // Harga produk
                  Text(
                    'Rp $price',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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