// To parse this JSON data, do
//
//     final logoutModal = logoutModalFromJson(jsonString);

import 'dart:convert';

LogoutModal logoutModalFromJson(String str) => LogoutModal.fromJson(json.decode(str));

String logoutModalToJson(LogoutModal data) => json.encode(data.toJson());

class LogoutModal {
    LogoutModal({
        this.message,
        this.statusCode,
    });

    String message;
    int statusCode;

    factory LogoutModal.fromJson(Map<String, dynamic> json) => LogoutModal(
        message: json["message"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
    };
}
