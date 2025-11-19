import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyShopMiniApp()); //menjalankan aplikasi.
}

class MyShopMiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //root widget untuk aplikasi Flutter berbasis Material Design.
      title: 'MyShop Mini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), //adalah halaman pertama yang ditampilkan.
    );
  }
}
