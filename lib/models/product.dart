import 'package:flutter/material.dart';

class Product {
  //model data untuk produk.
  final String name;
  final IconData icon;
  final double price;
  final String category;
  final String description;

  Product({
    required this.name,
    required this.icon,
    required this.price,
    required this.category,
    required this.description,
  });
}
