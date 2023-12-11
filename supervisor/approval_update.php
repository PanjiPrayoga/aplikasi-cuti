<?php
include("sess_check.php");

$no = $_POST['no'];
$aksi = $_POST['aksi'];
$lead = $_POST['lead'];
$reject = $_POST['reject'];
$stt = "";
$null = 0;

if ($aksi == "2") {
    $stt = "Rejected";
    $sql = "UPDATE cuti 
            SET stt_cuti='$stt',
                lead_app='$null',
                ket_reject='$reject'
            WHERE no_cuti='$no'";
    $ress = mysqli_query($conn, $sql);

    if ($ress) {
        header("location: approval_cuti.php?act=update&msg=success");
    } else {
        header("location: approval_cuti.php?act=update&msg=failed");
    }
} else {
    $stt = "Menunggu Approval leader";
    $num = 1;
    $sql = "UPDATE cuti 
            SET stt_cuti='$stt',
                leader='$lead',
                spv_app='$num'
            WHERE no_cuti='$no'";
    $ress = mysqli_query($conn, $sql);

    if ($ress) {
        header("location: approval_cuti.php?act=update&msg=success");
    } else {
        header("location: approval_cuti.php?act=update&msg=failed");
    }
}
?>
