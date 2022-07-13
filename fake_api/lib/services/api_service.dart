import 'dart:convert';

import 'package:fake_api/models/cart.dart';
import 'package:fake_api/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future login(String username, String password) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response =
        await http.post(Uri.parse('$baseUrl/auth/login'), body: body);

    return response.body;
    // print(response.statusCode);
  }

  Future<List<Product>?> getAllProducts() async {
    final products = <Product>[];
    return http.get(Uri.parse('$baseUrl/products')).then((data) {
      if (data.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(data.body);
        print(jsonResponse);
        for (var item in jsonResponse) {
          products.add(Product.fromJson(item));
        }
        return products;
      }
    }).catchError((error) => print(error));
  }

  Future<Product> getProduct(int id) async {
    return http.get(Uri.parse('$baseUrl/products/$id')).then((data) {
      final jsonResponse = convert.jsonDecode(data.body);
      if (data.statusCode == 200) {
        print(jsonResponse);
        return Product.fromJson(jsonResponse);
      }
      return Product.fromJson(jsonResponse);
    }).catchError((error) => print(error));
  }

  Future<List<Product>> getProductsByCategory(String categoryName) async {
    final products = <Product>[];
    return http
        .get(Uri.parse('$baseUrl/products/category/$categoryName'))
        .then((data) {
      final jsonResponse = convert.jsonDecode(data.body);

      if (data.statusCode == 200) {
        for (var item in jsonResponse) {
          products.add(Product.fromJson(item));
        }
      }
      return products;
    }).catchError((error) => print(error));
  }

  Future<List<String>> getAllCategories() async {
    final categories = <String>[];
    return http.get(Uri.parse('$baseUrl/products/categories')).then((data) {
      if (data.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(data.body);
        for (var item in jsonResponse) {
          categories.add(item);
        }

        return categories;
      }
      return categories;
    }).catchError((error) => print(error));
  }

  Future<Cart> getCart(String id) async {
    return http.get(Uri.parse('$baseUrl/carts/$id')).then((data) {
      final jsonResponse = convert.jsonDecode(data.body);
      print(jsonResponse);
      if (data.statusCode == 200) {
        return Cart.fromJson(jsonResponse);
      }
      return Cart.fromJson(jsonResponse);
    }).catchError((error) => print(error));
  }

  Future<Cart> deleteCart(String id) async {
    return http.delete(Uri.parse('$baseUrl/carts/$id')).then((data) {
      final jsonResponse = convert.jsonDecode(data.body);
      print(jsonResponse);

      if (data.statusCode == 200) {
        return Cart.fromJson(jsonResponse);
      }
      return Cart.fromJson(jsonResponse);
    }).catchError((error) => print(error));
  }

  Future updateCart(String id, int productId, DateTime date) async {
    final body = {
      'date': date.toString(),
      'products': [
        {'productId': productId, 'quantity': 1}
      ].toString(),
    };

    final response =
        await http.put(Uri.parse('$baseUrl/carts/$id'), body: body);

    final jsonResponse = convert.jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(jsonResponse);
    }
  }
}
