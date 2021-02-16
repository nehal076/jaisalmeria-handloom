// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) => ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
    ProductDetails({
        this.rating,
        this.id,
        this.categoryId,
        this.name,
        this.imageUrl,
        this.price,
        this.size,
        this.details,
        this.material,
        this.v,
        this.discount,
    });

    int rating;
    String id;
    String categoryId;
    String name;
    String imageUrl;
    String price;
    String size;
    String details;
    String material;
    int v;
    String discount;

    factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        rating: json["rating"],
        id: json["_id"],
        categoryId: json["categoryId"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        price: json["price"],
        size: json["size"],
        details: json["details"],
        material: json["material"],
        v: json["__v"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "_id": id,
        "categoryId": categoryId,
        "name": name,
        "imageUrl": imageUrl,
        "price": price,
        "size": size,
        "details": details,
        "material": material,
        "__v": v,
        "discount": discount,
    };
}
