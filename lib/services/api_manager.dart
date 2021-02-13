import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jaisalmeria_handloom/models/constants.dart';
import 'package:jaisalmeria_handloom/models/responses/catalog_model.dart';
import 'package:jaisalmeria_handloom/models/responses/login_modal.dart';
import 'package:jaisalmeria_handloom/models/responses/logout_modal.dart';
import 'package:jaisalmeria_handloom/pages/sign_up.dart';

class ApiManager {

  static Future<User> registerUser(String firstName, String lastName, String email, String userPassword) async {
    var client = http.Client();
    var res;

    try {
      var response = await client.post(
        BACKEND_URL + '/userRegister',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'firstName': firstName,
          'lastName': lastName,
          'emailId': email,
          'userPassword': userPassword,
        })
      );
      print(response);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        res = User.fromJson(jsonMap);
      }
    } catch (Exception) {
      print('Exception');
      throw Exception('Failed to create user.');
    }

    return res;
  }

  static Future<LoginModal> loginUser(String emailId, String password) async {
    var client = http.Client();
    LoginModal res;

    try {
      var response = await client.post(
        BACKEND_URL + '/userLogin',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'emailId': emailId,
          'password': password,
        })
      );
      print(response);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        res = LoginModal.fromJson(jsonMap);
        print(jsonMap);
      }
    } catch (Exception) {
      print('Exception');
      throw Exception('Failed to login user.');
    }

    return res;
  }


  static Future<LogoutModal> logoutUser(String token, int userId) async {
    var client = http.Client();
    LogoutModal res;

    try {
      var response = await client.post(
        BACKEND_URL + '/logout',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'token': token,
          'userId': userId.toString(),
        })
      );
      print(response);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        res = LogoutModal.fromJson(jsonMap);
        print(jsonMap);
      }
    } catch (Exception) {
      print('Exception');
      throw Exception('Failed to logout user.');
    }

    return res;
  }


  static Future<Catalog> getAllCategories() async {
    var client = http.Client();
    var res;

    try {
      var response = await client.get(
        BACKEND_URL + '/getAllCategories',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        res = Catalog.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
      throw Exception('Failed load catalogs.');
    }
    return res;
  }
}
