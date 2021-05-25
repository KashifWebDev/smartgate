    <?php
$page_title="Home";
$current_page="Dashboard" ;
$redirec="admin";
$dir="../";
require 'common.php';

?>

    <div class="alert alert-info alert-dismissible  w-50 mx-auto">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Welcome Back!</strong> Web Administrator.
    </div>

<!-- DataTables Example -->
    <?php //require 'users-table-view.php'; ?>
    <?php
        $table_name = "users";
        $where = " is_admin = 0 ";
        require 'cards-users.php';
    ?>





      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <?php require '../parts/footer.php'; ?>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



  <!-- Bootstrap core JavaScript-->
  <script src="<?php echo $dir; ?>vendor/jquery/jquery.min.js"></script>
  <script src="<?php echo $dir; ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<?php echo $dir; ?>vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="<?php echo $dir; ?>vendor/datatables/jquery.dataTables.js"></script>
  <script src="<?php echo $dir; ?>vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<?php echo $dir; ?>js/sb-admin.min.js"></script>


</body>

</html>


<?php
    if(isset($_GET["del_user"])){
        $id = $_GET["del_user"];
        $sql = "DELETE FROM users WHERE id=$id";
        if(mysqli_query($con, $sql)){
            echo '
                <script>
                    alert("User Deleted!");
                    window.location.replace("dashboard.php");
                </script>
            ';
        }
    }
?>