-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2018 at 04:58 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek_pratama`
--

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `kategory` enum('obat bebas','obat bebas terbatas','obat keras','jamu','obat herbal terstandar','fitofarmaka') NOT NULL,
  `khasiat` varchar(255) NOT NULL,
  `expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama`, `harga`, `stok`, `kategory`, `khasiat`, `expired`) VALUES
(2, 'ganja', 20000, 2, 'obat keras', 'penenang', '2018-07-08'),
(4, 'antimo', 1000, 10, 'obat bebas', 'pusing,mual', '2018-07-25'),
(10, 'alummi', 1000, 10, 'obat bebas', 'mual, maag', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jumlah_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_obat`, `tanggal`, `jumlah_obat`) VALUES
(2, 2, '2018-07-06 09:59:43', 1),
(8, 4, '2018-07-09 16:13:55', 5),
(10, 2, '2018-07-09 17:01:20', 1),
(11, 4, '2018-07-10 02:05:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `request_obat`
--

CREATE TABLE `request_obat` (
  `id_request` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL,
  `kategory` enum('obat bebas','obat bebas terbatas','obat keras','jamu','obat herbal terstandar','fitofarmaka') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_obat`
--

INSERT INTO `request_obat` (`id_request`, `nama`, `stok`, `kategory`) VALUES
(1, 'paramex', 10, 'obat bebas terbatas'),
(3, 'ganja', 10, 'obat keras');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `level` enum('pegawai','apoteker','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `username`, `password`, `level`) VALUES
(7, 'Annatasya Zahra Napu', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(8, 'Bagus Prasetyo Usman', 'apoteker', '326dd0e9d42a3da01b50028c51cf21fc', 'apoteker'),
(9, 'Rizky Tuloli', 'pegawai1', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(10, 'Usman Ibrahim', 'pegawai2', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(11, 'Virawati Hamal', 'pegawai3', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(12, 'Idris Male', 'pegawai4', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `request_obat`
--
ALTER TABLE `request_obat`
  ADD PRIMARY KEY (`id_request`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `request_obat`
--
ALTER TABLE `request_obat`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
