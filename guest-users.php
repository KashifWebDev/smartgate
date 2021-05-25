<?php
session_start();
 //echo "ID: ".$_SESSION["id"];
$page_title="Guest Users";
$current_page="Guest Users" ;
$redirec="admin";
require 'parts/common.php';
require 'functions.php';

$comp_id = $_SESSION["company"];
$sql1 = "SELECT * FROM company WHERE id=$comp_id";
$res1 = mysqli_query($con, $sql1);
$row_comp = mysqli_fetch_assoc($res1);
$company_name = $row_comp["name"];

if (isset($_GET["del_guest_user"]) && isset($_GET["del_device_id"])) {
    $uid = $_GET["del_guest_user"];
    $d_id = $_GET["del_device_id"];
//    $sql = "DELETE FROM users WHERE id=$uid";
    $sql1 = "DELETE FROM user_and_devices WHERE id=$d_id";
//    if (mysqli_query($con, $sql) && mysqli_query($con, $sql1)) {
    if (mysqli_query($con, $sql1)) {
        echo '
                <script>
                    alert("User UnLinked!");
                    window.location.replace("guest-users.php");
                </script>
            ';
    }
}

if(isset($_POST["update-user"])){
    require 'parts/db.php';
    $fname=mysqli_real_escape_string($con, $_POST["fname"]);
    $lname=mysqli_real_escape_string($con, $_POST["lname"]);
    $email=mysqli_real_escape_string($con, $_POST["email"]);
    $pass=mysqli_real_escape_string($con, $_POST["pass"]);
    $connectionID = $con;
    $my_query="SELECT * FROM users WHERE email = '$email' AND id!=".$_SESSION["id"];
    //echo $my_query;
    $select = mysqli_query($connectionID, $my_query) or exit(mysqli_error($connectionID));
    if(mysqli_num_rows($select)) {
        echo '
                <script>
                    alert("Email already in use!");
                    window.location.replace("dashboard.php");
                </script>
            ';
    }



    $query="UPDATE users SET first_name='$fname', last_name='$lname', email='$email', password='$pass' WHERE id=".$_SESSION["id"];
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in first query";
    }else{
        echo "<script>alert('Record Updated');
                    window.location.replace('dashboard.php');</script>";
    }


}
$user_session_id = $_SESSION["id"];

$sql1 = "SELECT * FROM users WHERE id=".$user_session_id;
$res1 = mysqli_query($con, $sql1);
$row = mysqli_fetch_assoc($res1);
?>

<!-- Modal For Upload Image-->
<div class="modal fade" id="upload_img" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Assign New Device</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="image_upload_form" action="" method="POST" enctype="multipart/form-data">
                    <input type="file" id="file" name="image" />
                    <input type="submit"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<?php
if(isset($_FILES['image'])){
    require 'parts/db.php';
    $errors= array();
    $rand = rand();
    $file_name = $rand.$_FILES['image']['name'];
    $file_size =$_FILES['image']['size'];
    $file_tmp =$_FILES['image']['tmp_name'];
    $file_type=$_FILES['image']['type'];
    $file_ext=strtolower(end(explode('.',$_FILES['image']['name'])));

    $extensions= array("jpeg","jpg","png");

    if(in_array($file_ext,$extensions)=== false){
        $errors[]="extension not allowed, please choose a JPEG or PNG file.";
    }

    if($file_size > 2097152){
        $errors[]='File size must be excately 2 MB';
    }

    if(empty($errors)==true){
        move_uploaded_file($file_tmp,"images/users/".$file_name);
        $sql = "UPDATE users SET image='$file_name' WHERE id = $user_session_id";
        //echo $sql;
        if(mysqli_query($con, $sql)){
            echo '
                <script>window.location = "dashboard.php";</script>
            ';
        }
    }else{
        print_r($errors);
    }
}
?>

<?php
$id = $_SESSION["id"];
$sql = "SELECT * FROM users WHERE id=$id";
$res = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($res);


if(isset($_POST["link-device"])){
    $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    $mobile_mac = $_POST["mobile_mac"];
    $device_mac = $_POST["device_mac"];
    $loc = $_POST["device_name"];

    $query = "SELECT * FROM user_and_devices WHERE machine_mac = '".$device_mac."'";
    $select = mysqli_query($con, $query);

    if(mysqli_num_rows($select)) {
        unset($_POST["link-device"]);
        echo '<script>alert("Deivce Mac is already being used!");
                window.location.replace("'.$actual_link.'");
                </script>';
        exit();

    }

    $now = new DateTime();
    $cur_time=$now->format('d-m-Y H:i:s');

    $query="Insert into user_and_devices (user_id, device_name, machine_mac, mobile_mac, active, date_time) 
            VALUES ($id, '$loc', '$device_mac', '$mobile_mac', 1, '$cur_time')";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in second query. ERR: ".mysqli_error($con);
    }else{
        echo "<script>alert('Device Linked!');
                window.location.replace('dashboard.php');
                </script>";
    }


}
?>
<!-- Modal For New Deivce-->
<div class="modal fade" id="link_new_device" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Assign New Device</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form method="post" action="" enctype="multipart/form-data">
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" placeholder="Device MAC" name="device_mac" required>
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" placeholder="Mobile MAC" name="mobile_mac" required>
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" placeholder="Device Name" name="device_name" required>
                    </div>
                    <button class="btn btn-primary btn-block" type="submit" name="link-device" id="nav-font">Register</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal For New User-->
<div class="modal fade" id="edit_user" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Update User Details</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form method="post" action="" enctype="multipart/form-data">
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $row["first_name"];?>" name="fname">
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $row["last_name"]; ?>" name="lname">
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $row["email"];?>" name="email">
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="password" class="form-control" id="email" value="<?php echo $row["password"];?>" name="pass">
                    </div>
                    <button class="btn btn-primary btn-block" type="submit" name="update-user" id="nav-font">Update</button>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



    <div class="row">
        <div class="col-md-12">
            <?php
            $table_name = "";
            $where = "";
//            $sql = "SELECT * FROM users a, user_and_devices b
//                    WHERE a.parent_id = $user_session_id AND b.user_id = $user_session_id AND b.is_guest=1
//                    AND b.machine_mac!='' AND b.device_name!='' GROUP BY b.id";

//            $sql = "SELECT a.id AS user_row_id,a.*,b.id AS devices_row_id,b.* FROM users a, user_and_devices b
//                    WHERE a.parent_id = $user_session_id AND b.user_id = $user_session_id AND b.is_guest=1
//                    AND b.machine_mac!='' AND b.device_name!='' GROUP BY user_row_id";

//            $sql = "SELECT a.id AS user_row_id,a.*,b.id AS devices_row_id,b.* FROM users a, user_and_devices b
//                    WHERE a.parent_id = $user_session_id AND b.user_id = a.id AND b.is_guest=1
//                     GROUP BY user_row_id";
            $sql = "SELECT a.id AS user_row_id,a.*,b.id AS devices_row_id,b.* FROM users a, user_and_devices b
                    WHERE a.parent_id = $user_session_id AND b.parent_id = $user_session_id AND b.is_guest=1
                     GROUP BY b.id";


                require 'cards-guest-users.php';
            ?>
        </div>
    </div>


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

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

<!-- Modal For Guest Users-->
<div class="modal fade" id="guest_user" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Guest User</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form method="post" action="" enctype="multipart/form-data">
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" name="name" placeholder="Full Name">
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" name="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" name="mobile_mac" placeholder="Mobile Mac">
                    </div>
                    <div class="form-group">
                        <select id="nav-font" class="form-control" name="machine_mac">
                            <option value="">Link Device</option>
                            <?php
                                $query= "SELECT * FROM user_and_devices WHERE user_id=$user_session_id";
                                $res = mysqli_query($con, $query);
                                while($row = mysqli_fetch_assoc($res)){
                            ?>
                            <option value="<?php echo $row["machine_mac"]; ?>"><?php echo $row["device_name"].' | '.$row["machine_mac"]; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="password" class="form-control" id="email"  name="pass" placeholder="Password">
                    </div>
                    <button class="btn btn-primary btn-block" type="submit" name="add-guest" id="nav-font">Update</button>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<?php
if(isset($_POST["add-guest"])){
$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$mobile_mac = $_POST["mobile_mac"];
$device_mac = $_POST["machine_mac"];
    $name = $_POST["name"];
    $email = $_POST["email"];
    $pass = $_POST["pass"];

$query = "SELECT * FROM guest_users WHERE email = '".$email."'";
$select = mysqli_query($con, $query);

if(mysqli_num_rows($select)) {
unset($_POST["link-device"]);
echo '<script>alert("Email is already being used!");
    window.location.replace("'.$actual_link.'");
</script>';
exit();

}

$now = new DateTime();
$cur_time=$now->format('d-m-Y H:i:s');

$query="Insert into guest_users (parent_id, machine_mac, mobile_mac, fullname, email, password)
VALUES ($user_session_id, '$device_mac', '$mobile_mac', 1, '$name', '$email', '$pass')";
if(!mysqli_query($con, $query)){
//echo '<script>alert("error in first query")';
    echo "error in second query. ERR: ".mysqli_error($con);
    }else{
        echo "<script>alert('Device Linked!');
        window.location.replace('guest-users.php');
</script>";
}


}
?>
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

<!-- Demo scripts for this page-->
<script src="<?php echo $dir; ?>js/demo/datatables-demo.js"></script>

</body>

</html>


<?php

if(isset($_GET["open_btn_val"]) and isset($_GET["row_id"])){
    $val = $_GET["open_btn_val"];
    $row_id = $_GET["row_id"];
    $sql = "UPDATE  user_and_devices SET open_btn=$val WHERE  id=$row_id";
    if(mysqli_query($con, $sql)){
        echo '<script>
            alert("Settings updated!");
            window.location.replace("guest-users.php");
        </script> ';
    }
}
if(isset($_GET["hold_btn_val"]) and isset($_GET["row_id"])){
    $val = $_GET["hold_btn_val"];
    $row_id = $_GET["row_id"];
    $sql = "UPDATE user_and_devices SET hold_btn=$val WHERE id=$row_id";
    if(mysqli_query($con, $sql)){
        echo '<script>
            alert("Settings updated!");
            window.location.replace("guest-users.php");
        </script> ';
    }else{
        echo '<script>
            alert("Error!'.mysqli_error($con).'");
        </script> ';
    }

}
if(isset($_GET["close_btn_val"]) and isset($_GET["row_id"])){
    $val = $_GET["close_btn_val"];
    $row_id = $_GET["row_id"];
    $sql = "UPDATE  user_and_devices SET close_btn=$val WHERE  id=$row_id";
    if(mysqli_query($con, $sql)){
        echo '<script>
            alert("Settings updated!");
            window.location.replace("guest-users.php");
        </script> ';
    }else{
        echo '<script>
            alert("Error!'.mysqli_error($con).'");
//            alert("Error!'.$sql.'");
        </script> ';
    }
}


if(isset($_GET["action"]) and isset($_GET["machine_mac"])){
    $id = $_SESSION["id"];
    $machine_mac = $_GET["machine_mac"];
    $action = $_GET["action"];
    $sql = "UPDATE  user_and_devices SET action='$action' WHERE (user_id=$id AND machine_mac='$machine_mac')";
    if(mysqli_query($con, $sql)){
        echo '<script>
            alert("Action Set to '.$action.'");
            window.location.replace("dashboard.php");
        </script> ';
    }
}


if (isset($_GET["delete_device"])) {
    $mac = $_GET["delete_device"];
    $sql = "DELETE FROM user_and_devices WHERE id='$mac'";
    if (mysqli_query($con, $sql)) {
        echo '
                <script>
                    alert("Device UnLinked!");
                    window.location.replace("dashboard.php");
                </script>
            ';
    }
}
?>

<?php

session_start();
$record_id = $_SESSION["id"];

if(isset($_POST["link-device"])){
    $mobile_mac = $_POST["mobile_mac"];
    $device_mac = $_POST["device_mac"];
    $loc = $_POST["device_name"];

    $query = "SELECT * FROM user_and_devices WHERE machine_mac = '".$device_mac."'";
    $select = mysqli_query($con, $query);

    if(mysqli_num_rows($select)) {
        unset($_POST["link-device"]);
        echo '<script>alert("Deivce Mac is already being used!");
                window.location.replace("dashboard.php");
                </script>';
        exit();

    }

    $now = new DateTime();
    $cur_time=$now->format('d-m-Y H:i:s');

    $query="Insert into user_and_devices (user_id, device_name, machine_mac, mobile_mac, active, date_time) 
            VALUES ($record_id, '$loc', '$device_mac', '$mobile_mac', 1, '$cur_time')";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in second query. ERR: ".mysqli_error($con);
    }else{
        echo "<script>alert('Device Linked!');
                window.location.replace('dashboard.php');
                </script>";
    }


}




if(isset($_GET["action"]) and isset($_GET["machine_mac"])){
    $id = $_SESSION["id"];
    $machine_mac = $_GET["machine_mac"];
    $action = $_GET["action"];
    $sql = "UPDATE  user_and_devices SET action='$action' WHERE (user_id=$id AND machine_mac='$machine_mac')";
    if(mysqli_query($con, $sql)){
        echo '<script>
            alert("Action Set to '.$action.'");
            window.location.replace("dashboard.php");
        </script> ';
    }
}
?>

