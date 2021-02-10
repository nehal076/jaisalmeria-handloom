// To parse this JSON data, do
//
//     final loginModal = loginModalFromJson(jsonString);

import 'dart:convert';

LoginModal loginModalFromJson(String str) => LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
    LoginModal({
        this.message,
        this.statusCode,
        this.data,
    });

    String message;
    int statusCode;
    Data data;

    factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
        message: json["message"],
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.token,
        this.firstName,
        this.lastName,
        this.emailId,
        this.createdAt,
        this.userId,
        this.status,
    });

    String token;
    String firstName;
    String lastName;
    String emailId;
    dynamic createdAt;
    int userId;
    String status;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailId: json["emailId"],
        createdAt: json["createdAt"],
        userId: json["userId"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "firstName": firstName,
        "lastName": lastName,
        "emailId": emailId,
        "createdAt": createdAt,
        "userId": userId,
        "status": status,
    };
}
