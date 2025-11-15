import 'package:flutter/material.dart';
import 'pages/daftar_produk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DaftarProdukPage(), // panggil page dari folder pages
    );
  }
}
