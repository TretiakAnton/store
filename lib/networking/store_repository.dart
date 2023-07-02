import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/models/product.dart';

class StoreRepository {
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getProducts() async {
    final allProductsUri = Uri.parse('$_baseUrl/products');
    final response = await http.get(allProductsUri);
    List<Product> productList = jsonDecode(response.body)
        .map<Product>((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
    return productList;
  }
}
