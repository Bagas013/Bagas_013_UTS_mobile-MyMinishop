import 'package:flutter/material.dart';

// Widget Card Mahasiswa
class MahasiswaCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String prodi;
  final String foto;

  const MahasiswaCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.foto,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // biar ripple bisa muncul
      child: InkWell(
        onTap: () {
          // aksi saat card ditekan
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Detail: $nama")),
          );
        },
        borderRadius: BorderRadius.circular(12), // ripple mengikuti sudut card
        splashColor: Colors.blue.withOpacity(0.2), // warna ripple
        highlightColor: Colors.blue.withOpacity(0.1), // highlight saat ditekan
        child: Card(
          color: Colors.blue[50], // warna lembut background card
          elevation: 2, // bayangan ringan
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // sudut membulat
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0), // jarak proporsional isi card
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Foto profil
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(foto),
                ),
                const SizedBox(height: 12), // jarak antar elemen
                // Nama lengkap
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // NIM
                Text(
                  "NIM: $nim",
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                // Program studi
                Text(
                  "Prodi: $prodi",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                // Tombol aksi
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Lihat detail $nama")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Lihat Detail"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Halaman Profil Mahasiswa
class ProfilMahasiswaPage extends StatelessWidget {
  const ProfilMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Mahasiswa")),
      body: Center(
        child: MahasiswaCard(
          nama: "Bagas Fais Rizki Begi",
          nim: "123456789",
          prodi: "Teknik Informatika",
          foto: "assets/images/profil.png",
        ),
      ),
    );
  }
}
