import 'package:flutter/material.dart';
import 'package:mobile_app/models/product_model.dart';
import 'package:mobile_app/services/product_service.dart'; // import service

class SearchResultsPage extends StatefulWidget {
  final String query;

  const SearchResultsPage({super.key, required this.query});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  Future<void> fetchSearchResults() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final results = await searchProducts(widget.query);
      setState(() => _products = results);
    } catch (e) {
      setState(() => _error = 'Failed to fetch search results.');
    }

    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchSearchResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Results for '${widget.query}'"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : _error != null
          ? Center(
              child: Text(
                _error!,
                style: const TextStyle(color: Colors.redAccent),
              ),
            )
          : _products.isEmpty
          ? const Center(
              child: Text(
                "No products found",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: _products.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final product = _products[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.broken_image,
                              color: Colors.white54,
                            ),
                      ),
                    ),
                    title: Text(
                      product.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '₹${product.price}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
    );
  }
}
