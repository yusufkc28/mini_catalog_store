import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../pages/detail_page.dart';
import '../data/cart_data.dart';
import '../data/favorite_data.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
    BoxShadow(
      color: Colors.black.withAlpha(  50),
      blurRadius: 10,
      offset: const Offset(0, 5),
    ),
  ],
      ),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      product: widget.product,
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Hero(
                    tag: widget.product.id,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                        
                      ),
                     child: SizedBox(
  height: 180,
  width: double.infinity,
  child: Image.network(
    widget.product.image,
    fit: BoxFit.contain,
  ),
),
                          
                          
                    ),
                    
                  ),
                  

                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;

                          if (isFavorite) {
                            favoriteItems.add(widget.product);
                          } else {
                            favoriteItems.remove(widget.product);
                          }
                        });
                      },
                      child: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "\$${widget.product.price}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      cartItems.add(widget.product);

                      widget.onAddToCart();
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Sepete Ekle"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}