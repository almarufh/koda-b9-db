# Panduan Konfigurasi Redis (Redis Configuration Guide)

Dokumen ini berisi penjelasan ringkas dan praktis mengenai aspek-aspek utama dalam konfigurasi Redis, mulai dari jaringan, logging, persistensi, manajemen memori, hingga manajemen pengguna.

---

## 1. Network Settings (Pengaturan Jaringan)

Pengaturan jaringan menentukan bagaimana Redis menerima koneksi dari aplikasi atau klien luar.

- **`bind`**:
  - **Fungsi**: Menentukan alamat IP (_network interface_) tempat Redis akan mendengarkan koneksi masuk.
  - **Contoh**:
    - `bind 127.0.0.1 -::1` (Hanya menerima koneksi dari _localhost_ / internal mesin).
    - `bind 0.0.0.0` (Menerima koneksi dari semua antarmuka jaringan/publik — **Gunakan dengan hati-hati!**).
  - **Praktik Terbaik**: Hindari membuka ke publik (`0.0.0.0`) tanpa proteksi firewall atau otentikasi yang kuat.

- **`port`**:
  - **Fungsi**: Port TCP yang digunakan Redis untuk mendengarkan koneksi.
  - **Default**: `6379`.
  - **Catatan**: Jika diatur ke `0`, Redis tidak akan mendengarkan koneksi TCP (biasanya digunakan jika hanya menggunakan Unix domain socket).

---

## 2. Logging (Pencatatan Aktivitas)

Logging digunakan untuk memantau status operasional, _debugging_, dan pelacakan kesalahan pada server Redis.

- **`logfile`**:
  - **Fungsi**: Menentukan jalur (_path_) lokasi berkas log akan disimpan.
  - **Contoh**: `logfile "/var/log/redis/redis-server.log"`
  - **Catatan**: Jika diisi string kosong `""`, log akan dicetak ke _standard output_ (stdout/konsol). Ini sering digunakan saat menjalankan Redis di dalam kontainer Docker.

- **`loglevel`**:
  - **Fungsi**: Menentukan tingkat kedetailan log yang dicetak.
  - **Pilihan Level**:
    1.  `debug`: Sangat detail, berguna untuk pengembangan (_development/testing_).
    2.  `verbose`: Cukup detail untuk informasi harian yang jarang diperlukan.
    3.  `notice` _(Default)_: Detail sedang, cocok untuk lingkungan produksi (_production_).
    4.  `warning`: Hanya mencatat pesan peringatan (_warning_) dan kesalahan (_error_) kritis.

---

## 3. Persistence (Persistensi Data)

Redis adalah _in-memory data store_, namun menyediakan mekanisme persistensi agar data tidak hilang saat server dimulai ulang.

- **RDB (Redis Database / Snapshotting)**:
  - **Cara Kerja**: Mengambil _snapshot_ poin-waktu (_point-in-time_) dari seluruh dataset pada interval waktu tertentu dan menyimpannya sebagai berkas biner tunggal (misal: `dump.rdb`).
  - **Kelebihan**: Berkas ringkas, performa _restart_ sangat cepat, cocok untuk _backup_.
  - **Kekurangan**: Berpotensi kehilangan data yang baru dibuat antara _snapshot_ terakhir dan insiden terhentinya server.

- **AOF (Append Only File)**:
  - **Cara Kerja**: Mencatat setiap operasi penulisan (_write operation_) yang diterima server ke dalam log berbasis teks.
  - **Kelebihan**: Jauh lebih aman dari kehilangan data (bisa dikonfigurasi untuk simpan setiap detik/tiap perintah).
  - **Kekurangan**: Ukuran berkas lebih besar dibanding RDB dan proses pemulihan data (_recovery_) saat _startup_ cenderung lebih lambat.

- **Mengapa Menggunakan Keduanya (RDB + AOF)?**
  - **Keamanan & Kecepatan Maksimal**: Menggabungkan keduanya memberi daya tahan data yang tinggi dari AOF sekaligus kecepatan _recovery_ atau kemudahan pencadangan berkala dari RDB.
  - _Catatan_: Pada versi Redis modern, fitur **Hybrid Persistence** aktif secara default, di mana RDB digunakan sebagai dasar file AOF untuk mempercepat waktu pemulihan.

---

## 4. Memory Management (Manajemen Memori)

Saat memori server penuh, Redis menggunakan **`maxmemory-policy`** untuk menentukan data mana yang harus dihapus (_eviction_).

### A. Strategi Penghapusan (`maxmemory-policy`)

1.  **`noeviction`** _(Default)_: Mengembalikan pesan error jika memori penuh dan ada perintah penulisan baru.
2.  **`allkeys-*`**: Memilih kunci (_key_) yang akan dihapus dari **seluruh dataset**, tanpa peduli kunci tersebut memiliki masa kadaluarsa (TTL) atau tidak.
3.  **`volatile-*`**: Hanya memilih kunci yang **memiliki masa kadaluarsa (TTL)** untuk dihapus.

### B. Algoritma _Eviction_: LFU vs LRU vs LRM

- **LRU (Least Recently Used)**:
  - Menghapus kunci yang **paling lama tidak diakses**.
  - _Skenario_: Bagus jika akses data mengikuti pola siklus acak.
- **LFU (Least Frequently Used)**:
  - Menghapus kunci yang **paling jarang diakses** berdasarkan frekuensi hitungan.
  - _Skenario_: Sangat baik jika ada data populer (_hot keys_) yang harus tetap bertahan di cache meskipun baru saja tidak diakses beberapa saat.
- **LRM / Random (Random Eviction)**:
  - `allkeys-random` / `volatile-random`: Menghapus kunci secara **acak**.
  - _Skenario_: Digunakan jika distribusi akses data merata dan Anda tidak ingin overhead beban CPU untuk menghitung algoritma LRU/LFU.

---

## 5. User Management (Manajemen Pengguna)

Redis menyediakan fitur **AUTH** sederhana dan sistem **ACL (Access Control List)** yang lebih canggih untuk mengelola hak akses pengguna.

- **AUTH (Otentikasi Klasik)**:
  - Cara otentikasi lama berbasis satu kata sandi global menggunakan direktif `requirepass`.
  - Contoh: `requirepass PasswordSangatRahas1a`

- **ACL (Access Control List)**:
  - Fitur modern (Redis 6+) yang memungkinkan Anda membuat banyak pengguna (_users_) dengan kombinasi otorisasi perintah dan hak akses kunci yang terbutir (_granular_).

### Cara Menambahkan Pengguna Baru via ACL

Anda dapat menambahkan pengguna secara langsung menggunakan perintah CLI atau melalui berkas konfigurasi (`redis.conf` / `aclfile`).

#### Menggunakan Perintah CLI:

```bash
ACL SETUSER developer on >SandiDev123 ~app:* +@read +@write -@dangerous
```

**Penjelasan sintaks di atas:**

- `developer`: Nama pengguna baru.
- `on`: Mengaktifkan akun pengguna.
- `>SandiDev123`: Menentukan kata sandi pengguna.
- `~app:*`: Mengizinkan akses hanya ke _key_ yang diawali dengan pola `app:*`.
- `+@read +@write`: Memberikan izin perintah baca dan tulis.
- `-@dangerous`: Memblokir perintah berbahaya (seperti `FLUSHALL`, `KEYS`, `CONFIG`).
