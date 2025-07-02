import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String title;
  final String price;
  final String description;
  final String? comparePrice;
  final String? sku;
  final String? modelNumber;
  final int stock;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.comparePrice,
    this.sku,
    this.modelNumber,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      description: json['description'] ?? '',
      comparePrice: json['compare_price']?.toString(),
      sku: json['sku'],
      modelNumber: json['model_number'],
      stock: json['stock_quantity'] ?? 0,
    );
  }
}

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  late Future<List<Product>> products;
  final Set<int> _expandedTiles = {}; // track which items are expanded

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('http://192.168.56.1:8000/api/products/'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No products found',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                final isExpanded = _expandedTiles.contains(index);

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  color: Colors.grey[850],
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isExpanded) {
                          _expandedTiles.remove(index);
                        } else {
                          _expandedTiles.add(index);
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main product row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                '₹${product.price}',
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 16,
                                ),
                              ),
                              const Icon(
                                Icons.expand_more,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                          if (isExpanded) const SizedBox(height: 10),

                          // Expanded content
                          if (isExpanded)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.description,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 8),
                                if (product.comparePrice != null)
                                  Text(
                                    'Compare Price: ₹${product.comparePrice}',
                                    style: const TextStyle(
                                      color: Colors.redAccent,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                if (product.sku != null)
                                  Text(
                                    'SKU: ${product.sku}',
                                    style: const TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                if (product.modelNumber != null)
                                  Text(
                                    'Model: ${product.modelNumber}',
                                    style: const TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                Text(
                                  'Stock: ${product.stock}',
                                  style: const TextStyle(
                                    color: Colors.amberAccent,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
