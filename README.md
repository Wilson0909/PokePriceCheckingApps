# PokePrice – Pokémon Card Price Checker

PokePrice adalah aplikasi mobile berbasis Flutter yang digunakan untuk mencari dan melihat harga kartu Pokémon dari API publik. Fokus utama dari project ini adalah pada struktur kode yang rapi, pemisahan logic dengan UI, serta pengalaman pengguna yang baik.

---

## Features

* Pencarian kartu Pokémon berdasarkan nama
* Menampilkan harga kartu
* Menampilkan gambar kartu
* Klik gambar untuk melihat versi lebih besar
* Loading state yang responsif
* Menyimpan data terakhir (offline support)
* Error handling yang user-friendly

---

## Project Structure

Struktur folder yang digunakan:

```id="i9r2gx"
lib/
├── models/
├── services/
├── providers/
├── views/
├── widgets/
```

Penjelasan:

* **models/**: berisi representasi data (CardModel)
* **services/**: handle request ke API
* **providers/**: mengatur state dan logic aplikasi
* **views/**: tampilan utama
* **widgets/**: komponen UI yang bisa dipakai ulang

Struktur ini dibuat agar code lebih modular dan mudah dikembangkan.

---

## API

Aplikasi ini menggunakan Pokémon TCG API sebagai sumber data. API ini dipilih karena tidak membutuhkan autentikasi dan menyediakan data yang cukup lengkap seperti nama kartu, harga, dan gambar.

---

## State Management

State management menggunakan Provider.

Alasan pemilihan:

* lebih sederhana dibandingkan opsi lain
* cukup untuk kebutuhan aplikasi ini
* memisahkan logic dari UI

---

## Data Flow

Alur data dalam aplikasi:

```id="l5d5y3"
User input → Provider → API Service → Model → UI
```

User melakukan pencarian, kemudian Provider akan memanggil API, hasilnya diubah menjadi model, lalu ditampilkan ke UI.

---

## Offline Support

Aplikasi menyimpan data terakhir menggunakan SharedPreferences.

Jika tidak ada koneksi internet:

* aplikasi tetap bisa menampilkan data terakhir yang berhasil diambil

---

## Error Handling

Beberapa kondisi yang ditangani:

* gagal mengambil data dari API
* tidak ada koneksi internet
* gambar gagal dimuat

Aplikasi tidak menampilkan error teknis, tetapi menggunakan pesan yang lebih mudah dipahami user.

---

## Reusable Widgets

Beberapa widget dibuat reusable, seperti:

* CardTile untuk menampilkan data kartu
* CustomErrorWidget untuk menampilkan pesan error

Hal ini membantu menjaga konsistensi UI dan mempermudah pengembangan.

---

## Asynchronous Handling

Aplikasi menggunakan async/await untuk memastikan proses pengambilan data tidak mengganggu UI.

Contoh:

```dart id="q9f2oz"
Future<void> search(String query) async {
  isLoading = true;
  notifyListeners();

  cards = await api.fetchCards(query);

  isLoading = false;
  notifyListeners();
}
```

---

## UI Design

UI dibuat sederhana namun tetap rapi:

* card dengan rounded corner dan shadow
* highlight pada harga
* layout yang konsisten
* fitur zoom pada gambar

---

## Installation

Clone repository:

```id="ztgq4o"
git clone https://github.com/your-username/pokeprice.git
```

Masuk ke folder:

```id="8j6u3z"
cd pokeprice
```

Install dependency:

```id="3f6q7p"
flutter pub get
```

Jalankan aplikasi:

```id="1ny2ny"
flutter run
```

---

## Conclusion

Project ini dibuat dengan fokus pada:

* struktur code yang jelas
* pemisahan antara UI dan logic
* fitur yang berjalan dengan baik
* pengalaman pengguna yang cukup nyaman

Aplikasi ini masih bisa dikembangkan lebih lanjut, seperti menambahkan filter, detail page, atau grafik harga.

---

## Author

Wilson
