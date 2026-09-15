CREATE TABLE kategori (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nama VARCHAR(255) NOT NULL
);

CREATE TABLE rak_buku (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    lokasi VARCHAR(255) NOT NULL
);

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

DROP TABLE IF EXISTS peminjaman;
DROP TABLE IF EXISTS buku;
DROP TABLE IF EXISTS petugas;
DROP TABLE IF EXISTS rak_buku;
DROP TABLE IF EXISTS kategori;