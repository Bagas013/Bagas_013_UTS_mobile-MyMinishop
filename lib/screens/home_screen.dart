import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import 'product_list_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      "icon": FontAwesomeIcons.tableTennisPaddleBall,
      "label": "Perlengkapan Olahraga",
    }, // raket
    {"icon": FontAwesomeIcons.pen, "label": "Alat Tulis"}, // pensil/pena
    {"icon": FontAwesomeIcons.headphones, "label": "Aksesoris"}, // headphone
    {"icon": FontAwesomeIcons.guitar, "label": "Alat Musik"}, // gitar
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header AppBar
      appBar: AppBar(
        title: Text(
          "MyShop Mini",
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
                Color.fromARGB(255, 255, 255, 255), // hijau tua
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
      ),

      // Body dengan gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 122, 222, 120),
              Color.fromARGB(255, 58, 99, 57),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "KATEGORI PRODUK",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = constraints.maxWidth < 600
                          ? 2
                          : constraints.maxWidth < 900
                          ? 3
                          : 4;

                      double aspectRatio = constraints.maxWidth < 600
                          ? 0.9
                          : 1.1;

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: aspectRatio,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final cat = categories[index];
                          return CategoryCard(
                            icon: cat["icon"],
                            label: cat["label"],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductListScreen(category: cat["label"]),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
