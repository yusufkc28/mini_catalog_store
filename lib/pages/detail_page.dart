import 'package:flutter/material.dart';
import '../data/cart_data.dart';
import '../models/product_model.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: Image.network(
                product.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      
                     onPressed: () {
                          cartItems.add(product);
                          

                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                    content: Text("${product.title} Ürün Sepete Eklendi"),
                            ),
                             );
                  },
                  
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text(
                        "Sepete Ekle",
                        style: TextStyle(fontSize: 18),
                        
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}