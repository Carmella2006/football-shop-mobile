<details>
<summary>Tugas 7</summary>

## 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah struktur hierarki dari semua widget di aplikasi Flutter. Setiap elemen UI di Flutter adalah widget, dan widget bisa memiliki widget lain di dalamnya (disebut child). Hubungan parent-child menunjukkan bahwa widget parent “mengandung” dan mengatur widget child. Misalnya, `Column` adalah parent dari beberapa `Text` widget di dalamnya.

---

## 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
| Widget | Fungsi |
|--------|---------|
| `MaterialApp` | Widget utama yang menjadi dasar aplikasi berbasis Material Design. |
| `Scaffold` | Menyediakan struktur dasar halaman seperti AppBar dan body. |
| `AppBar` | Bagian atas halaman yang menampilkan judul aplikasi. |
| `Column` | Menyusun widget secara vertikal. |
| `Row` | Menyusun widget secara horizontal. |
| `Card` | Menampilkan elemen dalam bentuk kartu dengan bayangan. |
| `GridView.count` | Menampilkan grid layout dengan jumlah kolom tertentu. |
| `Text` | Menampilkan teks pada layar. |
| `Icon` | Menampilkan ikon. |
| `SnackBar` | Menampilkan notifikasi sementara di bawah layar. |
| `InkWell` | Memberikan efek klik pada widget dan menangani aksi onTap. |
| `Material` | Menentukan latar dan bentuk dari widget dengan gaya Material. |

---

## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
`MaterialApp` adalah widget root yang menyediakan konfigurasi dasar aplikasi Flutter, seperti tema, rute, dan judul aplikasi. Widget ini penting karena mengatur tampilan dan perilaku sesuai standar Material Design dari Google.

---

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
- **StatelessWidget** tidak memiliki keadaan (state) yang berubah; tampilannya konstan selama aplikasi berjalan.
- **StatefulWidget** memiliki state yang bisa berubah dan memicu build ulang tampilan.  
Gunakan `StatelessWidget` untuk UI statis dan `StatefulWidget` untuk UI dinamis (misalnya ketika data berubah).

---

## 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
`BuildContext` adalah objek yang menghubungkan widget ke lokasi mereka dalam widget tree.  
Ia penting karena memungkinkan widget mengakses informasi dari widget parent, seperti tema, ukuran layar, atau navigasi.  
Biasanya digunakan di dalam metode `build(BuildContext context)` untuk mengakses context saat membangun UI.

---

## 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
- **Hot Reload** memperbarui kode tanpa kehilangan state aplikasi (misalnya posisi halaman atau input user tetap sama).  
- **Hot Restart** me-restart seluruh aplikasi dari awal dan menghapus seluruh state yang tersimpan.  
Hot reload digunakan saat ingin melihat perubahan UI cepat tanpa memulai ulang aplikasi.

</details>

<details>
<summary>Tugas 8</summary>

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Pada Flutter, kedua method ini digunakan untuk navigasi antar halaman, namun memiliki perbedaan penting dalam cara mereka menumpuk (stacking) halaman di memori.
| Metode                            | Penjelasan                                                                                                                                                         | Contoh Kasus di Aplikasi                                                                                                                                                                                                                                                                                                                                    |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`Navigator.push()`**            | Menambahkan halaman baru di atas halaman sebelumnya tanpa menghapus halaman lama. Pengguna masih bisa menekan tombol **back** untuk kembali ke halaman sebelumnya. | Saat pengguna menekan tombol **Tambah Produk** dari halaman utama menuju ke halaman form tambah produk. Setelah selesai mengisi form, pengguna mungkin ingin kembali ke halaman utama, jadi `Navigator.push()` lebih cocok.                                                                                                                                 |
| **`Navigator.pushReplacement()`** | Mengganti halaman saat ini dengan halaman baru, sehingga halaman lama dihapus dari stack. Tombol **back** tidak akan mengembalikan pengguna ke halaman sebelumnya. | Cocok digunakan jika kita tidak ingin pengguna kembali ke halaman lama, misalnya setelah **login** atau **splash screen**. Pada aplikasi Football Shop, ini bisa digunakan jika nanti kita menambahkan halaman **login**, setelah login sukses kita bisa langsung `pushReplacement()` ke halaman utama agar pengguna tidak bisa kembali ke halaman login. |

---

## 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Flutter menggunakan konsep widget tree, di mana setiap komponen antarmuka adalah bagian dari hierarki widget.
Pada aplikasi Football Shop:
Scaffold berperan sebagai kerangka dasar halaman, menyediakan struktur umum yang konsisten seperti area untuk AppBar, body, dan Drawer.

<pre>return Scaffold(
    appBar: AppBar(title: const Text("Create New Product")),
    drawer: const LeftDrawer(),
    body: ...
); </pre>

AppBar digunakan untuk menampilkan judul halaman seperti “Football Shop” atau “Create New Product”, membantu pengguna tahu konteks halaman yang sedang dibuka.
Drawer memberikan navigasi yang konsisten di seluruh halaman (misalnya ke Home dan Add Product Form), sehingga pengguna bisa berpindah halaman dengan mudah dari mana saja.
Dengan struktur ini, setiap halaman di aplikasi memiliki tampilan dan navigasi yang seragam, memudahkan pengguna dan menjaga konsistensi desain aplikasi.

---

## 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Widget layout membantu mengatur tampilan agar rapi, mudah dibaca, dan responsif di berbagai ukuran layar.

| Widget                      | Kelebihan                                                                                                                                       | Contoh Penggunaan di Football Shop                                                                     |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| **`Padding`**               | Menambahkan jarak antar elemen agar tampilan tidak terlalu rapat dan lebih nyaman dilihat.                                                      | Digunakan pada form untuk memberi jarak antar field input (`padding: EdgeInsets.all(16.0)`).           |
| **`SingleChildScrollView`** | Membuat seluruh halaman bisa di-*scroll*, mencegah error *overflow* saat form terlalu panjang untuk layar kecil.                                | Dipakai di `AddProductFormPage` agar pengguna bisa menggulir semua field form meskipun di layar kecil. |
| **`ListView`**              | Cocok untuk menampilkan daftar elemen dinamis seperti produk, karena bisa otomatis *scroll* vertikal dan menghemat memori lewat *lazy loading*. | Bisa digunakan nanti di halaman “All Products” untuk menampilkan daftar produk.                        |


Contoh dari Football Shop:
<pre>body: Form(
    key: _formKey,
    child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [ ... ],
        ),
    ),
) </pre>

---

## 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko, warna tema disesuaikan melalui properti seperti AppBar.backgroundColor dan ElevatedButton.styleFrom().

Contoh implementasi:
<pre>appBar: AppBar(
    title: const Text("Football Shop"),
    backgroundColor: Colors.blue, // warna utama brand
),
...
ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
    child: const Text("Save", style: TextStyle(color: Colors.white)),
)</pre>

</details>

<details>
<summary>Tugas 9</summary>

## 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Membuat model Dart untuk data JSON berguna untuk:
- Type Safety & Null-Safety: memastikan data sesuai tipe yang diharapkan dan aman dari null error.
- Maintainability: parsing JSON tersentralisasi sehingga lebih mudah dipelihara.

Jika langsung pakai Map<String, dynamic>:
- Rawan error runtime jika tipe data berbeda.
- Null error lebih mudah terjadi.
- Kode parsing tersebar dan sulit dipelihara.

## 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
http: Package standar untuk melakukan request HTTP biasa (GET, POST, dll). Tidak otomatis menyimpan atau mengirim cookie, sehingga cocok untuk request stateless.

CookieRequest (dari pbp_django_auth): Mempermudah request ke server Django yang memerlukan autentikasi berbasis session/cookie. Otomatis menyimpan dan mengirim cookie, sehingga user tetap login antar request.

Perbedaan utama:
- http → stateless, manual handle cookie jika perlu.
- CookieRequest → stateful, otomatis handle session/cookie, cocok untuk aplikasi dengan login. 

## 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest menyimpan state autentikasi (session/cookie) user. Dengan membagikannya ke semua komponen:
- Semua widget bisa melakukan request ke server tanpa harus login ulang.
- Memudahkan pengelolaan session secara konsisten di seluruh aplikasi.
- Memastikan data user dan akses API tetap valid di mana pun dibutuhkan.

## 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Agar Flutter bisa berkomunikasi dengan Django, beberapa konfigurasi penting diperlukan:
1. ALLOWED_HOSTS (10.0.2.2):
- Pada Android emulator, 10.0.2.2 merepresentasikan localhost komputer host.
- Tanpa ini, Django akan menolak request dari emulator karena host tidak dikenali.
2. CORS (Cross-Origin Resource Sharing):
- Diperlukan agar frontend Flutter (web atau mobile) bisa mengakses API Django.
- Tanpa CORS, browser akan memblokir request karena kebijakan keamanan same-origin.
3. Pengaturan SameSite & cookie:
- Agar session/auth cookie bisa dikirim dan diterima oleh Flutter secara aman.
- Jika tidak disetel dengan benar, user tidak bisa login atau session tidak tersimpan.
4. Izin akses internet (AndroidManifest.xml):
- Agar aplikasi Android bisa melakukan request HTTP/HTTPS ke server.
- Tanpa izin ini, request dari Flutter ke Django akan gagal total.

Konsekuensi jika salah konfigurasi:
- Request gagal (HTTP error, browser block, atau connection timeout).
- Autentikasi/cookie tidak tersimpan → user tidak bisa login.
- Debugging menjadi sulit karena komunikasi antara frontend-backend terganggu.

## 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. Input Data di Flutter
- User mengisi form di aplikasi Flutter (misal nama produk, harga, deskripsi).
- Data ini divalidasi secara lokal di Flutter (misal tipe data, null-check).
2. Request ke Django
- Flutter mengirim data melalui HTTP request (POST/GET) menggunakan CookieRequest atau http.
- Jika login diperlukan, session cookie dikirim otomatis oleh CookieRequest.
3. Proses di Django
- Django menerima request, mem-parsing JSON atau form-data.
- Data divalidasi lagi (misal tipe data, field wajib).
- Jika valid, data disimpan di database melalui model Django (Product).
4. Response dari Django
- Django mengirim response JSON berisi status dan data yang baru dibuat/diperbarui.
5. Menampilkan Data di Flutter
- Flutter menerima response JSON.
- JSON di-convert ke model Dart (misal Product) untuk menjaga tipe data dan null-safety.
- Data kemudian ditampilkan di UI Flutter (ListView, Card, dsb).

## 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Register (Pendaftaran)
- User mengisi form register di Flutter (username, password).
- Flutter mengirim POST request ke endpoint Django /register/.
- Django memvalidasi data, membuat user baru di database, dan mengirim response sukses atau error.
2. Login
- User mengisi form login di Flutter.
- Flutter mengirim POST request ke /auth/login/ dengan username dan password.
- Django memeriksa kredensial:
- Jika valid, Django membuat session dan mengirim session cookie di response.
- Jika tidak valid, Django mengirim error JSON.
3. Menyimpan Cookie & Session di Flutter
- CookieRequest di Flutter menyimpan session cookie secara otomatis.
- Cookie ini digunakan untuk request berikutnya agar user tetap login.
4. Akses Menu Setelah Login
- Flutter memeriksa status login dari cookie/session.
- Jika valid, menu dan fitur protected (misal create product) ditampilkan.
5. Logout
- User menekan tombol logout di Flutter.
- Flutter memanggil endpoint /logout/ di Django.
- Django menghapus session dan cookie.
- Flutter membersihkan cookie lokal dan mengarahkan user ke halaman login.

## 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Deployment Django
- Menjalankan python manage.py runserver dan memastikan semua endpoint API berjalan (JSON, XML, CRUD).
2. Registrasi Akun di Flutter
- Membuat form register (username, password1, password2).
- Mengirim data ke Django endpoint /auth/register/ menggunakan CookieRequest.
- Menampilkan pesan sukses/error sesuai response Django.
3. Login di Flutter
- Membuat halaman login dengan username dan password.
- Mengirim data ke Django endpoint /auth/login/ dengan CookieRequest.
- Menyimpan session cookie agar user tetap login.
4. Integrasi Autentikasi Django-Flutter
- CookieRequest membagikan session ke seluruh halaman Flutter.
- Menu dan halaman hanya dapat diakses jika user login.
5. Membuat Model Kustom Django
- Membuat Product model dengan field: name, price, description, thumbnail, category, brand, stock, user, is_featured.
6. Halaman Daftar Item di Flutter
- Mengambil data JSON dari endpoint Django (/show-json/).
- Menampilkan name, price, description, thumbnail, category, is_featured.
- Menggunakan ListView.builder dengan card untuk tiap item.
7. Halaman Detail Item
- Bisa diakses dengan menekan card item di halaman daftar.
- Menampilkan seluruh atribut item (name, price, description, thumbnail, category, brand, stock, is_featured).
- Menambahkan tombol kembali ke halaman daftar item.
8. Filter Item per User
- Menambahkan query parameter (view=my) saat request JSON.
- Hanya menampilkan item yang dibuat oleh user yang login.