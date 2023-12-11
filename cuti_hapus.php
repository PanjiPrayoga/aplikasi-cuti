<?php
include("sess_check.php");
include("dist/config/koneksi.php"); // Ubah sesuai dengan lokasi file konfigurasi database Anda

if (isset($_GET['no'])) {
    $no_cuti = $_GET['no'];

    // Query untuk mengambil data cuti berdasarkan nomor cuti
    $sql = "SELECT * FROM cuti WHERE no_cuti = '$no_cuti'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $cuti_data = mysqli_fetch_assoc($result);

        // Hapus data cuti dari database
        $delete_sql = "DELETE FROM cuti WHERE no_cuti = '$no_cuti'";
        $delete_result = mysqli_query($conn, $delete_sql);

        if ($delete_result) {
            // Jika penghapusan berhasil, kembalikan ke halaman data cuti dengan pesan sukses
            header("Location: app_all.php?success=1&message=Cuti dengan nomor $no_cuti telah dihapus.");
            exit();
        } else {
            // Jika terjadi kesalahan saat menghapus, kembalikan dengan pesan error
            header("Location: app_all.php?error=1&message=Gagal menghapus cuti. Silakan coba lagi.");
            exit();
        }
    } else {
        // Jika data cuti tidak ditemukan, kembalikan dengan pesan error
        header("Location: app_all.php?error=2&message=Cuti dengan nomor $no_cuti tidak ditemukan.");
        exit();
    }
} else {
    // Jika parameter nomor cuti tidak ditemukan, kembalikan dengan pesan error
    header("Location: app_all.php?error=3&message=Nomor cuti tidak valid.");
    exit();
}
?>
