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