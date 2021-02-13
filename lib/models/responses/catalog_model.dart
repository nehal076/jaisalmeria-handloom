// To parse this JSON data, do
//
//     final catalog = catalogFromJson(jsonString);

import 'dart:convert';

Catalog catalogFromJson(String str) => Catalog.fromJson(json.decode(str));

String catalogToJson(Catalog data) => json.encode(data.toJson());

class Catalog {
    Catalog({
        this.data,
    });

    List<Datum> data;

    factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.imageUrl,
        this.v,
    });

    String id;
    String name;
    String imageUrl;
    int v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "imageUrl": imageUrl,
        "__v": v,
    };
}
