<?php
include("sess_check.php");

// deskripsi halaman
$pagedesc = "Approval Cuti";
$menuparent = "approval";
include("layout_top.php");
$now = date('Y-m-d');
$Sql = "SELECT cuti.*, employee.* FROM cuti, employee WHERE cuti.npp=employee.npp AND cuti.no_cuti='$_GET[no]'";
$Qry = mysqli_query($conn, $Sql);
$data = mysqli_fetch_array($Qry);

?>
<script type="text/javascript">
	$(document).ready(function() {
		$('#aksi').change(function() {
			if ($(this).val() === '2') {
				$('#lead').attr('disabled', 'disabled');
				$('#reject').attr('disabled', false);
			} else {
				$('#lead').attr('disabled', false);
				$('#reject').attr('disabled', 'disabled');
			}
		});

	});
</script>
<!-- top of file -->
<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Data Approval Cuti</h1>
			</div><!-- /.col-lg-12 -->
		</div><!-- /.row -->

		<div class="row">
			<div class="col-lg-12"><?php include("layout_alert.php"); ?></div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<form class="form-horizontal" name="cuti" action="approval_update.php" method="POST" enctype="multipart/form-data" onSubmit="return valid();">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>Review Pengajuan Cuti</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<label class="control-label col-sm-3">No. Cuti</label>
								<div class="col-sm-4">
									<input type="text" name="no" class="form-control" value="<?php echo $data['no_cuti']; ?>" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Nama Pemohon</label>
								<div class="col-sm-4">
									<input type="text" name="mulai" class="form-control" value="<?php echo $data['nama_emp']; ?> " readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Tanggal Pengajuan</label>
								<div class="col-sm-4">
									<input type="text" name="mulai" class="form-control" value="<?php echo IndonesiaTgl($data['tgl_pengajuan']); ?> " readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Tanggal Mulai</label>
								<div class="col-sm-4">
									<input type="text" name="mulai" class="form-control" value="<?php echo IndonesiaTgl($data['tgl_awal']); ?> " readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Tanggal Akhir</label>
								<div class="col-sm-4">
									<input type="text" name="mulai" class="form-control" value="<?php echo IndonesiaTgl($data['tgl_akhir']); ?> " readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Durasi</label>
								<div class="col-sm-4">
									<input type="text" name="mulai" class="form-control" value="<?php echo $data['durasi']; ?> " readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Keterangan</label>
								<div class="col-sm-4">
									<textarea name="keterangan" class="form-control" placeholder="Keterangan" rows="3" readonly><?php echo $data['keterangan']; ?></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">File Pendukung</label>
								<div class="col-sm-4">
									<?php
									// Tampilkan nama file pendukung jika ada
									if (!empty($data['file_pendukung'])) {
										echo $data['file_pendukung'];
									} else {
										echo "Tidak ada file pendukung.";
									}
									?>
								</div>
								<div class="col-sm-2">
									<?php
									// Tampilkan tombol unduh jika ada file pendukung
									if (!empty($data['file_pendukung'])) {
										$fileLink = "../uploads_file_pendukung/" . $data['file_pendukung'];
										echo "<a href='$fileLink' class='btn btn-primary btn-xs' target='_blank'>Unduh File</a>";
									}
									?>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Aksi</label>
								<div class="col-sm-4">
									<select name="aksi" id="aksi" class="form-control" required>
										<option value="" selected>---- Pilih Aksi ----</option>
										<option value="1">Approved</option>
										<option value="2">Rejected</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Leader</label>
								<div class="col-sm-4">
									<select name="lead" id="lead" class="form-control" disabled>
										<?php
										$sql_don = "SELECT * FROM employee WHERE hak_akses='Leader' AND active='Aktif' ORDER BY nama_emp ASC";
										$ress_don = mysqli_query($conn, $sql_don);
										while ($li = mysqli_fetch_array($ress_don)) {
											echo '<option value="' . $li['npp'] . '">' . $li['nama_emp'] . '</option>';
										}
										?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Keterangan Reject</label>
								<div class="col-sm-4">
									<textarea name="reject" id="reject" class="form-control" placeholder="Keterangan Reject" rows="3" disabled></textarea>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<button type="submit" name="simpan" class="btn btn-success">Simpan</button>
						</div>
					</div><!-- /.panel -->
				</form>
			</div><!-- /.col-lg-12 -->
		</div><!-- /.row -->
	</div><!-- /.container-fluid -->
</div><!-- /#page-wrapper -->
<!-- bottom of file -->
<?php
include("layout_bottom.php");
?>