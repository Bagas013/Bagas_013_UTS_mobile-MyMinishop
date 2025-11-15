import 'package:flutter/material.dart'; 
// import library Flutter untuk UI

// Halaman Dashboard utama
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key}); // constructor dengan key opsional

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman: AppBar + body
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")), // AppBar dengan judul
      body: Column(
        children: [
          // Bagian atas: GridView kategori
          Expanded(
            flex: 2, // proporsi tinggi bagian atas lebih besar (2/4 dari layar)
            child: Padding(
              padding: const EdgeInsets.all(8.0), // jarak grid dari tepi layar
              child: GridView.count(
                crossAxisCount: 2, // jumlah kolom grid = 2
                crossAxisSpacing: 10, // jarak horizontal antar card
                mainAxisSpacing: 10, // jarak vertikal antar card
                children: const [
                  // panggil widget _KategoriCard untuk tiap kategori
                  _KategoriCard(icon: Icons.shopping_cart, label: "Produk"),
                  _KategoriCard(icon: Icons.person, label: "Profil"),
                  _KategoriCard(icon: Icons.contact_phone, label: "Kontak"),
                  _KategoriCard(icon: Icons.dashboard, label: "Dashboard"),
                ],
              ),
            ),
          ),

          // Bagian tengah: Card informasi singkat
          Expanded(
            flex: 1, // proporsi sedang (1/4 dari layar)
            child: Padding(
              padding: const EdgeInsets.all(12.0), // jarak card dari tepi
              child: Card(
                color: Colors.blue[50], // warna lembut background card
                elevation: 2, // bayangan ringan
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // sudut membulat
                ),
                child: const Center(
                  child: Text(
                    "Informasi Singkat:\nSelamat datang di aplikasi!",
                    textAlign: TextAlign.center, // teks rata tengah
                    style: TextStyle(
                      fontSize: 16, // ukuran teks
                      fontWeight: FontWeight.w500, // ketebalan sedang
                      color: Colors.black87, // warna teks
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bagian bawah: ListTile aktivitas terakhir
          Expanded(
            flex: 1, // proporsi kecil (1/4 dari layar)
            child: ListView(
              children: const [
                // ListTile pertama: login terakhir
                ListTile(
                  leading: Icon(Icons.history, color: Colors.blue), // ikon di kiri
                  title: Text("Login terakhir"), // judul
                  subtitle: Text("15 November 2025, 20:45 WIB"), // subjudul
                ),
                // ListTile kedua: pesanan terbaru
                ListTile(
                  leading: Icon(Icons.shopping_bag, color: Colors.green),
                  title: Text("Pesanan terbaru"),
                  subtitle: Text("Produk: Hot Wheels Crew"),
                ),
                // ListTile ketiga: pesan masuk
                ListTile(
                  leading: Icon(Icons.message, color: Colors.orange),
                  title: Text("Pesan masuk"),
                  subtitle: Text("Dari: Admin Aplikasi"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget kecil untuk kategori (dipakai di GridView atas)
class _KategoriCard extends StatelessWidget {
  final IconData icon; // ikon kategori
  final String label;  // label teks kategori

  const _KategoriCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[50], // warna lembut background card
      elevation: 2, // bayangan ringan
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
      // sudut membulat
      child: InkWell(
        onTap: () {
          // aksi saat card ditekan → tampilkan snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Membuka $label")),
          );
        },
        borderRadius: BorderRadius.circular(12), // ripple mengikuti sudut card
        splashColor: Colors.blue.withOpacity(0.2), // warna ripple saat tap
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // ukuran kolom sesuai isi
            children: [
              Icon(icon, size: 40, color: Colors.blue), // ikon kategori
              const SizedBox(height: 8), // jarak antara ikon dan teks
              Text(
                label, // teks label kategori
                style: const TextStyle(
                  fontSize: 14, // ukuran teks
                  fontWeight: FontWeight.w500, // ketebalan sedang
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
