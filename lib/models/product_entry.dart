// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

ProductEntry productEntryFromJson(String str) => ProductEntry.fromJson(json.decode(str));

String productEntryToJson(ProductEntry data) => json.encode(data.toJson());

class ProductEntry {
    String id;
    int userId;
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
    int viewsCount;
    int soldCount;

    ProductEntry({
        required this.id,
        required this.userId,
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
        required this.viewsCount,
        required this.soldCount,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        userId: json["user_id"],
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
        viewsCount: json["views_count"],
        soldCount: json["sold_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
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
        "views_count": viewsCount,
        "sold_count": soldCount,
    };
}
