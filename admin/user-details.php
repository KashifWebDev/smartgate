<?php

$page_title="Home";
$current_page="My Devices" ;
$redirec="admin";
$dir="../../";
require 'common.php';
$link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
//$link = str_replace('http://access1technologies.com/smart_gate/admin/userid_', '', $link);
$link = str_replace('http://localhost/SmartGate/admin/userid_', '', $link);
$link = str_replace('.php', '', $link);

//echo $link;

//$link = str_replace('http://turktronics.com/pages/', '', $link);
//echo 'Id from url: '.$link.'<br>';

//Get user details
$query = "SELECT * FROM users where id=$link";
$res = mysqli_query($con, $query);
$row = mysqli_fetch_array($res);
$count = mysqli_num_rows($res);
if ($count != 1){
    echo '
                <!DOCTYPE html>
            <html>
            <head>
              <title>404 Page Not Found</title>
            </head>
            <body>
              <center>
                <h3 style="color:red;">Page Not Found</h3>
              </center>
            </body>
            </html>
    ';
    exit();
}
    
$user_mac=$row['mac'];
$user_id=$row['id'];
$user_location=$row['country'];


//echo "UserID: ".$user_id;

//FIlter current user's mac record from full table
$sql = "SELECT * FROM app_requests WHERE user_id=$user_id";
//$sql = "SELECT * FROM devices";
$result = mysqli_query($con, $sql);
if ($count != 1)
    header('Location: 404');
/*
echo $row;
$row = mysqli_fetch_array($res);
$mob_mac = $row["id"];
$mob_mac = $row["mobile_mac"];
$machine_mac = $row["machine_mac"];
$mobile_mac = $row["mobile_mac"];
$datetime = $row["date_time"];
*/
$token = "../";
//echo $mob_mac.'------'.$machine_mac;


?>


        <!-- DataTables Example -->
      <?php require 'devices-list-view.php'; ?>
      
      
        <!-- DataTables Example -->
      <?php require 'user-device-history.php'; ?>
      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <?php require 'parts/footer.php'; ?>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>
