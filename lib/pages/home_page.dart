import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'cart_page.dart';
import 'favorites_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> filteredProducts = products;
  int currentIndex = 0;

  void searchProduct(String value) {
    setState(() {
      filteredProducts = products.where((product) {
        return product.title
            .toLowerCase()
            .contains(value.toLowerCase());
      }).toList();
    });
  }

  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
  backgroundColor: const Color(0xFF1E293B),
  selectedItemColor: Colors.deepPurple,
  unselectedItemColor: Colors.grey,
  currentIndex: currentIndex,
  onTap: (index) {
  setState(() {
    currentIndex = index;
  });

 if (index == 1) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const FavoritesPage(),
    ),
  );
}

if (index == 2) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const CartPage(),
    ),
  );
}
if (index == 3) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ProfilePage(),
    ),
  );
}
},
  items: const [
    
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Anasayfa",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favorilerim",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: "Sepetim",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profilim",
    ),
  ],
),
      appBar: AppBar(
        title: const Text("Mini Market"),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                      Navigator.push(
                      context,
                         MaterialPageRoute(
                             builder: (_) => const CartPage(),
               ),
                  );
        },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    cartCount.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1522199755839-a2bacb67c546",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              onChanged: searchProduct,
              decoration: InputDecoration(
                hintText: "Ürün Ara...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: filteredProducts[index],
                    onAddToCart: () {
                      setState(() {
                        cartCount++;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${filteredProducts[index].title} Ürün Sepete Eklendi",
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}