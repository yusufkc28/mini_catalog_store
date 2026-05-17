import 'package:flutter/material.dart';

import '../data/cart_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double getTotalPrice() {
  double total = 0;

  for (var item in cartItems) {
    total += item.price;
  }

  return total;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Sepetiniz Boş",
                style: TextStyle(fontSize: 20),
              ),
            )
          :Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final product = cartItems[index];

            return ListTile(
              leading: Image.network(
                product.image,
                width: 50,
              ),
              title: Text(product.title),
              subtitle: Text("\$${product.price}"),
              trailing: IconButton(
                 icon: const Icon(
                      Icons.delete,
                            color: Colors.red,
                          ),
                       onPressed: () {
                          setState(() {
                           cartItems.removeAt(index);
                       });
                       }, 
      ),
            );
          },
        ),
      ),

      Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "\$${getTotalPrice().toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        
      ),
      const SizedBox(height: 20),

SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    onPressed: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Ödeme işlemi Yakında Eklenecek",
          ),
        ),
      );
    },
    child: const Text(
      "Ödeme Sayfasına Git",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
    ],
  ),
  
    );
  }
}
    