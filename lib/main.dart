import 'package:flutter/material.dart';
import 'pages/daftar_produk.dart';
import 'pages/profil_mahasiswa.dart';
import 'pages/daftar_kontak.dart';
import 'pages/dashboard.dart';

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
      home: const DaftarProdukPage(), // halaman awal
      routes: {
        '/produk': (context) => const DaftarProdukPage(), //SOAL 1
        '/profil': (context) => const ProfilMahasiswaPage(), //SOAL 2
        '/kontak': (context) => const DaftarKontakPage(), // SOAL 3
        '/dashboard': (context) => const DashboardPage(), // SOAL 4
      },
    );
  }
}
