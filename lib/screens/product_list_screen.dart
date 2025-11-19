import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductListScreen extends StatelessWidget {
  final String category;

  ProductListScreen({required this.category});

  // Data dummy produk
  final List<Product> products = [
    //PERLENGKAPAN OLAHRAGA
    Product(
      name: "Bola Basket",
      icon: FontAwesomeIcons.basketball,
      price: 80000,
      category: "Perlengkapan Olahraga",
      description: "Bola Yosan: berkualitas dan harga terjangkau.",
    ),
    Product(
      name: "Bola Futsal",
      icon: FontAwesomeIcons.futbol,
      price: 100000,
      category: "Perlengkapan Olahraga",
      description: "Bola Adidas: berkualitas untuk latihan dan pertandingan.",
    ),
    Product(
      name: "Raket Tenis Meja",
      icon: FontAwesomeIcons.tableTennisPaddleBall,
      price: 150000,
      category: "Perlengkapan Olahraga",
      description:
          "Raket Badminton sakai: berkualitas untuk latihan dan pertandingan.",
    ),
    Product(
      name: "Raket Padel",
      icon: FontAwesomeIcons.tableTennisPaddleBall,
      price: 500000,
      category: "Perlengkapan Olahraga",
      description:
          "Raket Tenis Serena: berkualitas dan sangat nyaman saat digunakan.",
    ),
    //ALAT TULIS
    Product(
      name: "Pensil",
      icon: FontAwesomeIcons.pen,
      price: 2000,
      category: "Alat Tulis",
      description:
          "Pensil Faber castle: Berkualitas dan harga terjangkau baik untuk menulis ataupun menggambar.",
    ),
    Product(
      name: "Penghapus",
      icon: FontAwesomeIcons.eraser,
      price: 2000,
      category: "Alat Tulis",
      description:
          "Pensil Faber castle: Berkualitas dan harga terjangkau baik untuk menulis ataupun menggambar.",
    ),
    Product(
      name: "Buku Tulis",
      icon: FontAwesomeIcons.book,
      price: 5000,
      category: "Alat Tulis",
      description:
          "Buku Tulis Sidu: berkualitas dan sangat nyaman untuk digunakan untuk mencatat.",
    ),
    Product(
      name: "Penggaris",
      icon: FontAwesomeIcons.ruler, 
      price: 4000,
      category: "Alat Tulis",
      description:
          "Penggaris plastik 30 cm: ringan dan akurat untuk menggambar.",
    ),
    // AKSESORIS
    Product(
      name: "Headphone",
      icon: Icons.headphones,
      price: 250000,
      category: "Aksesoris",
      description:
          "Headphone JBL: nyaman saat digunakan dan kualitas suara sangat bagus.",
    ),
    Product(
      name: "Speaker",
      icon: Icons.speaker,
      price: 250000,
      category: "Aksesoris",
      description:
          "Headphone JBL: nyaman saat digunakan dan kualitas suara sangat bagus.",
    ),
    //ALAT MUSIK
    Product(
      name: "Gitar",
      icon: FontAwesomeIcons.guitar,
      price: 250000,
      category: "Alat Musik",
      description: "Gitar Yamaha: berkualitas dan nyaman untuk digunakan.",
    ),
    Product(
      name: "Pianika",
      icon: FontAwesomeIcons.keyboard,
      price: 250000,
      category: "Alat Musik",
      description:
          "Pianika Yamaha: nyaman saat digunakan dan kualitas suara sangat bagus.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((p) => p.category == category)
        .toList();

    return Scaffold(
      // Header AppBar sama seperti HomeScreen
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 14, 60, 14),
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 238, 241, 238), // hijau muda
                Color.fromARGB(255, 255, 255, 255), // putih
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
      ),

      // Body dengan gradient background sama seperti HomeScreen
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 122, 222, 120), // hijau muda
              Color.fromARGB(255, 58, 99, 57), // hijau tua
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: filteredProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return ProductCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(product: product),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
