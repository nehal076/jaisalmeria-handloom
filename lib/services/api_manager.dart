import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jaisalmeria_handloom/models/constants.dart';
import 'package:jaisalmeria_handloom/models/responses/catalog_model.dart';
import 'package:jaisalmeria_handloom/models/responses/login_modal.dart';
import 'package:jaisalmeria_handloom/models/responses/logout_modal.dart';
import 'package:jaisalmeria_handloom/models/responses/product_details_model.dart';
import 'package:jaisalmeria_handloom/models/responses/product_model.dart';
import 'package:jaisalmeria_handloom/pages/sign_up.dart';

class ApiManager {

  static Future<User> registerUser(String firstName, String lastName, String email, String userPassword) async {
    var client = http.Client();
    var res;

    try {
      var response = await client.post(
        BACKEND_URL + '/registerUser',
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
      Map<String, String> queryParams = {
        'emailId': emailId,
        'password': password,
      };
      String queryString = Uri(queryParameters: queryParams).query;

    try {
      var response = await client.get(
        BACKEND_URL + '/loginUser' + '?' + queryString,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
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
          'Content-Type': 'application/json; charset=UTF-8'
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

  static Future<Product> getProducts(String categoryId) async {
    var client = http.Client();
    var res;
    
    try {
      Map<String, String> queryParams = {
        'categoryId': categoryId,
      };
      String queryString = Uri(queryParameters: queryParams).query;

      var response = await client.get(
        BACKEND_URL + '/getProducts'+ '?' + queryString,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        res = Product.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
      throw Exception('Failed load products.');
    }
    return res;
  }

  static Future<ProductDetails> getProductDetails(String productId) async {
    var client = http.Client();
    var res;
    
    try {
      Map<String, String> queryParams = {
        'productId': productId,
      };
      String queryString = Uri(queryParameters: queryParams).query;

      var response = await client.get(
        BACKEND_URL + '/getProductDetails'+ '?' + queryString,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        res = ProductDetails.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
      throw Exception('Failed load products.');
    }
    return res;
  }

  static Future<Product> getNewArrivals() async {
    var client = http.Client();
    var res;
    
    try {
      var response = await client.get(
        BACKEND_URL + '/getNewArrivals',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        res = Product.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
      throw Exception('Failed load products.');
    }
    return res;
  }

  static Future<Product> getBestSelling() async {
    var client = http.Client();
    var res;
    
    try {
      var response = await client.get(
        BACKEND_URL + '/getBestSelling',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        res = Product.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
      throw Exception('Failed load products.');
    }
    return res;
  }

  
}
