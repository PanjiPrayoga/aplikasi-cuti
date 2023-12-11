<?php
include("sess_check.php");

// Pastikan variabel POST telah diinisialisasi
$no = isset($_POST['no']) ? $_POST['no'] : "";
$aksi = isset($_POST['aksi']) ? $_POST['aksi'] : "";
$reject = isset($_POST['reject']) ? $_POST['reject'] : "";

$stt = "";
$num = 1; // Inisialisasi $num di sini

if ($aksi == "2") {
    $stt = "Rejected";
    $sql = "UPDATE cuti SET
            stt_cuti='". $stt ."',
            ket_reject='". $reject ."'
            WHERE no_cuti='". $no ."'";
    $ress = mysqli_query($conn, $sql);

    if ($ress) {
        header("location: approval_cuti_pegawai.php?act=update&msg=success");
    } else {
        // Handle kesalahan jika query tidak berhasil
        header("location: approval_cuti_pegawai.php?act=update&msg=error");
    }
} else {
    $stt = "Approved";
    $sql = "UPDATE cuti SET
            stt_cuti='". $stt ."',
            spv_app='". $num ."'
            WHERE no_cuti='". $no ."'";
    $ress = mysqli_query($conn, $sql);

    if ($ress) {
        header("location: approval_cuti_pegawai.php?act=update&msg=success");
    } else {
        // Handle kesalahan jika query tidak berhasil
        header("location: approval_cuti_pegawai.php?act=update&msg=error");
    }
}
?>
