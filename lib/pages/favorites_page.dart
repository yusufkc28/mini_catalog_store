import 'package:flutter/material.dart';

import '../data/favorite_data.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorilerim"),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                "Henüz Favori Ürün Yok",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final product = favoriteItems[index];

                return ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                  ),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                );
              },
            ),
    );
  }
}