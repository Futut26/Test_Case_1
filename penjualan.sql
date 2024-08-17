-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Agu 2024 pada 20.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_barang`
--

CREATE TABLE `m_barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `kategori` varchar(20) DEFAULT NULL,
  `harga_barang` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `m_barang`
--

INSERT INTO `m_barang` (`id`, `kode_barang`, `nama`, `kategori`, `harga_barang`) VALUES
(1, 'B001', 'Laptop', 'Electronics', 15000000),
(2, 'B002', 'Smartphone', 'Electronics', 8000000),
(3, 'B003', 'Tablet', 'Electronics', 5000000),
(4, 'B004', 'Headphones', 'Accessories', 1500000),
(5, 'B005', 'Smartwatch', 'Accessories', 2500000),
(6, 'B006', 'Keyboard', 'Accessories', 500000),
(7, 'B007', 'Mouse', 'Accessories', 300000),
(8, 'B008', 'Monitor', 'Electronics', 3000000),
(9, 'B009', 'Printer', 'Electronics', 2000000),
(10, 'B010', 'External Hard Drive', 'Storage', 1000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_sales`
--

CREATE TABLE `m_sales` (
  `id` int(11) NOT NULL,
  `kode_sales` varchar(10) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `jns_kelamin` char(1) DEFAULT NULL,
  `tgl_bergabung` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `m_sales`
--

INSERT INTO `m_sales` (`id`, `kode_sales`, `nama`, `jns_kelamin`, `tgl_bergabung`) VALUES
(1, 'S001', 'John Doe', 'M', '2020-01-01'),
(2, 'S002', 'Jane Smith', 'F', '2020-02-15'),
(3, 'S003', 'Mike Brown', 'M', '2021-03-10'),
(4, 'S004', 'Emma Wilson', 'F', '2021-04-20'),
(5, 'S005', 'Lucas Johnson', 'M', '2022-05-05'),
(6, 'S006', 'Olivia Taylor', 'F', '2022-06-15'),
(7, 'S007', 'Liam Anderson', 'M', '2023-07-25'),
(8, 'S008', 'Sophia Martinez', 'F', '2023-08-01'),
(9, 'S009', 'Ethan Davis', 'M', '2023-09-12'),
(10, 'S010', 'Ava Moore', 'F', '2023-10-18');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `top_3_kategori_terjual`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `top_3_kategori_terjual` (
`kategori` varchar(20)
,`jumlah_barang_terjual` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_d`
--

CREATE TABLE `tr_d` (
  `id` int(11) NOT NULL,
  `kode_trx` varchar(20) NOT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `jml_barang` int(11) DEFAULT NULL,
  `harga_barang` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tr_d`
--

INSERT INTO `tr_d` (`id`, `kode_trx`, `kode_barang`, `jml_barang`, `harga_barang`) VALUES
(1, 'T001', 'B001', 1, 15000000),
(2, 'T001', 'B002', 2, 8000000),
(3, 'T002', 'B003', 1, 5000000),
(4, 'T002', 'B004', 1, 1500000),
(5, 'T003', 'B005', 1, 2500000),
(6, 'T003', 'B006', 2, 500000),
(7, 'T004', 'B007', 1, 300000),
(8, 'T005', 'B008', 1, 3000000),
(9, 'T005', 'B009', 1, 2000000),
(10, 'T006', 'B010', 2, 1000000),
(11, 'T007', 'B001', 1, 15000000),
(12, 'T007', 'B002', 1, 8000000),
(13, 'T008', 'B003', 1, 5000000),
(14, 'T009', 'B004', 1, 1500000),
(15, 'T010', 'B005', 1, 2500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_h`
--

CREATE TABLE `tr_h` (
  `id` int(11) NOT NULL,
  `kode_trx` varchar(20) NOT NULL,
  `lokasi_trx` varchar(50) DEFAULT NULL,
  `kode_sales` varchar(10) DEFAULT NULL,
  `tgl_trx` date DEFAULT NULL,
  `nominal_diskon` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tr_h`
--

INSERT INTO `tr_h` (`id`, `kode_trx`, `lokasi_trx`, `kode_sales`, `tgl_trx`, `nominal_diskon`) VALUES
(1, 'T001', 'Store A', 'S001', '2024-05-01', 50000),
(2, 'T002', 'Store B', 'S002', '2024-03-02', 75000),
(3, 'T003', 'Store C', 'S003', '2024-08-03', 100000),
(4, 'T004', 'Store D', 'S004', '2024-06-11', 25000),
(5, 'T005', 'Store A', 'S005', '2024-02-05', 50000),
(6, 'T006', 'Store B', 'S006', '2024-05-06', 125000),
(7, 'T007', 'Store C', 'S007', '2024-06-05', 30000),
(8, 'T008', 'Store D', 'S008', '2024-02-05', 100000),
(9, 'T009', 'Store A', 'S009', '2024-05-13', 20000),
(10, 'T010', 'Store B', 'S010', '2024-06-12', 50000);

-- --------------------------------------------------------

--
-- Struktur untuk view `top_3_kategori_terjual`
--
DROP TABLE IF EXISTS `top_3_kategori_terjual`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `top_3_kategori_terjual`  AS SELECT `b`.`kategori` AS `kategori`, count(`d`.`kode_barang`) AS `jumlah_barang_terjual` FROM ((`tr_d` `d` join `m_barang` `b` on(`d`.`kode_barang` = `b`.`kode_barang`)) join `tr_h` `h` on(`d`.`kode_trx` = `h`.`kode_trx`)) WHERE year(`h`.`tgl_trx`) = year(curdate()) GROUP BY `b`.`kategori` ORDER BY count(`d`.`kode_barang`) DESC LIMIT 0, 3 ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `m_sales`
--
ALTER TABLE `m_sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_sales` (`kode_sales`);

--
-- Indeks untuk tabel `tr_d`
--
ALTER TABLE `tr_d`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_trx` (`kode_trx`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `tr_h`
--
ALTER TABLE `tr_h`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_trx` (`kode_trx`),
  ADD KEY `kode_sales` (`kode_sales`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `m_sales`
--
ALTER TABLE `m_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tr_d`
--
ALTER TABLE `tr_d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tr_h`
--
ALTER TABLE `tr_h`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tr_d`
--
ALTER TABLE `tr_d`
  ADD CONSTRAINT `tr_d_ibfk_1` FOREIGN KEY (`kode_trx`) REFERENCES `tr_h` (`kode_trx`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_d_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tr_h`
--
ALTER TABLE `tr_h`
  ADD CONSTRAINT `tr_h_ibfk_1` FOREIGN KEY (`kode_sales`) REFERENCES `m_sales` (`kode_sales`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
