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