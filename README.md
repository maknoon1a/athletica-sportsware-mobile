TUGAS 7

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


TUGAS 8

1. Perbedaan antara Navigator.push() dan Navigator.pushReplacement() serta kapan digunakan
Navigator.push() digunakan untuk membuka halaman baru di atas halaman sebelumnya, jadi pengguna masih bisa balik lagi pakai tombol back. Sementara Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru, jadi halaman sebelumnya langsung hilang dari stack dan nggak bisa dikembaliin lagi.
Di aplikasi Football Shop, push() cocok buat navigasi dari Menu ke halaman form Tambah Produk biar pengguna bisa balik. Sedangkan pushReplacement() bisa dipakai setelah produk disimpan, biar langsung pindah ke halaman daftar produk tanpa bisa balik ke form.

2. Pemanfaatan hierarchy widget seperti Scaffold, AppBar, dan Drawer
Ketiga widget ini penting buat bikin struktur halaman yang konsisten di semua bagian aplikasi. Scaffold jadi kerangka utama halaman tempat naro komponen kayak AppBar, body, sama Drawer. AppBar dipakai buat nampilin judul halaman atau identitas aplikasi biar pengguna tahu mereka tetap di dalam Football Shop. Sedangkan Drawer berisi menu navigasi biar user bisa pindah antarhalaman dengan mudah tanpa tombol tambahan.

3. Kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView pada form
Widget layout ini bantu tampilan form biar tetap rapi dan responsif di berbagai ukuran layar. Padding ngasih jarak antar elemen biar nggak nempel satu sama lain, SingleChildScrollView bikin form bisa di-scroll saat layar kecil supaya nggak overflow, dan ListView bantu nampilin banyak elemen form secara vertikal dengan mudah. Misalnya di halaman Tambah Produk, form disusun pakai Padding dan ListView supaya semua field tertata rapi dan bisa di-scroll mulus.

4. Penyesuaian warna tema agar aplikasi punya identitas visual yang konsisten
Warna tema bikin aplikasi punya ciri khas yang mudah diingat pengguna. Di Football Shop, warna biru dipakai secara konsisten di AppBar, tombol utama, dan elemen penting lain buat ngasih kesan profesional dan sporty. Dengan begitu, tiap halaman tetap terasa satu kesatuan, nggak terpisah-pisah.