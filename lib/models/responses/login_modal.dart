// To parse this JSON data, do
//
//     final loginModal = loginModalFromJson(jsonString);

import 'dart:convert';

LoginModal loginModalFromJson(String str) => LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
    LoginModal({
        this.statusCode,
        this.message,
        this.data,
    });

    int statusCode;
    String message;
    Data data;

    factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
        statusCode: json["statusCode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.v,
    });

    String id;
    String firstName;
    String lastName;
    String email;
    String password;
    int v;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "__v": v,
    };
}
