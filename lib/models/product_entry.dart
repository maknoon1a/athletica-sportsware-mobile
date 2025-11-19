// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String detail;
    String thumbnail;
    String category;
    String productGroup;
    bool isFeatured;
    String size;
    String gender;
    int stockQuantity;
    bool isAvailable;
    int userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.detail,
        required this.thumbnail,
        required this.category,
        required this.productGroup,
        required this.isFeatured,
        required this.size,
        required this.gender,
        required this.stockQuantity,
        required this.isAvailable,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        detail: json["detail"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        productGroup: json["product_group"],
        isFeatured: json["is_featured"],
        size: json["size"],
        gender: json["gender"],
        stockQuantity: json["stock_quantity"],
        isAvailable: json["is_available"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "detail": detail,
        "thumbnail": thumbnail,
        "category": category,
        "product_group": productGroup,
        "is_featured": isFeatured,
        "size": size,
        "gender": gender,
        "stock_quantity": stockQuantity,
        "is_available": isAvailable,
        "user_id": userId,
    };
}