<?php
//error_reporting(0);

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "db_aplikasicuti";

// Membuat koneksi
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

// Mengecek koneksi
if (!$conn) {
    die("Tidak dapat terhubung ke database: " . mysqli_connect_error());
}
?>
