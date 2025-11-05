1. Apa itu widget tree dan hubungan parent-child di Flutter?
Widget tree di Flutter bisa dibilang seperti “pohon keluarga” dari tampilan aplikasi. Setiap elemen di layar—seperti teks, tombol, atau layout—adalah sebuah widget yang saling bertingkat. Widget paling atas disebut parent (induk), dan widget di dalamnya disebut child (anak). Misalnya, Scaffold bisa jadi induk dari Column, dan Column punya beberapa anak seperti ElevatedButton atau Text. Jadi, hubungan parent-child ini menentukan bagaimana tampilan disusun dan bagaimana satu widget bisa mengatur posisi atau perilaku widget lain di dalamnya.

2. Widget apa saja yang digunakan dalam proyek ini dan fungsinya?
Dalam proyek ini, ada beberapa widget utama:

MaterialApp → jadi pembungkus utama aplikasi dan mengatur tema, judul, serta navigasi.
Scaffold → menyediakan struktur dasar halaman seperti app bar dan body.
AppBar → menampilkan judul di bagian atas layar.
Center → memusatkan isi tampilan ke tengah layar.
Column → menyusun widget lain secara vertikal.
ElevatedButton.icon → tombol yang bisa ditekan dengan ikon dan teks di dalamnya.
Icon dan Text → menampilkan gambar ikon dan tulisan di tombol.
SnackBar dan ScaffoldMessenger → menampilkan pesan sementara di bagian bawah layar.

Semua widget ini bekerja sama membentuk tampilan aplikasi Football Shop yang interaktif.



3. Apa fungsi dari widget MaterialApp dan kenapa sering jadi root?
MaterialApp berfungsi sebagai “pembungkus utama” yang menyediakan semua hal penting agar aplikasi terlihat seperti aplikasi Android modern—misalnya tema warna, font, dan efek transisi khas Material Design. Widget ini juga mengatur navigasi antar halaman serta mengelola route. Karena MaterialApp menyiapkan semua dasar tampilan dan gaya aplikasi, biasanya ia ditempatkan di paling atas (root) agar semua widget di bawahnya bisa mengikuti pengaturan dan gaya yang sama.

4. Perbedaan StatelessWidget dan StatefulWidget, serta kapan digunakan.
StatelessWidget digunakan saat tampilan tidak berubah meskipun pengguna berinteraksi, contohnya teks statis atau tombol yang hanya menampilkan pesan. Sedangkan StatefulWidget dipakai kalau tampilan bisa berubah berdasarkan keadaan tertentu, misalnya ketika menghitung angka atau mengganti warna. Jadi, kalau kamu butuh tampilan yang tetap sama, pakai StatelessWidget; tapi kalau butuh tampilan yang bisa diperbarui, pilih StatefulWidget.

5. Apa itu BuildContext dan kenapa penting di Flutter?
BuildContext bisa dianggap sebagai “alamat” atau “lokasi” dari sebuah widget di dalam pohon widget (widget tree). Dengan context, Flutter tahu posisi widget itu berada di mana dan siapa parent-nya. Context ini juga dipakai untuk mengakses hal-hal di atasnya, seperti tema, ukuran layar, atau menampilkan SnackBar. Karena itu, BuildContext penting di dalam metode build() supaya Flutter bisa menggambar tampilan dengan benar sesuai tempat widget itu berada.

6. Apa itu hot reload dan bedanya dengan hot restart?
Hot reload adalah fitur Flutter yang memungkinkan kamu melihat hasil perubahan kode hampir seketika tanpa kehilangan posisi atau data di aplikasi. Misalnya, kalau kamu ubah teks atau warna, tinggal simpan dan hasilnya langsung muncul. Sedangkan hot restart membuat aplikasi dijalankan ulang dari awal, jadi semua data dan variabel akan di-reset. Intinya, hot reload cepat untuk ubah tampilan, sedangkan hot restart dipakai kalau ada perubahan besar di struktur aplikasi.