CREATE TABLE kategori (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nama VARCHAR(255) NOT NULL
);

INSERT INTO kategori (nama) VALUES
('Teknologi Informasi'),
('Sains dan Matematika'),
('Sastra dan Fiksi'),
('Sejarah dan Budaya'),
('Bisnis dan Manajemen'),
('Pengembangan Diri'),
('Filsafat'),
('Seni dan Desain'),
('Kesehatan dan Kedokteran'),
('Hukum dan Politik');

CREATE TABLE rak_buku (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    lokasi VARCHAR(255) NOT NULL
);

INSERT INTO rak_buku (name, lokasi) VALUES
('Rak TI-01', 'Lantai 1 - Sayap Timur'),
('Rak TI-02', 'Lantai 1 - Sayap Timur'),
('Rak SN-01', 'Lantai 1 - Sayap Barat'),
('Rak SF-01', 'Lantai 2 - Sayap Timur'),
('Rak SF-02', 'Lantai 2 - Sayap Timur'),
('Rak SJ-01', 'Lantai 2 - Sayap Barat'),
('Rak BM-01', 'Lantai 3 - Sayap Timur'),
('Rak PD-01', 'Lantai 3 - Sayap Barat'),
('Rak FL-01', 'Lantai 3 - Area Tengah'),
('Rak HK-01', 'Lantai 1 - Area Tengah');

CREATE TABLE buku (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_kategori INT,
    id_rak INT,
    judul VARCHAR(255) NOT NULL,
    penulis VARCHAR(255) NOT NULL,
    penerbit VARCHAR(255) NOT NULL,
    tahun INT CHECK (tahun > 2015),
    stok INT CHECK (stok >= 0),
    FOREIGN KEY (id_kategori) REFERENCES kategori(id),
    FOREIGN KEY (id_rak) REFERENCES rak_buku(id)
);

INSERT INTO buku (id_kategori, id_rak, judul, penulis, penerbit, tahun, stok) VALUES
(1, 1, 'Mendesain Database Modern', 'Hadi Wijaya', 'Informatika', 2021, 12),
(1, 2, 'Panduan Praktis SQL', 'Bambang Subroto', 'Elex Media', 2020, 8),
(2, 3, 'Matematika Diskrit Lanjut', 'Prof. Suparman', 'Gadjah Mada Press', 2019, 5),
(3, 4, 'Hujan di Bulan Kemarau', 'Ayu Utami', 'Gramedia Pustaka Utama', 2022, 10),
(3, 5, 'Lelaki Harimau Edisi Baru', 'Eka Kurniawan', 'Gramedia Pustaka Utama', 2018, 6),
(4, 6, 'Nusantara: Sejarah Maritim', 'Susanto Zuhdi', 'Kompas', 2017, 4),
(5, 7, 'Manajemen Startup Era Digital', 'Irwan Prasetya', 'Andi Publisher', 2023, 15),
(6, 8, 'Fokus dan Produktivitas', 'Danang S.', 'Bentang Pustaka', 2021, 20),
(7, 9, 'Filsafat Logika Dasar', 'Rizal Mustansyir', 'Pustaka Pelajar', 2016, 7),
(10, 10, 'Hukum Pidana Cyber Indonesia', 'Dr. Hendra Saputra', 'Rajawali Pers', 2022, 9);

CREATE TABLE petugas (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    hp VARCHAR(255) NOT NULL,
    jabatann VARCHAR(255) NOT NULL
);

INSERT INTO petugas (name, hp, jabatann) VALUES
('Budi Santoso', '081234567890', 'Kepala Perpustakaan'),
('Siti Aminah', '081234567891', 'Staf Layanan Sirkulasi'),
('Ahmad Fauzi', '081234567892', 'Staf Pengadaan dan Kataloging'),
('Dewi Lestari', '081234567893', 'Staf Layanan Sirkulasi'),
('Rian Pratama', '081234567894', 'Staf IT dan Preservasi'),
('Rina Wati', '081234567895', 'Staf Layanan Referensi'),
('Fajar Nugroho', '081234567896', 'Staf Layanan Sirkulasi'),
('Maya Safitri', '081234567897', 'Staf Administrasi'),
('Eko Prasetyo', '081234567898', 'Staf Layanan Sirkulasi'),
('Nurul Hidayah', '081234567899', 'Staf Layanan Referensi');

CREATE TABLE peminjaman (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_buku INT NOT NULL,
    id_petugas INT NOT NULL,
    nama_peminjam VARCHAR(255) NOT NULL,
    tanggal_pinjam DATE NOT NULL,
    tanggal_jatuh_tempo DATE CHECK (tanggal_jatuh_tempo >= tanggal_pinjam) NOT NULL,
    tanggal_kembali DATE CHECK (tanggal_kembali IS NULL OR tanggal_kembali >= tanggal_pinjam),
    status VARCHAR(50) NOT NULL DEFAULT 'Dipinjam',
    denda INT DEFAULT 0 CHECK (denda >= 0),
    FOREIGN KEY (id_buku) REFERENCES buku(id),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id)
);

INSERT INTO peminjaman (id_buku, id_petugas, nama_peminjam, tanggal_pinjam, tanggal_jatuh_tempo, tanggal_kembali, status, denda) VALUES
(1, 2, 'Aditya Pratama', '2024-01-10', '2024-01-17', '2024-01-16', 'Kembali', 0),
(2, 4, 'Bunga Citra', '2024-01-12', '2024-01-19', '2024-01-22', 'Kembali', 6000),
(3, 2, 'Cahyo Utomo', '2024-01-15', '2024-01-22', '2024-01-20', 'Kembali', 0),
(4, 7, 'Dina Fitriani', '2024-02-01', '2024-02-08', '2024-02-07', 'Kembali', 0),
(5, 4, 'Erlangga Saputra', '2024-02-05', '2024-02-12', '2024-02-15', 'Kembali', 6000),
(6, 9, 'Farhan Maulana', '2024-02-10', '2024-02-17', NULL, 'Dipinjam', 0),
(7, 2, 'Gita Gutawa', '2024-02-12', '2024-02-19', NULL, 'Dipinjam', 0),
(8, 7, 'Hendra Gunawan', '2024-02-14', '2024-02-21', '2024-02-21', 'Kembali', 0),
(9, 9, 'Indah Permata', '2024-02-15', '2024-02-22', NULL, 'Dipinjam', 0),
(10, 4, 'Joko Susilo', '2024-02-16', '2024-02-23', NULL, 'Dipinjam', 0);

TABLE peminjaman;
TABLE buku;
TABLE petugas;
TABLE rak_buku;
TABLE kategori;

DROP TABLE IF EXISTS peminjaman;
DROP TABLE IF EXISTS buku;
DROP TABLE IF EXISTS petugas;
DROP TABLE IF EXISTS rak_buku;
DROP TABLE IF EXISTS kategori;