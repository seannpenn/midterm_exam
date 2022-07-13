import 'dart:convert';

import 'package:fake_api/models/cart.dart';
import 'package:fake_api/models/cart_product.dart';
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

    final response = await http
        .post(Uri.parse('$baseUrl/auth/login'), body: body);

    return response.body;
    // print(response.statusCode);
  }

  Future<List<Product>> getAllProducts() async {
    final products = <Product>[];
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      for(var item in jsonResponse){
        products.add(Product.fromJson(item));
      }
      
      return products;
    }
    return products;
  }

  Future<Product> getProduct(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));
    final jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
    if(response.statusCode == 200){
      return Product.fromJson(jsonResponse);
    }
    return Product.fromJson(jsonResponse);
  }
  Future<List<Product> >getProductsByCategory(String categoryName) async {
    final response = await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    final products = <Product>[];
    final jsonResponse = convert.jsonDecode(response.body);
    if(response.statusCode == 200){
      for(var item in jsonResponse){
        products.add(Product.fromJson(item));
      }
      return products;
    }
    return products;
  }

  Future<List<String>> getAllCategories() async {
    final categories = <String>[];
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      for(var item in jsonResponse){
        categories.add(item);
      }
      
      return categories;
    }
    return categories;
  }

  Future<Cart> getCart(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/carts/$id'));
    final jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
    if(response.statusCode == 200){
      return Cart.fromJson(jsonResponse);
    } 
    return Cart.fromJson(jsonResponse);
  }
  Future<Cart> deleteCart(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/carts/$id'));
    final jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
    if(response.statusCode == 200){
      return Cart.fromJson(jsonResponse);
    } 
    return Cart.fromJson(jsonResponse);
  }
  Future updateCart(String id, int productId,  DateTime date) async {
    final body = {
      'date' : date.toString(),
      'products' : [{'productId': productId, 'quantity': 1}].toString(),
    };

    final response = await http.put(Uri.parse('$baseUrl/carts/$id'), body: body);
    
    final jsonResponse = convert.jsonDecode(response.body);

    if(response.statusCode == 200){
      print(jsonResponse);
    } 
  }
}
