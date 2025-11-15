import 'package:flutter/material.dart';

class DaftarProdukPage extends StatelessWidget {
  const DaftarProdukPage({super.key});

  // Data produk: name, price, icon
  // List berisi map untuk setiap produk: nama, harga, dan path gambar
  final List<Map<String, dynamic>> products = const [
    {"name": "Crew", "price": "Rp 50.000", "image": "assets/images/hott1.png"},
    {"name": "Rex", "price": "Rp 40.000", "image": "assets/images/hott2.png"},
    {
      "name": "Erratic",
      "price": "Rp 60.000",
      "image": "assets/images/hott3.png",
    },
    {"name": "Madz", "price": "Rp 100.000", "image": "assets/images/hott4.png"},
    {"name": "Dumbz", "price": "Rp 50.000", "image": "assets/images/hott7.png"},
    {"name": "Sam", "price": "Rp 55.000", "image": "assets/images/hott6.png"},
    {"name": "Horeg", "price": "Rp 40.000", "image": "assets/images/hott5.png"},
    {
      "name": "Destroy",
      "price": "Rp 80.000",
      "image": "assets/images/hott8.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold menyediakan struktur dasar halaman: AppBar, body, dll
      backgroundColor: const Color.fromARGB(
        255,
        27,
        176,
        221,
      ), //warna background utama
      appBar: AppBar(title: const Text("Hot Wheels Garage")),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // jarak dari tepi layar ke grid
        child: GridView.builder(
          // GridView.builder digunakan untuk membuat grid dinamis sesuai jumlah produk
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // jumlah kolom grid (2 berarti 2 card per baris)
            childAspectRatio: 3 / 4, // rasio lebar / tinggi card
            crossAxisSpacing: 10, // jarak horizontal antar card
            mainAxisSpacing: 10, // jarak vertikal antar card
          ),
          itemCount:
              products.length, // jumlah item sesuai panjang list products
          itemBuilder: (context, index) {
            final product =
                products[index]; // ambil data produk berdasarkan index

            // Material + InkWell digunakan agar card bisa ditekan (tap) dengan efek ripple
            return Material(
              color: Colors.transparent, // biar background tetap dari Container
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {
                  // aksi saat card ditekan
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('pesan ${product["name"]}')),
                  );
                },
                borderRadius: BorderRadius.circular(
                  12,
                ), // ripple mengikuti sudut card
                splashColor: Colors.blue.withOpacity(
                  0.2,
                ), // warna ripple saat tap
                highlightColor: const Color.fromARGB(
                  255,
                  0,
                  0,
                  0,
                ).withOpacity(0.1), // warna highlight saat ditekan
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ), // warna background card
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12, // warna bayangan
                        blurRadius: 6, // seberapa blur bayangan
                        offset: Offset(2, 4), // posisi bayangan 
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // padding isi card
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //INI BAGIAN CARD
                      // posisi isi card di tengah vertikal
                      children: [
                        Column(
                          children: [
                            // GAMBAR PRODUK
                            Image.asset(
                              product["image"], // path gambar dari list
                              height: 120, // atur tinggi gambar
                              width: 120, // atur lebar gambar
                              fit: BoxFit
                                  .contain, // cara gambar menyesuaikan ukuran box
                            ),
                            const SizedBox(
                              height: 10,
                            ), // jarak antara icon dan teks nama
                            // NAMA PRODUK
                            Text(
                              product["name"], // ambil nama produk dari list
                              style: const TextStyle(
                                fontSize: 16, // ukuran teks nama
                                fontWeight: FontWeight.bold, // tebal teks
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ), // jarak antara nama dan harga
                            // HARGA PRODUK
                            Text(
                              product["price"], // ambil harga produk dari list
                              style: const TextStyle(
                                fontSize: 14, // ukuran teks harga
                                color: Color.fromARGB(255, 0, 0, 0), // warna teks harga
                              ),
                            ),
                          ],
                        ),
                        // Tombol Pesan
                        ElevatedButton(
                          onPressed: () {
                            // aksi saat tombol ditekan
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Pesan ${product["name"]}'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // warna tombol
                            foregroundColor: Colors.white, // warna teks tombol
                            minimumSize: const Size(
                              double.infinity,
                              30,
                            ), // tombol full lebar dan cukup tinggi
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8,
                              ), // sudut tombol membulat
                            ),
                          ),
                          child: const Text("Pesan"), // teks tombol
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
