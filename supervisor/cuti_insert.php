<?php
include("sess_check.php");

$npp	= $_POST['npp'];
$ajuan = date('Y-m-d');
$mulai	= $_POST['mulai'];
$akhir	= $_POST['akhir'];
$ket	= $_POST['keterangan'];
$leader	= $_POST['leader'];

$start = new DateTime($mulai);
$finish = new DateTime($akhir);
$int = $start->diff($finish);
$dur = $int->days;
$durasi = $dur + 1;

$stt = "Menunggu Approval Leader";

$id = date('dmYHis');

$pgw = "SELECT * FROM employee WHERE npp='$npp'";
$qpgw = mysqli_query($conn, $pgw);
$ress = mysqli_fetch_array($qpgw);

$jml = $ress['jml_cuti'];


if ($durasi > $jml) {
	echo "<script type='text/javascript'>
			alert('Durasi cuti lebih banyak dari jumlah cuti tersedia!.'); 
			document.location = 'cuti_create.php'; 
		</script>";
} else {
	// Handle file upload
	$targetDirectory = "../uploads_file_pendukung/";  // Gantilah dengan folder tempat Anda ingin menyimpan file
	$timestamp = time();
	$fileName = $timestamp . '_' . basename($_FILES["file_pendukung"]["name"]);
	$targetFile = $targetDirectory . $fileName;
	$uploadOk = 1;
	$fileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

	// Periksa apakah file sudah ada
	if (file_exists($targetFile)) {
		echo "<script type='text/javascript'>
                alert('File sudah ada.'); 
                document.location = 'cuti_create.php'; 
            </script>";
		$uploadOk = 0;
	}

	// Periksa ukuran file jika perlu
	if ($_FILES["file_pendukung"]["size"] > 2000000) {
		echo "<script type='text/javascript'>
                alert('Maaf, ukuran file terlalu besar.'); 
                document.location = 'cuti_create.php'; 
            </script>";
		$uploadOk = 0;
	}

	// Periksa format file
	$allowedFormats = array("pdf", "doc", "docx");
	if (!in_array($fileType, $allowedFormats)) {
		echo "<script type='text/javascript'>
                alert('Pengajuan cuti berhasil!'); 
                document.location = 'cuti_waitapp.php'; 
            </script>";
		$uploadOk = 0;
	}

	// Jika semuanya OK, lakukan unggah file
	if ($uploadOk == 1) {
		if (move_uploaded_file($_FILES["file_pendukung"]["tmp_name"], $targetFile)) {
			// File berhasil diunggah, simpan informasi ke database
			$sql = "INSERT INTO cuti (no_cuti, npp, tgl_pengajuan, tgl_awal, tgl_akhir, durasi, keterangan, leader, stt_cuti, file_pendukung) 
                    VALUES ('$id','$npp','$ajuan','$mulai','$akhir','$durasi','$ket','$leader','$stt','$fileName')";
			$query = mysqli_query($conn, $sql);

			if ($query) {
				echo "<script type='text/javascript'>
                        alert('Pengajuan cuti berhasil!'); 
                        document.location = 'cuti_waitapp.php'; 
                    </script>";
			} else {
				echo "<script type='text/javascript'>
                        alert('Terjadi kesalahan, silahkan coba lagi!.'); 
                        document.location = 'cuti_create.php'; 
                    </script>";
			}
		} else {
			echo "<script type='text/javascript'>
                    alert('Gagal mengunggah file.'); 
                    document.location = 'cuti_create.php'; 
                </script>";
		}
	} else {
		// Jika tidak ada file diunggah, lakukan penyimpanan informasi ke database tanpa file
		$sql = "INSERT INTO cuti (no_cuti, npp, tgl_pengajuan, tgl_awal, tgl_akhir, durasi, keterangan, leader, stt_cuti) 
            VALUES ('$id','$npp','$ajuan','$mulai','$akhir','$durasi','$ket','$leader','$stt')";
		$query = mysqli_query($conn, $sql);

		if ($query) {
			echo "<script type='text/javascript'>
                alert('Pengajuan cuti berhasil!'); 
                document.location = 'cuti_waitapp.php'; 
            </script>";
		} else {
			echo "<script type='text/javascript'>
                alert('Terjadi kesalahan, silahkan coba lagi!.'); 
                document.location = 'cuti_create.php'; 
            </script>";
		}
	}
}
