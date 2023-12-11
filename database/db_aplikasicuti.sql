-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2023 at 07:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_aplikasicuti`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_adm` int(11) NOT NULL,
  `nama_adm` varchar(50) NOT NULL,
  `telp_adm` varchar(15) NOT NULL,
  `user_adm` varchar(50) NOT NULL,
  `pass_adm` varchar(100) NOT NULL,
  `foto_adm` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_adm`, `nama_adm`, `telp_adm`, `user_adm`, `pass_adm`, `foto_adm`) VALUES
(1, 'Administrator', '0361- 426788', 'admin1', 'hoki2023', '');

-- --------------------------------------------------------

--
-- Table structure for table `cuti`
--

CREATE TABLE `cuti` (
  `no_cuti` varchar(30) NOT NULL,
  `npp` varchar(20) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `tgl_awal` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `durasi` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `leader` varchar(20) NOT NULL,
  `manager` varchar(30) NOT NULL,
  `spv` varchar(20) NOT NULL,
  `stt_cuti` varchar(50) NOT NULL,
  `file_pendukung` text DEFAULT NULL,
  `ket_reject` text NOT NULL,
  `hrd_app` int(2) NOT NULL,
  `lead_app` int(2) NOT NULL,
  `spv_app` int(2) NOT NULL,
  `mng_app` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `npp` varchar(20) NOT NULL,
  `nama_emp` varchar(100) NOT NULL,
  `jk_emp` varchar(20) NOT NULL,
  `telp_emp` varchar(20) NOT NULL,
  `divisi` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `hak_akses` varchar(20) NOT NULL,
  `jml_cuti` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto_emp` text NOT NULL,
  `active` varchar(20) NOT NULL,
  `id_adm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`npp`, `nama_emp`, `jk_emp`, `telp_emp`, `divisi`, `jabatan`, `alamat`, `hak_akses`, `jml_cuti`, `password`, `foto_emp`, `active`, `id_adm`) VALUES
('0002-0505', 'Agus Herry Pramana', 'Laki-Laki', '62', '-', 'KOMISARIS UTAMA', 'JL KENYERI NO. 02 TABANAN', 'Leader', 12, '0002-0505', 'foto0002-0505r.jpg', 'Aktif', 1),
('0035-0611', 'I Wayan Reken', 'Laki-Laki', '62', 'OB', 'OFFICE BOY', 'JL RAMA GG IV NO 07 DELOD PEKEN TABANAN', 'Pegawai', 12, '0035-0611', 'foto0035-0611r.jpg', 'Aktif', 1),
('0036-0711', 'I Made Wijayadi', 'Laki-Laki', '62', 'OPERASIONAL', 'MANAGER OPERASIONAL', 'BR KUTUH KELOD, DS SAMSAM, KEC KERAMBITAN TABANAN', 'Manager', 12, '0036-0711', 'foto0036-0711r.jpg', 'Aktif', 1),
('0041-1011', 'Ni Putu Ayu Sri Andayani', 'Perempuan', '62', 'ACCOUNTING', 'ACCOUNTING', 'BR DINAS KERIDAN, SENGANAN PENEBEL', 'Pegawai', 12, '0041-1011', 'foto0041-1011r.jpg', 'Aktif', 1),
('0045-0512', 'I Gede Rai Suranata', 'Laki-Laki', '62', 'OPERASIONAL', 'OPERATIONAL OFFICER', 'BR DANGIN YEH DESA ABIANBASE, MENGWI BADUNG', 'Pegawai', 12, '0045-0512', 'foto0045-0512r.jpg', 'Aktif', 1),
('0052-0413', 'Ni Putu Ekarini', 'Laki-Laki', '62', 'OPERASIONAL', 'SPV. OPERASIONAL', 'BANJAR DINAS LEBAH MARGA TABANAN', 'Pegawai', 12, '0052-0413', 'foto0052-0413r.jpg', 'Aktif', 1),
('0053-0413', 'Gusti Ayu Agung Masheni', 'Perempuan', '62', 'SKAI', 'STAFF SKAI SENIOR', 'JL. NGURAH RAI NO. 50 KEDIRI TABANAN', 'Pegawai', 12, '0053-0413', 'foto0053-0413r.jpg', 'Aktif', 1),
('0064-1213', 'I Gede Agus Purna Sugiarta', 'Laki-Laki', '62', 'SECURITY', 'SECURITY', 'BR. DINAS SERASON, DS PITRA, KEC. PENEBEL, TABANAN', 'Pegawai', 12, '0064-1213', 'foto0064-1213r.jpg', 'Aktif', 1),
('0076-0814', 'Ida Ayu Kade Krisnawati', 'Perempuan', '62', 'CREDIT ADMIN', 'CREDIT ADMIN SENIOR', 'DS. MANUKAYA TAMPAK SIRING, GIANYAR', 'Pegawai', 12, '0076-0814', 'foto0076-0814r.jpg', 'Aktif', 1),
('0079-0415', 'Ni Wayan Anggaraniti', 'Perempuan', '62', 'OPERASIONAL', 'SPV. OPERASIONAL', 'BR. KEMENUH KANGIN, KEMENUH, SUKAWATI, GIANYAR', 'Pegawai', 12, '0079-0415', 'foto0079-0415r.jpg', 'Aktif', 1),
('0111-0517', 'Nyoman Adnyani', 'Perempuan', '62', 'SPV. HCGA', 'SPV. HCGA', 'DUSUN PENASAN, DS TIHINGAN, BANJARANGKAN-KLUNGKUNG', 'Manager', 12, '0111-0517', 'foto0111-0517r.jpg', 'Aktif', 1),
('0117-1117', 'Anak Agung Putu Diani Primahayanti', 'Laki-Laki', '62', 'CREDIT ADMIN', 'CREDIT ADMIN SENIOR', 'JL. TUKAD BUANA II/61, BATUKANDIK, PADANG SAMBIAN  KAJA, DENPASAR BARAT', 'Pegawai', 12, '0117-1117', 'foto0117-1117r.jpg', 'Aktif', 1),
('0118-1117', 'I Kadek Suarita Yasa', 'Laki-Laki', '62', 'BUSINESS', 'BUSINESS MANAJER', 'BR. DINAS BANYU BUAH, DS BULIAN, KEC. KUBUTAMBAHAN, KAB. BULELENG', 'Manager', 12, '0118-1117', 'foto0118-1117r.jpg', 'Aktif', 1),
('0131-0518', 'Aprilius Ndoa', 'Laki-Laki', '62', 'STAFF GA', 'STAFF GA SENIOR', 'JL BYPASS NGURAH RAI NO 107 SANUR', 'Pegawai', 12, '0131-0518', 'foto0131-0518r.jpg', 'Aktif', 1),
('0133-0718', 'I Komang Budiadnyana', 'Laki-Laki', '62', 'BUSINESS SUPPORT', 'MANAGER BUSINESS SUPPORT', 'JL. GN AGUNG GG YAMUNA III A NO 20 A DPS, BR/LINK. KERTHA JATI', 'Manager', 12, '0133-0718', 'foto0133-0718r.jpg', 'Aktif', 1),
('0141-1218', 'I Gede Adnyana Putra', 'Laki-Laki', '62', 'OPERASIONAL', 'DIGITAL OFFICER SENIOR', 'DUSUN KORIPAN TENGAH,DESA BANJARANGKAN, KLUNGKUNG', 'Pegawai', 12, '0141-1218', 'foto0141-1218r.jpg', 'Aktif', 1),
('0143-0119', 'Kadek Diah Krisnayanti', 'Perempuan', '62', 'TELLER SENIOR', 'TELLER SENIOR', 'JL. SIULAN GANG MANGGA NO. 2 PENATIH', 'Pegawai', 12, '0143-0119', 'foto0143-0119r.jpg', 'Aktif', 1),
('0149-0619', 'I Gusti Ngurah Budhiarta', 'Laki-Laki', '62', 'SPV. FUNDING', 'SPV. FUNDING', 'JL. GN SARI A-7 DUKUH SARI, PADANG SAMBIAN KAJA, DENBAR', 'Pegawai', 12, '0149-0619', 'foto0149-0619r.jpg', 'Aktif', 1),
('0150-0719', 'I Wayan Bukti', 'Laki-Laki', '62', 'MANAGER MKA', 'MANAGER MKA', 'BR. DANGIN JELINJING DESA BELALANG, KEC. KEDIRI, TABANAN', 'Manager', 12, '0150-0719', 'foto0150-0719r.jpg', 'Aktif', 1),
('0157-0919', 'I Made Ade Kurniawan', 'Laki-Laki', '62', 'CREDIT TEAM LEADER', 'CREDIT TEAM LEADER', 'JL. SURADIPA NO.10 PEGUYANGAN DENPASAR', 'Pegawai', 12, '0157-0919', 'foto0157-0919r.jpg', 'Aktif', 1),
('0162-0919', 'Ni Wayan Sedarni', 'Perempuan', '62', '-', 'KOMISARIS', 'Jl Raya Dalung No 16 C Br Untal-untal Dalung', 'Leader', 12, '0162-0919', 'foto0162-0919r.jpg', 'Aktif', 1),
('0168-1019', 'Ni Luh Sri Janiari', 'Perempuan', '62', 'CUSTOMER SERVICE', 'CUSTOMER SERVICE', 'DUSUN KALERAN, DS TIMUHAN KEC. BANJARANGKAN KLUNGKUNG', 'Pegawai', 12, '0168-1019', 'foto0168-1019r.jpg', 'Aktif', 1),
('0172-0320', 'I Gede Putu Edy Prayoga', 'Laki-Laki', '62', 'BUSINESS DEVELOPMENT', 'SPV. BUSINESS DEVELOPMENT', 'JL. TUKAD LANGUAN I B/4 BR ANTAP', 'Pegawai', 12, '0172-0320', 'foto0172-0320r.jpg', 'Aktif', 1),
('0176-1219', 'I Gusti Agung Ngurah Agung', 'Laki-Laki', '62', 'CRO SENIOR', 'CRO SENIOR', 'JL. NUSA KAMBANGAN 178 DPS', 'Pegawai', 12, '0176-1219', 'foto0176-1219r.jpg', 'Aktif', 1),
('0183-0220', 'I Gusti Agung Dhenina Sari', 'Perempuan', '62', 'SKAI', 'MANAJER SKAI', 'JALAN SANGHYANG, BR CICA DESA ABIANBASE MENGWI BADUNG', 'Manager', 12, '0183-0220', 'foto0183-0220r.jpg', 'Aktif', 1),
('0185-0320', 'I Putu Martino Subrata', 'Laki-Laki', '62', 'DIGITAL OFFICER SENIOR', 'DIGITAL OFFICER SENIOR', 'LINK. UBUD TENGAH DESA UBUD, KEC. UBUD GIANYAR', 'Pegawai', 12, '0185-0320', 'foto0185-0320r.jpg', 'Aktif', 1),
('0188-0620', 'Made Aldo Perkasa', 'Laki-Laki', '62', 'CREDIT OFFICER JUNIOR', 'CREDIT OFFICER JUNIOR', 'JL.KERTANEGARA V/5 DPS', 'Pegawai', 12, '0188-0620', 'foto0188-0620r.jpg', 'Aktif', 1),
('0197-0620', 'Kadek Intan Sanchia Sari', 'Perempuan', '62', 'CREDIT OFFICER JUNIOR', 'CREDIT OFFICER JUNIOR', 'BR. SAMUAN KANGIN CARANGSARI  DESA CARANGSARI KEC. PETANG BADUNG', 'Pegawai', 12, '0197-0620', 'foto0197-0620r.jpg', 'Aktif', 1),
('0204-0720', 'I Putu Febriana', 'Laki-Laki', '62', 'CRO', 'SPV. CRO', 'Jl. Tukad Sumbul Blok 20/12 A Kediri Tabanan', 'Pegawai', 12, '0204-0720', 'foto0204-0720r.jpg', 'Aktif', 1),
('0206-0720', 'Ni Putu Indrayanti', 'Perempuan', '62', 'CREDIT OFFICER JUNIOR', 'CREDIT OFFICER JUNIOR', 'JL. SAHADEWA BR RENING DS BALUK-NEGARA', 'Pegawai', 12, '0206-0720', 'foto0206-0720r.jpg', 'Aktif', 1),
('0208-0720', 'Putu Agus Sukma Swastika', 'Laki-Laki', '62', 'BUSINESS SUPPORT', 'SPV. BUSINESS SUPPORT', 'Jl. Bedahulu XXII No. 6 Dps', 'Pegawai', 12, '0208-0720', 'foto0208-0720r.jpg', 'Aktif', 1),
('0209-0820', 'Anak Agung Indra Bishawan', 'Laki-Laki', '62', 'BUSINESS SUPPORT', 'SPV. BUSINESS SUPPORT', 'JL WATURENGGONG III/4 DPS LINGK. TEGAL SARI PANJER ', 'Pegawai', 12, '0209-0820', 'foto0209-0820r.jpg', 'Aktif', 1),
('0216-0920', 'I Wayan Suartama', 'Laki-Laki', '62', 'SPV. DIGITAL', 'SPV. DIGITAL', 'JL NUSA INDAH N0 68 ABIAN KAPAS', 'Pegawai', 12, '0216-0920', 'foto0216-0920r.jpg', 'Aktif', 1),
('0227-1120', 'I Wayan Tangkas Werdhi Sujana', 'Laki-Laki', '62', 'CREDIT OFFICER JUNIOR', 'CREDIT OFFICER JUNIOR', 'JL BATUYANG GG PIPIT VII NO 14 BR. TEGEHE DESA BATUBULAN SUKAWATI', 'Pegawai', 12, '0227-1120', 'foto0227-1120r.jpg', 'Aktif', 1),
('0228-1120', 'I Gede Rommy Juniarta Putra', 'Laki-Laki', '62', 'CREDIT OFFICER SENIOR', 'CREDIT OFFICER SENIOR', 'JL. BEDAHULU XXII/11 DPS LINGK. PRAJA SARI PEGUYANGAN', 'Pegawai', 12, '0228-1120', 'foto0228-1120r.jpg', 'Aktif', 1),
('0229-1120', 'Putu Mahanta Pradana Putra', 'Laki-Laki', '62', 'CRO', 'CRO', 'JL. RAYA PADANG LUWIH NO. 60 BR GAJI FESA DALUNG KTA UTARA BADUNG', 'Pegawai', 12, '0229-1120', 'foto0229-1120r.jpg', 'Aktif', 1),
('0235-0121', 'Ni Nyoman Dewi Diah Kumalawati', 'Perempuan', '62', 'CREDIT OFFICER JUNIOR', 'CREDIT OFFICER JUNIOR', 'BR. DINAS CAU DESA TUA MARGA TABANAN', 'Pegawai', 12, '0235-0121', 'foto0235-0121r.jpg', 'Aktif', 1),
('0240-0221', 'Kadek Dwi Pande Wahyuda', 'Perempuan', '62', 'CREDIT OFFICER SENIOR', 'CREDIT OFFICER SENIOR', 'JL MAYOR METRA NO 77 DESA BERATAN BULELENG', 'Pegawai', 12, '0240-0221', 'foto0240-0221r.jpg', 'Aktif', 1),
('0248-0621', 'I Made Peri Arnawa', 'Laki-Laki', '62', 'BUSINESS SUPPORT SUPERVISOR', 'BUSINESS SUPPORT SUPERVISOR', 'BR. DANGIN JELINJING DESA BELALANG, KEC. KEDIRI, TABANAN', 'Pegawai', 12, '0248-0621', 'foto0248-0621r.jpg', 'Aktif', 1),
('0251-1021', 'Dony Wicaksono Indra', 'Laki-Laki', '62', 'DRIVER', 'DRIVER', 'JL. LETDA WINDA IV/1 DPS BR.LINGK KAYUMAS KAJA', 'Pegawai', 12, '0251-1021', 'foto0251-1021r.jpg', 'Aktif', 1),
('0252-1121', 'Made Gabhina Aryayustama', 'Perempuan', '62', 'FUNDING OFFICER', 'FUNDING OFFICER', 'PONDOK BAHAR PERMAI T/17 DESA PONDOK BAHAR KARANG TENGAH KOTA TANGGERANG', 'Pegawai', 12, '0252-1121', 'foto0252-1121r.jpg', 'Aktif', 1),
('0255-1221', 'Kadek Sri Ayu Martini', 'Perempuan', '62', 'STAFF HC', 'STAFF HC', 'BR. DINAS KALISADA, SERIRIT BULELENG', 'Pegawai', 12, '0255-1221', 'foto0255-1221r.jpg', 'Aktif', 1),
('0259-0122', 'Anak Agung Heri Surya Negara', 'Laki-Laki', '62', 'STAFF GA', 'STAFF GA', 'Br. Dinas Pekandelan Kerambitan, Tabanan', 'Pegawai', 12, '0259-0122', 'foto0259-0122r.jpg', 'Aktif', 1),
('0270-0422', 'Rizki Andika Putra', 'Laki-Laki', '62', 'CREDIT OFFICER JUNIOR', 'CREDIT OFFICER JUNIOR', 'Jl. Letda Suji No.11 Kayumas', 'Pegawai', 12, '0270-0422', 'foto0270-0422r.jpg', 'Aktif', 1),
('0271-0522', 'Wayan Sutara', 'Laki-Laki', '62', 'SECURITY', 'SECURITY', 'Br. Dinas Tagtag Tegallinggah Penebel Tabanan', 'Pegawai', 12, '0271-0522', 'foto0271-0522r.jpg', 'Aktif', 1),
('0274-0722', 'I Putu Bayu Saraswastika', 'Laki-Laki', '62', 'SPV SKAI', 'SPV SKAI', 'Dusun Swelagiri Desa Aan', 'Pegawai', 12, '0274-0722', 'foto0274-0722r.jpg', 'Aktif', 1),
('0275-0822', 'Ni Putu Agustin Cintya Dewi', 'Perempuan', '62', 'CREDIT OFFICER JUNIOR', 'CREDIT OFFICER JUNIOR', 'Jl. Seroja Gg. Belimbing No. 3 Denpasar ', 'Pegawai', 12, '0275-0822', 'foto0275-0822r.jpg', 'Aktif', 1),
('0276-0822', 'John Miliando', 'Laki-Laki', '62', '-', 'DIREKTUR UTAMA', 'Perum. Padang Pesona Graha Adi Blok B-1 Padangsambian Denpasar', 'Leader', 12, '0276-0822', 'foto0276-0822r.jpg', 'Aktif', 1),
('0278-0822', 'I Gusti Ayu Devika Inten Ardhaanggani', 'Perempuan', '62', 'DIGITAL', 'ADMIN DIGITAL', 'Jl. Lembusora Gg. Arjuna No 8 Denpasar', 'Pegawai', 12, '0278-0822', 'foto0278-0822r.jpg', 'Aktif', 1),
('0279-0922', 'Komang Ayu Septiani', 'Perempuan', '62', 'SPV MKA', 'SPV MKA', 'DUSUN/BT TUNJUK TENGAH', 'Pegawai', 12, '0279-0922', 'foto0279-0922r.jpg', 'Aktif', 1),
('0287-0723', 'Anak Agung Bagus Eka Suantara', 'Laki-Laki', '62', 'CREDIT OFFICER JUNIOR', 'CREDIT OFFICER JUNIOR', 'Jl. Nangka Gg. X No. 1 Denpasar', 'Pegawai', 4, '0287-0723', 'foto0287-0723r.jpg', 'Aktif', 1),
('0291-1023', 'Joko Wiyanto', 'Laki-Laki', '62', 'CALON DIREKTUR', 'CALON DIREKTUR', 'Perum. Padang Lestari Kerobokan Kaja, Kuta Utara', 'Leader', 4, '0291-1023', 'foto0291-1023r.jpg', 'Aktif', 1),
('0293-1123', 'Agung Yoga Jayapratama', 'Laki-Laki', '62', 'IT OFFICER', 'IT OFFICER', 'JL. MELATI III BLOK G NO. 3 PUTRI MUMBUL LINGK. TAMA GRIYA JIMBARAN', 'Pegawai', 4, '0293-1123', 'foto0293-1123r.jpg', 'Aktif', 1),
('SPV-0111-0517', 'SPV. Nyoman Adnyani', 'Perempuan', '62', 'HCGA', 'SPV. HCGA', 'DUSUN PENASAN, DS TIHINGAN, BANJARANGKAN-KLUNGKUNG', 'Supervisor', 12, 'SPV-0111-0517', 'foto0111-0517r.jpg', 'Aktif', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_adm`);

--
-- Indexes for table `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`no_cuti`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`npp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_adm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
