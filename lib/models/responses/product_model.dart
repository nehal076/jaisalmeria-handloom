// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.data,
    });

    List<Datum> data;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.rating,
        this.id,
        this.categoryId,
        this.name,
        this.imageUrl,
        this.price,
        this.v,
    });

    int rating;
    String id;
    String categoryId;
    String name;
    String imageUrl;
    String price;
    int v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        rating: json["rating"],
        id: json["_id"],
        categoryId: json["categoryId"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        price: json["price"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "_id": id,
        "categoryId": categoryId,
        "name": name,
        "imageUrl": imageUrl,
        "price": price,
        "__v": v,
    };
}