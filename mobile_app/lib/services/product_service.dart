import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/product_model.dart';

Future<List<Product>> searchProducts(String query) async {
  final url = Uri.parse(
    'http://192.168.29.92:8000/api/products/?search=$query',
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load search results');
  }
}
