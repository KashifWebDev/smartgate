<?php
session_start();
//print_r($_SESSION);
//echo "ID: ".$_SESSION["id"];
//exit();
$page_title="Home";
$current_page="Dashboard" ;
$redirec="admin";
require 'parts/common_guest.php';
require 'functions.php';

$user_session_id = $_SESSION["id"];

$sql1 = "SELECT * FROM guest_users WHERE id=".$user_session_id;
$res1 = mysqli_query($con, $sql1);
$row = mysqli_fetch_assoc($res1);
//echo $sql1 ;
//print_r($row);
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
        $uid - $_SESSION["id"];
        $sql = "UPDATE guest_users SET picture='$file_name' WHERE id = $uid";
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
<div class="container">
    <div class="alert alert-warning alert-dismissible">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Welcome!</strong> This is a guest account.
    </div>

</div>
<div class="container row" id="bottom-border-user-dashboard">
    <div class="col-md-12 d-flex">
        <div class="user-img">
            <img id="user-avartar" style="height: 129px; padding-left: 10%;margin-bottom: 8%" class="img-circle" src="images/users/<?php echo $row["picture"]; ?>">
            <button data-toggle="modal" data-target="#upload_img" class="upload-pic-btn" id="upload-img-btn">Update Pic</button>
        </div>
        <div class="user-report-details w-100" style="padding-left: 2%;">
            <div class="d-flex">
                <div>
                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Full Name: &nbsp;&nbsp; </b> <?php echo $row["fullname"]; ?></span><br>
                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Email:&nbsp; </b> <?php echo $row["email"]; ?></span><br>
                </div>
<!--                <div style="margin-left: 2%;">-->
<!--                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Total Devices: &nbsp;</b> --><?php //echo total_devices($con, $user_session_id); ?><!--</span><br>-->
<!--                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Total Schedules: &nbsp;</b> --><?php //echo total_schedules($con, $user_session_id); ?><!--</span><br>-->
<!--                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Total Alerts: &nbsp;</b> --><?php //echo total_alerts($con, $user_session_id); ?><!--</span><br>-->
<!--                </div>-->
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-md-12">
        <?php
        $table_name = "guest_users";
        $where = "parent_id =".$_SESSION["parent_id"];
        $img_name ="gate.jfif";
        require 'cards-devices-guest.php';
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
                    <button class="btn btn-primary btn-block" type="submit" name="add-guest" id="nav-font">Add</button>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
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
if(isset($_GET["action"]) and isset($_GET["machine_mac"])){
    $id = $_SESSION["id"];
    $machine_mac = $_GET["machine_mac"];
    $action = $_GET["action"];

    $sql = "SELECT * FROM schedule WHERE machine_mac = '$machine_mac'";
    //echo $sql;
    $res = mysqli_query($con, $sql);


//    if($date_condition && $time_condition){
    if(true){
        $sql = "INSERT INTO server_requests (machine_mac, request, user_id) VALUE ('$machine_mac', '$action', $id)";
        mysqli_query($con, $sql);

        date_default_timezone_set("Asia/Karachi");
        $time_of_mail = date("M d,Y h:i:s a");
        $u_name = $_SESSION["fullname"];
        $device_name = 'not_set_yet';
        $msg = "Hi $u_name,\n
            Your request for device name '$device_name' is set to $action on $time_of_mail.\n
            You Can't reply on this auto generated email!\n\n
            
         
            MyGate Server";
        $msg = wordwrap($msg,70);
        $subject = "Alert for MyGate";
        // send email
        mail($email,$subject,$msg);


        $sql = "UPDATE  user_and_devices SET server_request='$action' WHERE machine_mac='$machine_mac'";

        if(mysqli_query($con, $sql)){
            echo '<script>
            alert("Action Set to '.$action.'");
            window.location.replace("dashboard_guest.php");
        </script> ';
        }
    }
}

function unauthorized_access_mail($u_name, $device_name, $email){
    date_default_timezone_set("Asia/Karachi");
    $time_of_mail = date("M d,Y h:i:s a");
    $msg = "Hi $u_name,\n
            It is to inform you that, an unauthorized date/time access was made for deivice '$device_name', on $time_of_mail.\n
            You Can't reply on this auto generated email!\n\n
            
         
            MyGate Server";
    $msg = wordwrap($msg,70);
    $subject = "Alert for Unauthorized date/time access";
    // send email
    mail($email,$subject,$msg);
    echo '<script>
            alert("You are not authorized to access the device at a moment!");
        </script> ';
}

if(isset($_GET["alert_val"]) and isset($_GET["mac"])){
    $id = $_SESSION["id"];
    $alert = $_GET["alert_val"];
    $machine_mac = $_GET["mac"];
    $sql = "UPDATE  user_and_devices SET alarm='$alert' WHERE  machine_mac='$machine_mac'";
    if(mysqli_query($con, $sql)){
        echo '<script>
            window.location.replace("dashboard_guest.php");
        </script> ';
    }
}

?>


