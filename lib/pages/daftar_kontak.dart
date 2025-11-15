import 'package:flutter/material.dart'; 

// Widget utama untuk halaman daftar kontak
class DaftarKontakPage extends StatelessWidget {
  const DaftarKontakPage({super.key}); 
  // constructor dengan key opsional

  // Data kontak: nama, nomor, status
  // List berisi map untuk setiap kontak
  final List<Map<String, dynamic>> contacts = const [
    {"nama": "Bagas", "nomor": "081234567890", "status": "Online"},
    {"nama": "Rizki", "nomor": "082345678901", "status": "Offline"},
    {"nama": "Begi", "nomor": "083456789012", "status": "Away"},
  ];

  // Fungsi untuk menentukan warna status berdasarkan string status
  Color _statusColor(String status) {
    switch (status) {
      case "Online":
        return Colors.green; // hijau untuk online
      case "Offline":
        return Colors.red;   // merah untuk offline
      case "Away":
        return Colors.orange; // oranye untuk away
      default:
        return Colors.grey;  // default abu-abu
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman: AppBar + body
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Kontak")), 
      // AppBar dengan judul

      body: ListView.builder(
        // ListView.builder digunakan untuk membuat daftar dinamis
        itemCount: contacts.length, // jumlah item sesuai panjang list contacts
        itemBuilder: (context, index) {
          final contact = contacts[index]; 
          // ambil data kontak berdasarkan index

          return Card(
            elevation: 2, // bayangan ringan untuk card
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), 
            // jarak antar card

            child: ListTile(
              // ListTile memudahkan membuat layout standar: leading, title, subtitle, trailing
              leading: CircleAvatar(
                child: const Icon(Icons.person), 
                // avatar bulat dengan ikon orang
              ),

              title: Text(
                contact["nama"], // tampilkan nama kontak
                style: const TextStyle(fontWeight: FontWeight.bold), 
                // nama ditampilkan tebal
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                // teks rata kiri
                children: [
                  Text(contact["nomor"]), // tampilkan nomor telepon
                  Row(
                    children: [
                      Icon(
                        Icons.circle, 
                        size: 10, 
                        color: _statusColor(contact["status"]), 
                        // indikator status dengan warna sesuai fungsi
                      ),
                      const SizedBox(width: 6), // jarak kecil antar ikon dan teks
                      Text(contact["status"]), // tampilkan status (Online/Offline/Away)
                    ],
                  ),
                ],
              ),

              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.blue), 
                // tombol panggil dengan ikon telepon
                onPressed: () {
                  // aksi saat tombol ditekan
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Memanggil ${contact["nama"]}")), 
                    // tampilkan snackbar sebagai feedback
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
