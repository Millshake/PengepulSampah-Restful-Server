-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2020 at 06:55 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bank_sampah`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ADMIN` (IN `ID_PET_N` VARCHAR(20), IN `USERNAME_N` VARCHAR(20), IN `NAMA_PET_N` VARCHAR(50), IN `TELP_PET_N` VARCHAR(13), IN `PASSWORD_N` TEXT, IN `AKSES_N` VARCHAR(10), IN `TANGGAL_BUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20))  BEGIN
	INSERT INTO m_admin (ID_PET,USERNAME,NAMA_PET,TELP_PET,PASSWORD,AKSES,TANGGAL_BUAT,DIBUAT_OLEH) VALUES(ID_PET_N, USERNAME_N, NAMA_PET_N, TELP_PET_N, PASSWORD_N, AKSES_N, TANGGAL_BUAT_N, DIBUAT_OLEH_N);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_NASABAH` (IN `ID_NAS_N` VARCHAR(20), IN `NAMA_NAS_N` VARCHAR(60), IN `ALAMAT_NAS_N` TEXT, IN `TELP_NAS_N` VARCHAR(13), IN `NO_REK_N` VARCHAR(50), IN `STATUSS_N` INT(11), IN `TANGGAL_BUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20))  BEGIN
	INSERT INTO m_nasabah (ID_NAS,NAMA_NAS,ALAMAT_NAS,TELP_NAS,NO_REK,STATUSS,TANGGAL_BUAT,DIBUAT_OLEH) VALUES(ID_NAS_N, NAMA_NAS_N, ALAMAT_NAS_N, TELP_NAS_N, NO_REK_N, STATUSS_N, TANGGAL_BUAT_N, DIBUAT_OLEH_N);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_PENGEPUL` (IN `ID_PENG_N` VARCHAR(20), IN `NAMA_PENG_N` VARCHAR(60), IN `ALAMAT_PENG_N` TEXT, IN `TELP_PENG_N` VARCHAR(13), IN `STATUSS_N` INT(11), IN `TANGGAL_BUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20))  BEGIN
	INSERT INTO m_pengepul (ID_PENG,NAMA_PENG,ALAMAT_PENG,TELP_PENG,STATUSS,TANGGAL_BUAT,DIBUAT_OLEH) VALUES(ID_PENG_N,NAMA_PENG_N,ALAMAT_PENG_N,TELP_PENG_N,STATUSS_N,TANGGAL_BUAT_N,DIBUAT_OLEH_N);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SAMPAH` (IN `JENIS_N` VARCHAR(20), IN `KD_SAMPAH_N` VARCHAR(20), IN `DESKRIPSI_N` VARCHAR(50), IN `SATUAN_N` VARCHAR(10), IN `HARGA_BAYAR_N` INT(11), IN `HARGA_TABUNG_N` INT(11), IN `HARGA_JUAL_N` INT(11), IN `TANGGAL_BUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20), IN `STOCK_N` INT(11))  BEGIN
	INSERT INTO m_sampah (JENIS,KD_SAMPAH,DESKRIPSI,SATUAN,STOCK,HARGA_BAYAR,HARGA_TABUNG,HARGA_JUAL,TANGGAL_BUAT,DIBUAT_OLEH) VALUES(JENIS_N,KD_SAMPAH_N,DESKRIPSI_N,SATUAN_N,STOCK_N,HARGA_BAYAR_N,HARGA_TABUNG_N,HARGA_JUAL_N,TANGGAL_BUAT_N,DIBUAT_OLEH_N);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_TABUNGAN` (IN `KD_TB_N` VARCHAR(20), IN `KD_TR_N` VARCHAR(20), IN `ID_PET_N` VARCHAR(20), IN `ID_NAS_N` VARCHAR(20), IN `TGL_TABUNG_N` DATE, IN `JML_TABUNG_N` INT(11), IN `TANGGAL_BUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20), IN `ROW_STATUS_N` INT(11))  BEGIN
	INSERT INTO tb_tabungan (KD_TB,KD_TR,ID_PET,ID_NAS,TGL_TABUNG,JML_TABUNG,TANGGAL_BUAT,DIBUAT_OLEH,ROW_STATUS) VALUES(KD_TB_N,KD_TR_N,ID_PET_N,ID_NAS_N,TGL_TABUNG_N,JML_TABUNG_N,TANGGAL_BUAT_N,DIBUAT_OLEH_N,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_TR_BELI_DETAIL` (IN `KD_TR_N` VARCHAR(20), IN `JENIS_SAMPAH_N` VARCHAR(20), IN `KD_SAMPAH_N` VARCHAR(20), IN `SATUAN_N` VARCHAR(10), IN `JUMLAH_TERIMA_N` INT(11), IN `HARGA_N` INT(11), IN `NET_HARGA_N` INT(11), IN `JENIS_BAYAR_N` VARCHAR(10), IN `TANGGAL_DIBUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20))  BEGIN
	INSERT INTO tr_beli_detail (KD_TR,JENIS_SAMPAH,KD_SAMPAH,SATUAN,JUMLAH_TERIMA,HARGA,NET_HARGA,JENIS_BAYAR,TANGGAL_DIBUAT,DIBUAT_OLEH,ROW_STATUS) VALUES(KD_TR_N,JENIS_SAMPAH_N,KD_SAMPAH_N,SATUAN_N,JUMLAH_TERIMA_N,HARGA_N,NET_HARGA_N,JENIS_BAYAR_N,TANGGAL_DIBUAT_N,DIBUAT_OLEH_N,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_TR_BELI_HEADER` (IN `KD_TR_N` VARCHAR(20), IN `ID_PET_N` VARCHAR(20), IN `ID_NAS_N` VARCHAR(20), IN `TANGGAL_DIBUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20))  BEGIN
	INSERT INTO tr_beli (KD_TR,ID_PET,ID_NAS,TANGGAL_DIBUAT,DIBUAT_OLEH,ROW_STATUS) VALUES(KD_TR_N,ID_PET_N,ID_NAS_N,TANGGAL_DIBUAT_N,DIBUAT_OLEH_N,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_TR_JUAL_DETAIL` (IN `KD_TR_JUAL_N` VARCHAR(20), IN `JENIS_SAMPAH_N` VARCHAR(20), IN `KD_SAMPAH_N` VARCHAR(20), IN `SATUAN_N` VARCHAR(10), IN `JUMLAH_JUAL_N` INT(11), IN `HARGA_N` INT(11), IN `NET_HARGA_N` INT(11), IN `TANGGAL_BUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20))  BEGIN
	INSERT INTO tr_jual_detail (KD_TR_JUAL,JENIS_SAMPAH,KD_SAMPAH,SATUAN,JUMLAH_JUAL,HARGA,NET_HARGA,TANGGAL_BUAT,DIBUAT_OLEH,ROW_STATUS) VALUES(KD_TR_JUAL_N,JENIS_SAMPAH_N,KD_SAMPAH_N,SATUAN_N,JUMLAH_JUAL_N,HARGA_N,NET_HARGA_N,TANGGAL_BUAT_N,DIBUAT_OLEH_N,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_TR_JUAL_HEADER` (IN `KD_TR_JUAL_N` VARCHAR(20), IN `ID_PET_N` VARCHAR(20), IN `ID_PENG_N` VARCHAR(20), IN `TANGGAL_BUAT_N` DATETIME, IN `DIBUAT_OLEH_N` VARCHAR(20))  BEGIN
	INSERT INTO tr_jual (KD_TR_JUAL,ID_PET,ID_PENG,TANGGAL_BUAT,DIBUAT_OLEH,ROW_STATUS) VALUES(KD_TR_JUAL_N,ID_PET_N,ID_PENG_N,TANGGAL_BUAT_N,DIBUAT_OLEH_N,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIN` (IN `USERNAME_N` VARCHAR(20), IN `PASSWORD_N` TEXT)  BEGIN
	SELECT * FROM m_admin WHERE USERNAME = USERNAME_N AND PASSWORD = PASSWORD_N;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ADMIN` (IN `ID_PET_N` VARCHAR(20), IN `USERNAME_N` VARCHAR(20), IN `NAMA_PET_N` VARCHAR(50), IN `TELP_PET_N` VARCHAR(13), IN `TANGGAL_UBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20))  BEGIN
	UPDATE m_admin SET USERNAME = USERNAME_N, NAMA_PET = NAMA_PET_N, TELP_PET = TELP_PET_N, TANGGAL_UBAH = TANGGAL_UBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N WHERE ID_PET = ID_PET_N;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_NASABAH` (IN `ID_NAS_N` VARCHAR(20), IN `NAMA_NAS_N` VARCHAR(60), IN `ALAMAT_NAS_N` TEXT, IN `TELP_NAS_N` VARCHAR(13), IN `NO_REK_N` VARCHAR(50), IN `STATUSS_N` INT(11), IN `TANGGAL_UBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20))  BEGIN
	UPDATE m_nasabah SET NAMA_NAS = NAMA_NAS_N, ALAMAT_NAS = ALAMAT_NAS_N, TELP_NAS = TELP_NAS_N, NO_REK = NO_REK_N, STATUSS = STATUSS_N, TANGGAL_UBAH = TANGGAL_UBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N WHERE ID_NAS = ID_NAS_N;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_PENGEPUL` (IN `ID_PENG_N` VARCHAR(20), IN `NAMA_PENG_N` VARCHAR(60), IN `ALAMAT_PENG_N` TEXT, IN `TELP_PENG_N` VARCHAR(13), IN `STATUSS_N` INT(11), IN `TANGGAL_UBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20))  BEGIN
	UPDATE m_pengepul SET NAMA_PENG = NAMA_PENG_N, ALAMAT_PENG = ALAMAT_PENG_N, TELP_PENG = TELP_PENG_N, STATUSS = STATUSS_N, TANGGAL_UBAH = TANGGAL_UBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N WHERE ID_PENG = ID_PENG_N;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SAMPAH` (IN `ID_N` INT(11), IN `JENIS_N` VARCHAR(20), IN `KD_SAMPAH_N` VARCHAR(20), IN `DESKRIPSI_N` VARCHAR(50), IN `SATUAN_N` VARCHAR(10), IN `HARGA_BAYAR_N` INT(11), IN `HARGA_TABUNG_N` INT(11), IN `HARGA_JUAL_N` INT(11), IN `TANGGAL_UBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20), IN `STOCK_N` INT(11))  BEGIN
	UPDATE m_sampah SET JENIS = JENIS_N, KD_SAMPAH = KD_SAMPAH_N, DESKRIPSI = DESKRIPSI_N, SATUAN = SATUAN_N, STOCK = STOCK_N, HARGA_BAYAR = HARGA_BAYAR_N, HARGA_TABUNG = HARGA_TABUNG_N, HARGA_JUAL = HARGA_JUAL_N, TANGGAL_UBAH = TANGGAL_UBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N WHERE ID = ID_N;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_TABUNGAN` (IN `KD_TB_N` VARCHAR(20), IN `KD_TR_N` VARCHAR(20), IN `ID_PET_N` VARCHAR(20), IN `ID_NAS_N` VARCHAR(20), IN `TGL_TABUNG_N` DATE, IN `JML_TABUNG_N` INT(11), IN `TANGGAL_UBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20), IN `ROW_STATUS_N` INT(11))  BEGIN
	UPDATE tb_tabungan SET TGL_TABUNG = TGL_TABUNG_N, JML_TABUNG = JML_TABUNG_N, TANGGAL_UBAH = TANGGAL_UBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N, ROW_STATUS = ROW_STATUS_N WHERE KD_TB = KD_TB_N AND KD_TR = KD_TR_N;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_TR_BELI_DETAIL` (IN `KD_TR_N` VARCHAR(20), IN `JENIS_SAMPAH_N` VARCHAR(20), IN `KD_SAMPAH_N` VARCHAR(20), IN `SATUAN_N` VARCHAR(10), IN `JUMLAH_TERIMA_N` INT(11), IN `HARGA_N` INT(11), IN `NET_HARGA_N` INT(11), IN `JENIS_BAYAR_N` VARCHAR(10), IN `TANGGAL_UBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20), IN `ROW_STATUS_N` INT(11))  BEGIN
	UPDATE tr_beli_detail SET JUMLAH_TERIMA = JUMLAH_TERIMA_N, HARGA = HARGA_N, NET_HARGA = NET_HARGA_N, JENIS_BAYAR = JENIS_BAYAR_N, TANGGAL_UBAH = TANGGAL_UBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N, ROW_STATUS = ROW_STATUS_N WHERE KD_TR = KD_TR_N AND JENIS_SAMPAH = JENIS_SAMPAH_N AND KD_SAMPAH = KD_SAMPAH_N;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_TR_BELI_HEADER` (IN `KD_TR_N` VARCHAR(20), IN `ID_PET_N` VARCHAR(20), IN `ID_NAS_N` VARCHAR(20), IN `TANGGAL_DIUBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20), IN `ROW_STATUS_N` INT(11))  BEGIN
	UPDATE tr_beli SET TANGGAL_DIUBAH = TANGGAL_DIUBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N, ROW_STATUS = ROW_STATUS_N WHERE KD_TR = KD_TR_N;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_TR_JUAL_DETAIL` (IN `KD_TR_JUAL_N` VARCHAR(20), IN `JENIS_SAMPAH_N` VARCHAR(20), IN `KD_SAMPAH_N` VARCHAR(20), IN `SATUAN_N` VARCHAR(10), IN `JUMLAH_JUAL_N` INT(11), IN `HARGA_N` INT(11), IN `NET_HARGA_N` INT(11), IN `TANGGAL_UBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20), IN `ROW_STATUS_N` INT(11))  BEGIN
	UPDATE tr_jual_detail SET JUMLAH_JUAL = JUMLAH_JUAL_N, HARGA = HARGA_N, NET_HARGA = NET_HARGA_N, TANGGAL_UBAH = TANGGAL_UBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N, ROW_STATUS = ROW_STATUS_N WHERE KD_TR_JUAL = KD_TR_JUAL_N AND JENIS_SAMPAH = JENIS_SAMPAH_N AND KD_SAMPAH = KD_SAMPAH_N;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_TR_JUAL_HEADER` (IN `KD_TR_JUAL_N` VARCHAR(20), IN `ID_PET_N` VARCHAR(20), IN `ID_PENG_N` VARCHAR(20), IN `TANGGAL_UBAH_N` DATETIME, IN `DIUBAH_OLEH_N` VARCHAR(20), IN `ROW_STATUS_N` INT(11))  BEGIN
	UPDATE tr_jual SET TANGGAL_UBAH = TANGGAL_UBAH_N, DIUBAH_OLEH = DIUBAH_OLEH_N, ROW_STATUS = ROW_STATUS_N WHERE KD_TR_JUAL = KD_TR_JUAL_N;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `m_admin`
--

CREATE TABLE `m_admin` (
  `ID` int(11) NOT NULL,
  `ID_PET` varchar(20) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `NAMA_PET` varchar(50) NOT NULL,
  `TELP_PET` varchar(13) NOT NULL,
  `PASSWORD` text NOT NULL,
  `AKSES` varchar(10) DEFAULT NULL,
  `TANGGAL_BUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime DEFAULT NULL,
  `DIUBAH_OLEH` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_admin`
--

INSERT INTO `m_admin` (`ID`, `ID_PET`, `USERNAME`, `NAMA_PET`, `TELP_PET`, `PASSWORD`, `AKSES`, `TANGGAL_BUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`) VALUES
(18, 'KD/PT/2020-08-24-10', 'ADMIN', 'ADMIN', '081339674916', '73acd9a5972130b75066c82595a1fae3', 'ADMIN', '2020-11-29 00:00:00', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_nasabah`
--

CREATE TABLE `m_nasabah` (
  `ID` int(11) NOT NULL,
  `ID_NAS` varchar(20) NOT NULL,
  `NAMA_NAS` varchar(60) NOT NULL,
  `ALAMAT_NAS` text NOT NULL,
  `TELP_NAS` varchar(13) NOT NULL,
  `NO_REK` varchar(50) DEFAULT NULL,
  `STATUSS` int(11) NOT NULL,
  `TANGGAL_BUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime DEFAULT NULL,
  `DIUBAH_OLEH` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_nasabah`
--

INSERT INTO `m_nasabah` (`ID`, `ID_NAS`, `NAMA_NAS`, `ALAMAT_NAS`, `TELP_NAS`, `NO_REK`, `STATUSS`, `TANGGAL_BUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`) VALUES
(10, 'KD/NS/2020-07-30-1', 'BANK SAMPAH KENCANA', 'KOMPLEK RINA KARYA RT.O3. RW.04 KELURAHAN GUNTUNG PAIKAT', '082213738333', '0101', 1, '2020-07-30 12:06:28', 'ADMIN', NULL, NULL),
(11, 'KD/NS/2020-07-30-2', 'BANK SAMPAH RAMBAI SEJAHTERA', 'JL. GUNTUNG RAMBAI RT.05. RW.02. KELURAHAN LOKTABAT SELATAN', '082234758898', '0102', 1, '2020-07-30 12:09:30', 'ADMIN', NULL, NULL),
(12, 'KD/NS/2020-07-30-3', 'BANK SAMPAH KENANGA', 'KOMPLEK BANJARBARU PERMAI RT.01. RW.03. KELURAHAN  LOKTABAT SELATAN', '081398337734', '0103', 1, '2020-07-30 12:18:29', 'ADMIN', NULL, NULL),
(13, 'KD/NS/2020-07-30-4', 'BANK SAMPAH MUSTIKA ABADI', 'KELURAHAN GUNTUNG PAYUNG', '081333225678', '0104', 1, '2020-07-30 12:20:37', 'ADMIN', NULL, NULL),
(14, 'KD/NS/2020-07-30-5', 'BANK SAMPAH TASAKU', 'KELURAHAN GUNTUNG MANGGIS', '082211784678', '0105', 1, '2020-07-30 12:26:35', 'ADMIN', NULL, NULL),
(15, 'KD/NS/2020-07-30-6', 'BANK SAMPAH NANDA', 'KELURAHAN LANDASAN ULIN TIMUR', '082218113498', '0106', 1, '2020-07-30 12:28:09', 'ADMIN', NULL, NULL),
(16, 'KD/NS/2020-07-30-7', 'BANK SAMPAH BERLINA JAYA', 'KELURAHAN SUNGAI BESAR ', '081389383938', '0107', 1, '2020-07-30 12:29:51', 'ADMIN', NULL, NULL),
(17, 'KD/NS/2020-07-30-8', 'BANK SAMPAH BPK JOHANES', 'KELURAHAN SUNGAI ULIN', '082291772398', '0108', 1, '2020-07-30 12:33:21', 'ADMIN', NULL, NULL),
(18, 'KD/NS/2020-07-30-9', 'BANK SAMPAH KANTOR DIKLAT', 'KELURAHAN GUNTUNG PAYUNG', '081288988288', '0109', 1, '2020-07-30 12:35:45', 'ADMIN', NULL, NULL),
(19, 'KD/NS/2020-07-30-10', 'BANK SAMPAH TUNAS MEKAR', 'KELURAHAN TRIKORA', '082214785999', '0110', 1, '2020-07-30 12:38:18', 'ADMIN', NULL, NULL),
(20, 'KD/NS/2020-07-30-11', 'BANK SAMPAH PU', 'KELURAHAN SYAMSYUDIN NOOR', '081237889384', '0111', 1, '2020-07-30 12:41:06', 'ADMIN', NULL, NULL),
(21, 'KD/NS/2020-07-30-12', 'BANK SAMPAH IBU ENDANG', 'KELURAHAN GUNTUNG PAIKAT', '081333898834', '0112', 1, '2020-07-30 12:42:48', 'ADMIN', NULL, NULL),
(22, 'KD/NS/2020-11-28-10', 'BANK SAMPAH SANJAYA', 'JL.ARUT UTARA', '082167543219', '076431165', 1, '2020-11-28 19:26:47', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_pengepul`
--

CREATE TABLE `m_pengepul` (
  `ID` int(11) NOT NULL,
  `ID_PENG` varchar(20) NOT NULL,
  `NAMA_PENG` varchar(60) NOT NULL,
  `ALAMAT_PENG` text NOT NULL,
  `TELP_PENG` varchar(13) NOT NULL,
  `STATUSS` int(11) NOT NULL,
  `TANGGAL_BUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime DEFAULT NULL,
  `DIUBAH_OLEH` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_pengepul`
--

INSERT INTO `m_pengepul` (`ID`, `ID_PENG`, `NAMA_PENG`, `ALAMAT_PENG`, `TELP_PENG`, `STATUSS`, `TANGGAL_BUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`) VALUES
(1, 'KD/PG/2020-05-01-1', 'PENGEPUL BPK ABAY', 'LANDASAN ULIN', '081311237667', 1, '2020-05-01 06:40:03', 'ADMIN', '2020-07-30 12:45:21', 'ADMIN'),
(4, 'KD/PG/2020-05-11-3', 'PAK AMAT', 'TRIKORA', '082222222222', 1, '2020-05-11 00:19:32', 'ADMIN', '2020-07-30 12:44:43', 'ADMIN'),
(5, 'KD/PG/2020-08-24-4', 'MARIANA', 'JL.SIRINGAN', '087653421097', 1, '2020-08-24 17:50:40', 'ADMIN', NULL, NULL),
(6, 'KD/PG/2020-08-24-5', 'BU TIA', 'JL.TERNATE 2', '08569722543', 1, '2020-08-24 19:30:57', 'ADMIN', NULL, NULL),
(7, 'KD/PG/2020-11-28-6', 'SANTO', 'JL.MAWAR BLOK C5', '08569722543', 1, '2020-11-28 19:27:23', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_sampah`
--

CREATE TABLE `m_sampah` (
  `ID` int(11) NOT NULL,
  `JENIS` varchar(20) NOT NULL,
  `KD_SAMPAH` varchar(20) NOT NULL,
  `DESKRIPSI` varchar(50) NOT NULL,
  `SATUAN` varchar(10) NOT NULL,
  `STOCK` int(11) NOT NULL,
  `HARGA_BAYAR` int(11) NOT NULL,
  `HARGA_TABUNG` int(11) NOT NULL,
  `HARGA_JUAL` int(11) NOT NULL,
  `TANGGAL_BUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime DEFAULT NULL,
  `DIUBAH_OLEH` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_sampah`
--

INSERT INTO `m_sampah` (`ID`, `JENIS`, `KD_SAMPAH`, `DESKRIPSI`, `SATUAN`, `STOCK`, `HARGA_BAYAR`, `HARGA_TABUNG`, `HARGA_JUAL`, `TANGGAL_BUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`) VALUES
(10, 'PLASTIK', 'P1', 'PLASTIK EMBERAN', 'KG', 16500, 1400, 1500, 2500, '2020-05-26 06:21:01', 'ADMIN', NULL, NULL),
(11, 'PLASTIK', 'P2', 'PLASTIK KERASAN', 'KG', 0, 250, 300, 1400, '2020-05-26 06:22:48', 'ADMIN', NULL, NULL),
(12, 'PLASTIK', 'P3', 'PLASTIK BOTOL BENING', 'KG', 27500, 900, 1000, 3000, '2020-05-26 06:24:23', 'ADMIN', '2020-05-26 07:42:33', 'ADMIN'),
(13, 'PLASTIK', 'P4', 'PLASTIK BOTOL BENING BERSIH', 'KG', 36000, 1500, 1600, 3000, '2020-05-26 06:28:06', 'ADMIN', '2020-05-26 07:42:54', 'ADMIN'),
(14, 'PLASTIK', 'P5', 'PLASTIK BOTOL WARNA', 'KG', 0, 750, 900, 2000, '2020-05-26 06:29:15', 'ADMIN', '2020-05-26 07:43:13', 'ADMIN'),
(15, 'PLASTIK', 'P6', 'PLASTIK BOTOL WARNA BERSIH', 'KG', 12000, 1000, 1100, 2000, '2020-05-26 06:30:45', 'ADMIN', '2020-05-26 07:43:35', 'ADMIN'),
(16, 'PLASTIK', 'P7', 'PLASTIK GELAS', 'KG', 4500, 2300, 2500, 6500, '2020-05-26 06:37:53', 'ADMIN', '2020-05-26 07:43:51', 'ADMIN'),
(17, 'PLASTIK', 'P8', 'PLASTIK GELAS BERSIH', 'KG', 24000, 5000, 5500, 6500, '2020-05-26 06:40:18', 'ADMIN', '2020-05-26 07:44:06', 'ADMIN'),
(18, 'PLASTIK', 'P9', 'PLASTIK GELAS MONTE', 'KG', 1000, 1400, 1500, 2500, '2020-05-26 06:42:15', 'ADMIN', '2020-05-26 07:44:26', 'ADMIN'),
(19, 'PLASTIK', 'P10', 'PLASTIK KACA', 'KG', 0, 1200, 1300, 2000, '2020-05-26 06:43:35', 'ADMIN', '2020-05-26 07:44:43', 'ADMIN'),
(20, 'PLASTIK', 'P11', 'PLASTIK CD/DVD', 'KG', 0, 500, 600, 1200, '2020-05-26 06:48:22', 'ADMIN', '2020-05-26 07:45:06', 'ADMIN'),
(21, 'PLASTIK', 'P12', 'PLASTIK JEREGEN/BOTOL OLI', 'KG', 0, 1850, 2000, 3000, '2020-05-26 06:50:05', 'ADMIN', '2020-05-26 07:45:22', 'ADMIN'),
(22, 'PLASTIK', 'P13', 'PLASTIK GALON BESAR', 'BJ', 61, 900, 1000, 1500, '2020-05-26 06:52:53', 'ADMIN', '2020-05-26 07:45:38', 'ADMIN'),
(23, 'PLASTIK', 'P14', 'PLASTIK CAMPUR', 'KG', 20500, 200, 300, 1000, '2020-05-26 06:58:29', 'ADMIN', '2020-05-26 07:45:55', 'ADMIN'),
(24, 'KERTAS', 'K1', 'KERTAS KARDUS', 'KG', 333000, 1500, 1600, 2300, '2020-05-26 07:29:21', 'ADMIN', NULL, NULL),
(25, 'KERTAS', 'K2', 'KERTAS KORAN BERSIH', 'KG', 28000, 1300, 1400, 2000, '2020-05-26 07:30:41', 'ADMIN', NULL, NULL),
(26, 'KERTAS', 'K3', 'KERTAS DUPLEX/WARNA', 'KG', 20000, 400, 500, 700, '2020-05-26 07:31:54', 'ADMIN', '2020-07-30 13:51:40', 'ADMIN'),
(27, 'KERTAS', 'K4', 'KERTAS HVS', 'KG', 88100, 1400, 1500, 1600, '2020-05-26 07:33:41', 'ADMIN', NULL, NULL),
(28, 'KERTAS', 'K5', 'KERTAS BUKU PUTIH', 'KG', 7000, 900, 1000, 1300, '2020-05-26 07:36:24', 'ADMIN', NULL, NULL),
(29, 'KERTAS', 'K6', 'KERTAS MAJALAH', 'KG', 2100, 400, 500, 1000, '2020-05-26 07:37:10', 'ADMIN', NULL, NULL),
(30, 'KERTAS', 'K7', 'KERTAS BURAM', 'KG', 9500, 400, 500, 1000, '2020-05-26 07:39:10', 'ADMIN', NULL, NULL),
(31, 'KERTAS', 'K8', 'KERTAS CAMPUR', 'KG', 5000, 400, 500, 1000, '2020-05-26 07:41:19', 'ADMIN', NULL, NULL),
(32, 'ALUMUNIUM', 'A1', 'ALUMUNIUM ASLI', 'KG', 3000, 9000, 10000, 15000, '2020-05-26 08:06:07', 'ADMIN', NULL, NULL),
(33, 'ALUMUNIUM', 'A2', 'ALUMUNIUM KALENG', 'KG', 0, 8500, 9000, 10000, '2020-05-26 08:07:25', 'ADMIN', NULL, NULL),
(34, 'ALUMUNIUM', 'AK1', 'AKI BEKAS', 'KG', 53000, 7500, 8000, 10000, '2020-05-26 08:08:18', 'ADMIN', NULL, NULL),
(35, 'ALUMUNIUM', 'B1', 'BESI TEBAL', 'KG', 8900, 1200, 1300, 3000, '2020-05-26 08:09:32', 'ADMIN', NULL, NULL),
(36, 'ALUMUNIUM', 'B2', 'BESI TIPIS', 'KG', 123000, 500, 600, 2000, '2020-05-26 08:10:27', 'ADMIN', NULL, NULL),
(37, 'ALUMUNIUM', 'B3', 'BESI KALENG', 'KG', 37500, 350, 400, 1000, '2020-05-26 08:11:20', 'ADMIN', NULL, NULL),
(38, 'LOGAM', 'B4', 'BESI SENG', 'KG', 81200, 350, 400, 2000, '2020-05-26 08:12:02', 'ADMIN', '2020-05-26 13:24:14', 'ADMIN'),
(39, 'ALUMUNIUM', 'KN', 'KUNINGAN', 'KG', 0, 1000, 1500, 2000, '2020-05-26 08:13:02', 'ADMIN', NULL, NULL),
(40, 'ALUMUNIUM', 'M1', 'MINYAK JELANTAH', 'LITER', 6, 1800, 2000, 3600, '2020-05-26 08:15:36', 'ADMIN', NULL, NULL),
(41, 'ALUMUNIUM', 'S1', 'SEPEDA/SEPEDA MOTOR', 'KG', 0, 500, 600, 1000, '2020-05-26 08:16:44', 'ADMIN', NULL, NULL),
(42, 'ALUMUNIUM', 'T1', 'TEMBAGA', 'KG', 0, 700, 1000, 1500, '2020-05-26 08:17:53', 'ADMIN', NULL, NULL),
(44, 'KACA', 'BK2', 'BOTOL KACA KECAP/SAOS', 'BIJI', 8, 200, 250, 300, '2020-05-26 08:20:36', 'ADMIN', NULL, NULL),
(45, 'KACA', 'BK3', 'BOTOL KECAP SIRUP ABC', 'BIJI', 1, 150, 200, 250, '2020-05-26 08:21:39', 'ADMIN', NULL, NULL),
(46, 'KACA', 'BK4', 'BOTOL KECAP SIRUP MARJAN', 'BIJI', 63, 150, 200, 250, '2020-05-26 08:22:35', 'ADMIN', '2020-05-26 08:24:13', 'ADMIN'),
(47, 'KACA', 'BK5', 'BOTOL KACA BENSIN', 'BIJI', 0, 500, 700, 1000, '2020-05-26 08:23:16', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengambilan`
--

CREATE TABLE `tb_pengambilan` (
  `ID` int(11) NOT NULL,
  `KD_PENGAMBILAN` varchar(20) NOT NULL,
  `ID_PET` varchar(20) NOT NULL,
  `ID_NAS` varchar(20) NOT NULL,
  `TGL_AMBIL` date NOT NULL,
  `JML_AMBIL` int(11) NOT NULL,
  `TANGGAL_BUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime NOT NULL,
  `DIUBAH_OLEH` varchar(20) NOT NULL,
  `ROW_STATUS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengambilan`
--

INSERT INTO `tb_pengambilan` (`ID`, `KD_PENGAMBILAN`, `ID_PET`, `ID_NAS`, `TGL_AMBIL`, `JML_AMBIL`, `TANGGAL_BUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`, `ROW_STATUS`) VALUES
(1, 'TRP/202008241850021', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-7', '2020-08-24', 400, '2020-08-24 18:50:02', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(2, 'TRP/202008241850522', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-7', '2020-08-24', 2000, '2020-08-24 18:50:52', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(3, 'TRP/202008241851013', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-7', '2020-08-24', 7000, '2020-08-24 18:51:01', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(4, 'TRP/202008241938264', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-7', '2020-08-24', 9, '2020-08-24 19:38:26', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(5, 'TRP/202011281931385', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-2', '2020-11-28', 9, '2020-11-28 19:31:38', 'ADMIN', '0000-00-00 00:00:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tabungan`
--

CREATE TABLE `tb_tabungan` (
  `ID` int(11) NOT NULL,
  `KD_TB` varchar(20) NOT NULL,
  `KD_TR` varchar(20) NOT NULL,
  `ID_PET` varchar(20) NOT NULL,
  `ID_NAS` varchar(20) NOT NULL,
  `TGL_TABUNG` date NOT NULL,
  `JML_TABUNG` int(11) NOT NULL,
  `TANGGAL_BUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime NOT NULL,
  `DIUBAH_OLEH` varchar(20) NOT NULL,
  `ROW_STATUS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tabungan`
--

INSERT INTO `tb_tabungan` (`ID`, `KD_TB`, `KD_TR`, `ID_PET`, `ID_NAS`, `TGL_TABUNG`, `JML_TABUNG`, `TANGGAL_BUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`, `ROW_STATUS`) VALUES
(1, 'TB/202008241849081', 'TR/202008241849083', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-7', '2020-08-24', 11400, '2020-08-24 18:49:08', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(2, 'TB/202008251520062', 'TR/2020082515200610', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-4', '2020-08-25', 60000, '2020-08-25 15:20:06', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(3, 'TB/202011281930103', 'TR/202011281930101', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-2', '2020-11-28', 3770, '2020-11-28 19:30:10', 'ADMIN', '0000-00-00 00:00:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tr_beli`
--

CREATE TABLE `tr_beli` (
  `ID` int(11) NOT NULL,
  `KD_TR` varchar(20) NOT NULL COMMENT 'TR/tahun bln tgl jam menit detik urutan',
  `ID_PET` varchar(20) NOT NULL,
  `ID_NAS` varchar(20) NOT NULL,
  `TANGGAL_DIBUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_DIUBAH` datetime DEFAULT NULL,
  `DIUBAH_OLEH` varchar(20) DEFAULT NULL,
  `ROW_STATUS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_beli`
--

INSERT INTO `tr_beli` (`ID`, `KD_TR`, `ID_PET`, `ID_NAS`, `TANGGAL_DIBUAT`, `DIBUAT_OLEH`, `TANGGAL_DIUBAH`, `DIUBAH_OLEH`, `ROW_STATUS`) VALUES
(1, 'TR/202008241847281', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-2', '2020-08-24 18:47:28', 'ADMIN', NULL, NULL, 0),
(2, 'TR/202008241847442', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-2', '2020-08-24 18:47:44', 'ADMIN', NULL, NULL, 0),
(3, 'TR/202008241849083', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-7', '2020-08-24 18:49:08', 'ADMIN', NULL, NULL, 0),
(4, 'TR/202008241850364', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-3', '2020-08-24 18:50:36', 'ADMIN', NULL, NULL, 0),
(5, 'TR/202008241851235', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-9', '2020-08-24 18:51:23', 'ADMIN', NULL, NULL, 0),
(6, 'TR/202008241851416', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-6', '2020-08-24 18:51:41', 'ADMIN', NULL, NULL, 0),
(7, 'TR/202008241855357', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-5', '2020-08-24 18:55:35', 'ADMIN', NULL, NULL, 0),
(8, 'TR/202008241859328', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-4', '2020-08-24 18:59:32', 'ADMIN', NULL, NULL, 0),
(9, 'TR/202008251204589', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-5', '2020-08-25 12:04:58', 'ADMIN', NULL, NULL, 0),
(10, 'TR/2020082515200610', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-4', '2020-08-25 15:20:06', 'ADMIN', NULL, NULL, 0),
(11, 'TR/202011281930101', 'KD/PT/2020-05-01-3', 'KD/NS/2020-07-30-2', '2020-11-28 19:30:10', 'ADMIN', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tr_beli_detail`
--

CREATE TABLE `tr_beli_detail` (
  `ID` int(11) NOT NULL,
  `KD_TR` varchar(20) NOT NULL,
  `JENIS_SAMPAH` varchar(20) NOT NULL,
  `KD_SAMPAH` varchar(20) NOT NULL,
  `SATUAN` varchar(10) NOT NULL,
  `JUMLAH_TERIMA` int(11) NOT NULL,
  `HARGA` int(11) NOT NULL,
  `NET_HARGA` int(11) NOT NULL,
  `JENIS_BAYAR` varchar(10) NOT NULL,
  `TANGGAL_DIBUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime DEFAULT NULL,
  `DIUBAH_OLEH` varchar(20) DEFAULT NULL,
  `ROW_STATUS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_beli_detail`
--

INSERT INTO `tr_beli_detail` (`ID`, `KD_TR`, `JENIS_SAMPAH`, `KD_SAMPAH`, `SATUAN`, `JUMLAH_TERIMA`, `HARGA`, `NET_HARGA`, `JENIS_BAYAR`, `TANGGAL_DIBUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`, `ROW_STATUS`) VALUES
(1, 'TR/202008241847281', 'KERTAS', 'K3', 'KG', 6000, 400, 2400, 'BAYAR', '2020-08-24 18:47:28', 'ADMIN', NULL, NULL, 0),
(2, 'TR/202008241847442', 'KERTAS', 'K3', 'KG', 6000, 400, 2400, 'BAYAR', '2020-08-24 18:47:44', 'ADMIN', NULL, NULL, 0),
(3, 'TR/202008241847442', 'KERTAS', 'K5', 'KG', 7000, 900, 6300, 'BAYAR', '2020-08-24 18:47:44', 'ADMIN', NULL, NULL, 0),
(4, 'TR/202008241849083', 'ALUMUNIUM', 'B1', 'KG', 6000, 1300, 7800, 'TABUNG', '2020-08-24 18:49:08', 'ADMIN', NULL, NULL, 0),
(5, 'TR/202008241849083', 'ALUMUNIUM', 'B3', 'KG', 9000, 400, 3600, 'TABUNG', '2020-08-24 18:49:08', 'ADMIN', NULL, NULL, 0),
(6, 'TR/202008241850364', 'KERTAS', 'K1', 'KG', 7000, 1500, 10500, 'BAYAR', '2020-08-24 18:50:36', 'ADMIN', NULL, NULL, 0),
(7, 'TR/202008241851235', 'LOGAM', 'B4', 'KG', 60000, 350, 21000, 'BAYAR', '2020-08-24 18:51:23', 'ADMIN', NULL, NULL, 0),
(8, 'TR/202008241851416', 'KERTAS', 'K4', 'KG', 70000, 1400, 98000, 'BAYAR', '2020-08-24 18:51:41', 'ADMIN', NULL, NULL, 0),
(9, 'TR/202008241855357', 'LOGAM', 'B4', 'KG', 5000, 350, 1750, 'BAYAR', '2020-08-24 18:55:35', 'ADMIN', NULL, NULL, 0),
(10, 'TR/202008241859328', 'ALUMUNIUM', 'B2', 'KG', 23000, 500, 11500, 'BAYAR', '2020-08-24 18:59:32', 'ADMIN', NULL, NULL, 0),
(11, 'TR/202008251204589', 'ALUMUNIUM', 'B2', 'KG', 100000, 500, 50000, 'BAYAR', '2020-08-25 12:04:58', 'ADMIN', NULL, NULL, 0),
(12, 'TR/2020082515200610', 'PLASTIK', 'P13', 'BJ', 60, 1000, 60000, 'TABUNG', '2020-08-25 15:20:06', 'ADMIN', NULL, NULL, 0),
(13, 'TR/202011281930101', 'ALUMUNIUM', 'B1', 'KG', 2900, 1300, 3770, 'TABUNG', '2020-11-28 19:30:10', 'ADMIN', NULL, NULL, 0);

--
-- Triggers `tr_beli_detail`
--
DELIMITER $$
CREATE TRIGGER `STOCK_TERIMA_INSERT` AFTER INSERT ON `tr_beli_detail` FOR EACH ROW BEGIN
	DECLARE JENIS_NEW VARCHAR(20);
    DECLARE KD_SAMPAH_NEW VARCHAR(20);
    DECLARE STOCK_NEW INT(11);
    DECLARE STOCK_M_SAM INT(11);
    
    SET JENIS_NEW = NEW.JENIS_SAMPAH;
    SET KD_SAMPAH_NEW = NEW.KD_SAMPAH;
    SELECT STOCK INTO STOCK_M_SAM FROM m_sampah WHERE JENIS = JENIS_NEW AND KD_SAMPAH = KD_SAMPAH_NEW;
    SET STOCK_NEW = NEW.JUMLAH_TERIMA + STOCK_M_SAM;
    
    UPDATE m_sampah SET STOCK = STOCK_NEW WHERE JENIS = JENIS_NEW AND KD_SAMPAH = KD_SAMPAH_NEW;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `STOCK_TERIMA_UPDATE` AFTER UPDATE ON `tr_beli_detail` FOR EACH ROW BEGIN
	DECLARE JENIS_NEW VARCHAR(20);
    DECLARE KD_SAMPAH_NEW VARCHAR(20);
    DECLARE STOCK_NEW INT(11);
    DECLARE STOCK_M_SAM INT(11);
    DECLARE JML_TABUNG_NEW INT(11);
    
    SET JENIS_NEW = NEW.JENIS_SAMPAH;
    SET KD_SAMPAH_NEW = NEW.KD_SAMPAH;
    SELECT STOCK INTO STOCK_M_SAM FROM m_sampah WHERE JENIS = JENIS_NEW AND KD_SAMPAH = KD_SAMPAH_NEW;
    
    IF NEW.ROW_STATUS < 0 THEN
        SET STOCK_NEW = STOCK_M_SAM - OLD.JUMLAH_TERIMA;
        
        IF OLD.JENIS_BAYAR = 'TABUNG' THEN
        	SELECT JML_TABUNG INTO JML_TABUNG_NEW FROM tb_tabungan WHERE KD_TR = NEW.KD_TR;
        	UPDATE tb_tabungan SET JML_TABUNG = (JML_TABUNG_NEW - OLD.NET_HARGA) WHERE KD_TR = NEW.KD_TR;
        END IF;
    ELSE
    	IF NEW.JUMLAH_TERIMA < OLD.JUMLAH_TERIMA THEN
            SET STOCK_NEW = (NEW.JUMLAH_TERIMA - OLD.JUMLAH_TERIMA) + STOCK_M_SAM;
        ELSEIF NEW.JUMLAH_TERIMA > OLD.JUMLAH_TERIMA THEN
            SET STOCK_NEW = (NEW.JUMLAH_TERIMA - OLD.JUMLAH_TERIMA) + STOCK_M_SAM;
        ELSE
            SET STOCK_NEW = (NEW.JUMLAH_TERIMA - OLD.JUMLAH_TERIMA) + STOCK_M_SAM;
        END IF;
    END IF;
    
    UPDATE m_sampah SET STOCK = STOCK_NEW WHERE JENIS = JENIS_NEW AND KD_SAMPAH = KD_SAMPAH_NEW;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tr_jual`
--

CREATE TABLE `tr_jual` (
  `ID` int(11) NOT NULL,
  `KD_TR_JUAL` varchar(20) NOT NULL COMMENT 'TRJ/tahun bln tgl jam menit detik urutan',
  `ID_PET` varchar(20) NOT NULL,
  `ID_PENG` varchar(20) NOT NULL,
  `TANGGAL_BUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime DEFAULT NULL,
  `DIUBAH_OLEH` varchar(20) DEFAULT NULL,
  `ROW_STATUS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_jual`
--

INSERT INTO `tr_jual` (`ID`, `KD_TR_JUAL`, `ID_PET`, `ID_PENG`, `TANGGAL_BUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`, `ROW_STATUS`) VALUES
(1, 'TRJ/202008241834301', 'KD/PT/2020-05-01-3', 'KD/PG/2020-05-01-1', '2020-08-24 18:34:30', 'ADMIN', NULL, NULL, 0),
(2, 'TRJ/202008241834362', 'KD/PT/2020-05-01-3', 'KD/PG/2020-05-01-1', '2020-08-24 18:34:36', 'ADMIN', NULL, NULL, 0),
(3, 'TRJ/202008241848113', 'KD/PT/2020-05-01-3', 'KD/PG/2020-05-11-3', '2020-08-24 18:48:11', 'ADMIN', NULL, NULL, 0),
(4, 'TRJ/202008241852134', 'KD/PT/2020-05-01-3', '', '2020-08-24 18:52:13', 'ADMIN', NULL, NULL, 0),
(5, 'TRJ/202008241858335', 'KD/PT/2020-05-01-3', 'KD/PG/2020-08-24-4', '2020-08-24 18:58:33', 'ADMIN', NULL, NULL, 0),
(6, 'TRJ/202008241917046', 'KD/PT/2020-05-01-3', 'KD/PG/2020-05-11-3', '2020-08-24 19:17:04', 'ADMIN', NULL, NULL, 0),
(7, 'TRJ/202009302245157', 'KD/PT/2020-05-01-3', 'KD/PG/2020-05-11-3', '2020-09-30 22:45:15', 'ADMIN', NULL, NULL, 0),
(8, 'TRJ/202011281931148', 'KD/PT/2020-05-01-3', '', '2020-11-28 19:31:14', 'ADMIN', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tr_jual_detail`
--

CREATE TABLE `tr_jual_detail` (
  `ID` int(11) NOT NULL,
  `KD_TR_JUAL` varchar(20) NOT NULL,
  `JENIS_SAMPAH` varchar(20) NOT NULL,
  `KD_SAMPAH` varchar(20) NOT NULL,
  `SATUAN` varchar(10) NOT NULL,
  `JUMLAH_JUAL` int(11) NOT NULL,
  `HARGA` int(11) NOT NULL,
  `NET_HARGA` int(11) NOT NULL,
  `TANGGAL_BUAT` datetime NOT NULL,
  `DIBUAT_OLEH` varchar(20) NOT NULL,
  `TANGGAL_UBAH` datetime NOT NULL,
  `DIUBAH_OLEH` varchar(20) NOT NULL,
  `ROW_STATUS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_jual_detail`
--

INSERT INTO `tr_jual_detail` (`ID`, `KD_TR_JUAL`, `JENIS_SAMPAH`, `KD_SAMPAH`, `SATUAN`, `JUMLAH_JUAL`, `HARGA`, `NET_HARGA`, `TANGGAL_BUAT`, `DIBUAT_OLEH`, `TANGGAL_UBAH`, `DIUBAH_OLEH`, `ROW_STATUS`) VALUES
(1, 'TRJ/202008241834301', 'KACA', 'BK4', 'BIJI', 0, 250, 50, '2020-08-24 18:34:30', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(2, 'TRJ/202008241834362', 'KACA', 'BK4', 'BIJI', 0, 250, 50, '2020-08-24 18:34:36', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(3, 'TRJ/202008241848113', 'KERTAS', 'K3', 'KG', 8000, 700, 5600, '2020-08-24 18:48:11', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(4, 'TRJ/202008241852134', 'KERTAS', 'K4', 'KG', 6000, 1600, 9600, '2020-08-24 18:52:13', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(5, 'TRJ/202008241858335', 'ALUMUNIUM', 'B2', 'KG', 12000, 2000, 24000, '2020-08-24 18:58:33', 'ADMIN', '0000-00-00 00:00:00', '', 0),
(6, 'TRJ/202008241917046', 'KERTAS', 'K3', 'KG', 60000, 700, 42000, '2020-08-24 19:17:04', 'ADMIN', '0000-00-00 00:00:00', '', 0);

--
-- Triggers `tr_jual_detail`
--
DELIMITER $$
CREATE TRIGGER `STOCK_JUAL_INSERT` AFTER INSERT ON `tr_jual_detail` FOR EACH ROW BEGIN
	DECLARE JENIS_NEW VARCHAR(20);
    DECLARE KD_SAMPAH_NEW VARCHAR(20);
    DECLARE STOCK_NEW INT(11);
    DECLARE STOCK_M_SAM INT(11);
    
    SET JENIS_NEW = NEW.JENIS_SAMPAH;
    SET KD_SAMPAH_NEW = NEW.KD_SAMPAH;
    SELECT STOCK INTO STOCK_M_SAM FROM m_sampah WHERE JENIS = JENIS_NEW AND KD_SAMPAH = KD_SAMPAH_NEW;
    SET STOCK_NEW = STOCK_M_SAM - NEW.JUMLAH_JUAL;
   
    UPDATE m_sampah SET STOCK = STOCK_NEW WHERE JENIS = JENIS_NEW AND KD_SAMPAH = KD_SAMPAH_NEW;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `STOCK_JUAL_UPDATE` AFTER UPDATE ON `tr_jual_detail` FOR EACH ROW BEGIN
	DECLARE JENIS_NEW VARCHAR(20);
    DECLARE KD_SAMPAH_NEW VARCHAR(20);
    DECLARE STOCK_NEW INT(11);
    DECLARE STOCK_M_SAM INT(11);
    
    SET JENIS_NEW = NEW.JENIS_SAMPAH;
    SET KD_SAMPAH_NEW = NEW.KD_SAMPAH;
    SELECT STOCK INTO STOCK_M_SAM FROM m_sampah WHERE JENIS = JENIS_NEW AND KD_SAMPAH = KD_SAMPAH_NEW;
    
    IF NEW.ROW_STATUS < 0 THEN
        SET STOCK_NEW = STOCK_M_SAM + OLD.JUMLAH_JUAL;
    ELSE
    	IF NEW.JUMLAH_JUAL < OLD.JUMLAH_JUAL THEN
            SET STOCK_NEW = (OLD.JUMLAH_JUAL - NEW.JUMLAH_JUAL) + STOCK_M_SAM;
        ELSEIF NEW.JUMLAH_JUAL > OLD.JUMLAH_JUAL THEN
            SET STOCK_NEW = STOCK_M_SAM - (NEW.JUMLAH_JUAL - OLD.JUMLAH_JUAL);
        ELSE
            SET STOCK_NEW = (NEW.JUMLAH_JUAL - OLD.JUMLAH_JUAL) + STOCK_M_SAM;
        END IF;
    END IF;
    
    UPDATE m_sampah SET STOCK = STOCK_NEW WHERE JENIS = JENIS_NEW AND KD_SAMPAH = KD_SAMPAH_NEW;
    
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_admin`
--
ALTER TABLE `m_admin`
  ADD PRIMARY KEY (`ID`,`USERNAME`);

--
-- Indexes for table `m_nasabah`
--
ALTER TABLE `m_nasabah`
  ADD PRIMARY KEY (`ID`,`ID_NAS`);

--
-- Indexes for table `m_pengepul`
--
ALTER TABLE `m_pengepul`
  ADD PRIMARY KEY (`ID`,`ID_PENG`);

--
-- Indexes for table `m_sampah`
--
ALTER TABLE `m_sampah`
  ADD PRIMARY KEY (`ID`,`JENIS`,`KD_SAMPAH`);

--
-- Indexes for table `tb_pengambilan`
--
ALTER TABLE `tb_pengambilan`
  ADD PRIMARY KEY (`ID`,`KD_PENGAMBILAN`);

--
-- Indexes for table `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  ADD PRIMARY KEY (`ID`,`KD_TB`);

--
-- Indexes for table `tr_beli`
--
ALTER TABLE `tr_beli`
  ADD PRIMARY KEY (`ID`,`KD_TR`);

--
-- Indexes for table `tr_beli_detail`
--
ALTER TABLE `tr_beli_detail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tr_jual`
--
ALTER TABLE `tr_jual`
  ADD PRIMARY KEY (`ID`,`KD_TR_JUAL`);

--
-- Indexes for table `tr_jual_detail`
--
ALTER TABLE `tr_jual_detail`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_admin`
--
ALTER TABLE `m_admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `m_nasabah`
--
ALTER TABLE `m_nasabah`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `m_pengepul`
--
ALTER TABLE `m_pengepul`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_sampah`
--
ALTER TABLE `m_sampah`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tb_pengambilan`
--
ALTER TABLE `tb_pengambilan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tr_beli`
--
ALTER TABLE `tr_beli`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tr_beli_detail`
--
ALTER TABLE `tr_beli_detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tr_jual`
--
ALTER TABLE `tr_jual`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tr_jual_detail`
--
ALTER TABLE `tr_jual_detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
