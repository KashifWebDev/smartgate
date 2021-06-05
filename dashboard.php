<?php
session_start();
//echo "ID: ".$_SESSION["id"];
$page_title="Home";
$current_page="Dashboard" ;
$redirec="admin";
require 'parts/common.php';
require 'functions.php';


$comp_id = $_SESSION["company"];
$sql1 = "SELECT * FROM company WHERE id=$comp_id";
$res1 = mysqli_query($con, $sql1);
$row_comp = mysqli_fetch_assoc($res1);
$company_name = $row_comp["name"];


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
                <script>act
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
<div class="row" id="bottom-border-user-dashboard">
    <div class="col-md-12 d-flex">
        <div class="user-img">
            <img id="user-avartar" style="height: 129px; padding-left: 10%;margin-bottom: 8%" class="img-circle" src="images/users/<?php echo $row["image"]; ?>">
            <button data-toggle="modal" data-target="#upload_img" class="upload-pic-btn" id="upload-img-btn">Update Pic</button>
        </div>
        <div class="user-report-details w-100" style="padding-left: 2%;">
            <div class="d-flex">
                <div>
                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Full Name: &nbsp;&nbsp; </b> <?php echo $row["first_name"].' '.$row["last_name"]; ?></span><br>
                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Email:&nbsp; </b> <?php echo $row["email"]; ?></span><br>
                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Group: &nbsp;</b> <?php echo $company_name; ?></span><br>
                </div>
                <div style="margin-left: 2%;">
                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Total Devices: &nbsp;</b> <?php echo total_devices($con, $user_session_id); ?></span><br>
                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Total Schedules: &nbsp;</b> <?php echo total_schedules($con, $user_session_id); ?></span><br>
                    <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Total Alerts: &nbsp;</b> <?php echo total_alerts($con, $user_session_id); ?></span><br>
                </div>
            </div>
            <?php if($_SESSION["user_type"]!="guest"){ ?>
                <div class="btn-custom-class d-flex" style="margin-top: 2%;">
                    <button name="model_btn" class="btn m-l-1 btn-warning" data-toggle="modal" data-target="#edit_user">
                        Edit User Details
                    </button>
                    <form method="get" action="list-all-schedules.php">
                        <button style="margin-left: 8px;" name="btn_schedule" class="btn btn-primary">Schedules</button>
                    </form>
                    <form method="post" action="list-all-alerts.php">
                        <input type="hidden" name="userid" value="<?php echo $row["id"]; ?>">
                        <button name="btn_alert" class="btn btn-danger m-l-3">Alerts</button>
                    </form>
                    <button name="model_btn" class="btn m-l-1 btn-success" data-toggle="modal" data-target="#link_new_device">
                        Add New Device
                    </button>
                    <button style="margin-left: 8px;" name="model_btn" class="btn m-l-1" id="custom_brown_btn" data-toggle="modal" data-target="#guest_user">
                        Add Guest
                    </button>
                    <button style="margin-left: 8px;" name="model_btn" class="btn m-l-1 btn-info"  data-toggle="modal" data-target="#guest_link">
                        Link Guest
                    </button>
                </div>
            <?php } ?>
        </div>
    </div>
</div>

<?php
$id = $_SESSION["id"];
$sql = "SELECT * FROM users WHERE id=$id";
$res = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($res);


if(isset($_POST["link-device_noo"])){
    $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    $mobile_mac = $_POST["mobile_mac"];
    $device_mac = $_POST["device_mac"];
    $loc = $_POST["device_name"];

    $query = "SELECT * FROM user_and_devices WHERE machine_mac = '".$device_mac."'";
    $select = mysqli_query($con, $query);

//    if(mysqli_num_rows($select)) {
//        unset($_POST["link-device"]);
//        echo '<script>alert("Deivce Mac is already being used!");
//                window.location.replace("'.$actual_link.'");
//                </script>';
//        exit();
//
//    }

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
                    <div class="form-group">
                        <div class="form-group">
                            <select id="nav-font" class="form-control" name="time_zone_id">
                                <option value="">Select TimeZone</option>
                                <?php
                                $query= "SELECT * FROM timezones";
                                $res = mysqli_query($con, $query);
                                while($row = mysqli_fetch_assoc($res)){
                                    ?>
                                    <option value="<?php echo $row["id"]; ?>"><?php echo $row["title"]; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group">
<!--                            <label>Daylight Saving Time</label>-->
                            <select id="nav-font" class="form-control" name="daylight">
                                <option>Daylight Saving Time</option>
                                <option value="0">OFF</option>
                                <option value="1">ON</option>
                            </select>
                        </div>
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
<!--<script>-->
<!--    $(document).ready(function(){-->
<!--         // $("#all_devices").load("ajax/list_all_devices_card.php");-->
<!--        list_all_devices();-->
<!--    });-->
<!--    function list_all_devices(){-->
<!--        $("#all_devices").load("ajax/list_all_devices_card.php");-->
<!--        setTimeout(list_all_devices, 15000);-->
<!--    }-->
<!--</script>-->
<?php //require 'functions.php'; ?>
<div class="row">
    <div class="col-md-12">
        <?php

        require 'parts/db.php';
        session_start();
        //                print_r($_SESSION);
        $table_name = "user_and_devices";
        if($_SESSION["user_type"]=="guest"){
            $where = "parent_id =".get_parent_id($_SESSION["id"], $con)."
             AND user_id=".$_SESSION["id"]." AND is_guest=1";
        }
        else{
            $where = "user_id =".$_SESSION["id"];
        }
        $img_name ="gate.jfif";
        //        echo 'yes';
        //        echo $where;
        //        print_r($_SESSION);
        //        die();exit();
        require 'cards-devices.php';
        ?>
    </div>
</div>
<?php
function get_parent_id($id, $con){
    $sql = "SELECT * FROM users WHERE id=$id";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["parent_id"];
}
?>


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
                        <input id="nav-font" type="text" class="form-control" id="email" name="name1" placeholder="First Name">
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" name="name2" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <input id="nav-font" type="text" class="form-control" id="email" name="email" placeholder="Email">
                    </div>
                    <!--                    <div class="form-group">-->
                    <!--                        <input id="nav-font" type="text" class="form-control" id="email" name="mobile_mac" placeholder="Mobile Mac">-->
                    <!--                    </div>-->
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
<!-- Modal For Guest Link-->
<div class="modal fade" id="guest_link" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Link Guest User</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form method="post" action="" enctype="multipart/form-data">
                    <div class="form-group">
                        <select id="nav-font" class="form-control" name="user_primary_id">
                            <option value="">Select User</option>
                            <?php
                            $query= "SELECT * FROM users WHERE parent_id=$user_session_id";
                            $res = mysqli_query($con, $query);
                            while($row = mysqli_fetch_assoc($res)){
                                ?>
                                <!--                                <option value="--><?php //echo $row["machine_mac"]; ?><!--">--><?php //echo $row["device_name"].' | '.$row["machine_mac"]; ?><!--</option>-->
                                <option value="<?php echo $row["id"]; ?>"><?php echo $row["first_name"].' '.$row["last_name"]; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <select id="nav-font" class="form-control" name="user_devices_id">
                            <option value="">Select Device</option>
                            <?php
                            $query= "SELECT * FROM user_and_devices WHERE user_id=$user_session_id";
                            $res = mysqli_query($con, $query);
                            while($row = mysqli_fetch_assoc($res)){
                                ?>
                                <!--                                <option value="--><?php //echo $row["machine_mac"]; ?><!--">--><?php //echo $row["device_name"].' | '.$row["machine_mac"]; ?><!--</option>-->
                                <option value="<?php echo $row["id"]; ?>"><?php echo $row["device_name"].' | '.$row["machine_mac"]; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="mob_mac" placeholder="Mobile MAC">
                    </div>
                    <button class="btn btn-primary btn-block" type="submit" name="link-guest" id="nav-font">Add</button>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<?php
function get_machine_mac($con, $id){
    $sql = "SELECT * FROM user_and_devices WHERE id=$id";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
//    echo $sql;
//    echo  $row["machine_mac"];
//    die();exit();
    return $row["machine_mac"];
}
function get_device_name($con, $id){
    $sql = "SELECT * FROM user_and_devices WHERE id=$id";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["device_name"];
}
if(isset($_POST["add-guest"])){
    $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
//    $mobile_mac = $_POST["mobile_mac"];
//    $id_from_form = $_POST["user_devices_id"];
//    $device_mac = get_machine_mac($con, $id_from_form);
    $name1 = $_POST["name1"];
    $name2 = $_POST["name2"];
    $email = $_POST["email"];
    $pass = $_POST["pass"];
//    $devicename = get_device_name($con, $id_from_form);
//    $machinemac = get_machine_mac($con, $id_from_form);

    $query = "SELECT * FROM users WHERE email = '".$email."'";
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
    $comp = $_SESSION['company'];
    $query="Insert into users (parent_id, user_type, first_name, last_name, email, password,company)
            VALUES ($user_session_id, 'guest', '$name1', '$name2', '$email', '$pass', $comp)";
    if(!mysqli_query($con, $query)){
        echo '<script>alert("error in first query. '.mysqli_error($con).'")';
    }else{
        echo '
        <script>
        alert("Guest Added!");
        window.location="dashboard.php";
        </script>';
    }

//    $user_id=mysqli_insert_id($con);

//    $query="Insert into user_and_devices (user_id, is_guest, device_name, machine_mac, mobile_mac, active, date_time)
//            VALUES ($user_session_id, 1, '$devicename', '$machinemac', '$mobile_mac', 1, '$cur_time')";
//    if(!mysqli_query($con, $query)){
//        echo '<script>alert("error in first query. '.mysqli_error($con).'")';
//    }else{
//        echo '
//            <script>
//                alert("Guest Added!");
//            </script>
//        ';
//    }

}
if(isset($_POST["link-guest"])){
//    print_r($_POST);
//    echo "yes";
//    die();exit();
//    echo '<script>alert("'.print_r($_POST).'");</script>';
//    die();exit();
    $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    $id_from_form = $_POST["user_primary_id"];
    $device_id = $_POST["user_devices_id"];
    $device_mac = get_machine_mac($con, $device_id);
    $mob_mac = $_POST["mob_mac"];
    $devicename = get_device_name($con, $device_id);



    $query = "SELECT * FROM user_and_devices WHERE user_id = $id_from_form AND machine_mac='$device_mac'";
    $select = mysqli_query($con, $query);

    if(mysqli_num_rows($select)) {
        unset($_POST["link-device"]);
        echo '<script>alert("User is already linked with this device!");
    window.location.replace("'.$actual_link.'");
</script>';
        exit();

    }


    $query = "SELECT * FROM users WHERE email = '".$email."'";
    $select = mysqli_query($con, $query);

    $query="Insert into user_and_devices (parent_id, user_id, is_guest, device_name, machine_mac, mobile_mac, active)
            VALUES ($user_session_id, $id_from_form, 1, '$devicename', '$device_mac', '$mob_mac', 1)";
    if(!mysqli_query($con, $query)){
        echo '<script>alert("error in first query. '.mysqli_error($con).'")';
    }else{
        echo '
            <script>
                alert("Guest linked!");
                window.location.replace("dashboard.php");
            </script>
        ';
    }

}
if(isset($_GET["del_device"])){
    $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    $id = $_GET["del_device"];
    $crnt_usr = $_SESSION["id"];


    $query = "DELETE FROM user_and_devices WHERE machine_mac = '$id' 
    AND user_id=$crnt_usr";
    //echo '<script>alert("'.$query.'");</script>';die();exit();

//    $query="Insert into user_and_devices (user_id, is_guest, device_name, machine_mac, mobile_mac, active)
//            VALUES ($user_session_id, 1, '$devicename', '$device_mac', '$mob_mac', 1)";
    if(!mysqli_query($con, $query)){
        echo '<script>alert("Eror while deleting device. '.mysqli_error($con).'")';
    }else{
        echo '
            <script>
                alert("Device Deleted");
    window.location.replace("dashboard.php");
            </script>
        ';
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


if(isset($_GET["alert_val"]) and isset($_GET["mac"])){
    $id = $_SESSION["id"];
    $alert = $_GET["alert_val"];
    $machine_mac = $_GET["mac"];
    $sql = "UPDATE  user_and_devices SET alarm='$alert' WHERE  machine_mac='$machine_mac'";
    if(mysqli_query($con, $sql)){
        echo '<script>
            window.location.replace("dashboard.php");
        </script> ';
    }
}

if(isset($_GET["event_val"]) and isset($_GET["mac"])){
    $id = $_SESSION["id"];
    $event = $_GET["event_val"];
    $machine_mac = $_GET["mac"];
    $sql = "UPDATE  user_and_devices SET event_server='$event' WHERE  machine_mac='$machine_mac'";
    if(mysqli_query($con, $sql)){
        echo '<script>
            window.location.replace("dashboard.php");
        </script> ';
    }else{
        echo '<script>
                alert("Error");
//            window.location.replace("dashboard.php");
        </script> ';
    }
}

if(isset($_GET["position_val"]) and isset($_GET["mac"])){
    $id = $_SESSION["id"];
    $alert = $_GET["position_val"];
    $machine_mac = $_GET["mac"];
    $sql = "UPDATE  user_and_devices SET position_input='$alert' WHERE  machine_mac='$machine_mac'";
    if(mysqli_query($con, $sql)){
        echo '<script>
            alert("Settings Updated!");
        window.location="dashboard.php";
        </script> ';
    }
}


if(isset($_GET["relay_val"]) and isset($_GET["mac"])){
    $id = $_SESSION["id"];
    $alert = $_GET["relay_val"];
    $machine_mac = $_GET["mac"];
    $sql = "UPDATE  user_and_devices SET relay='$alert' WHERE  machine_mac='$machine_mac'";
    if(mysqli_query($con, $sql)){
        echo '<script>
            alert("Settings Updated!");
        window.location="dashboard.php";
        </script> ';
    }
}

if(isset($_GET["momentary_val"]) and isset($_GET["mac"])){
    $id = $_SESSION["id"];
    $alert = $_GET["momentary_val"];
    $machine_mac = $_GET["mac"];
    $sql = "UPDATE  user_and_devices SET momentary_time='$alert' WHERE  machine_mac='$machine_mac'";
    if(mysqli_query($con, $sql)){
        echo '<script>
            alert("Settings Updated!");
        window.location="dashboard.php";
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


session_start();
$record_id = $_SESSION["id"];

if(isset($_POST["link-device"])){
    $mobile_mac = $_POST["mobile_mac"];
    $device_mac = $_POST["device_mac"];
    $loc = $_POST["device_name"];
    $timezone_id = $_POST["time_zone_id"];
    $daylight = $_POST["daylight"];


    $query = "SELECT * FROM user_and_devices WHERE machine_mac = '".$device_mac."'";
    $select = mysqli_query($con, $query);
    if(mysqli_num_rows($select)) {
        unset($_POST["link-device"]);
        echo '<script>alert("MAC is already being used!");
    window.location.replace("'.$actual_link.'");
</script>';
        exit();

    }

    $query = "SELECT * FROM user_and_devices WHERE machine_mac = '".$device_mac."'";
    $select = mysqli_query($con, $query);

//    if(mysqli_num_rows($select)) {
//        unset($_POST["link-device"]);
//        echo '<script>alert("Deivce Mac is already being used!");
//                window.location.replace("dashboard.php");
//                </script>';
//        exit();
//
//    }

    $now = new DateTime();
    $cur_time=$now->format('d-m-Y H:i:s');

    $query="Insert into user_and_devices (user_id, device_name, machine_mac, mobile_mac, active, date_time, timezone, daylight_saving) 
            VALUES ($record_id, '$loc', '$device_mac', '$mobile_mac', 1, '$cur_time', $timezone_id, $daylight)";

//    echo $query; exit(); die();

    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in second query. ERR: ".mysqli_error($con);
    }else{
        echo "<script>alert('Device Linked!');
                window.location.replace('dashboard.php');
                </script>";
    }


}



if(isset($_GET["action"]) and isset($_GET["machine_mac"]) and isset($_GET["row_id"])){
    $id = $_SESSION["id"];
    $machine_mac = $_GET["machine_mac"];
    $action = $_GET["action"];
    $row_id = $_GET["row_id"];

    $sql = "SELECT * FROM schedule WHERE machine_mac = '$machine_mac'";
    $res = mysqli_query($con, $sql);
    if(mysqli_num_rows($res)){
        $row = mysqli_fetch_array($res);
        $start_time = $row["start_time"];
        $end_time = $row["end_time"];
        $start_date = $row["start_date"];
        $end_date = $row["end_date"];
        // ============= For TIme
        $time = "2019-12-08";
        $start_time = date("h:i:s a", strtotime($start_time));
        $end_time = date("h:i:s a", strtotime($end_time));
        $current_time = date('h:i:s a', time());
        $current_date = date('Y-m-d', time());

        $start_time = strtotime($start_time);
        $end_time = strtotime($end_time);
        $current_time = strtotime($current_time);

        $current_date = date('Y-m-d', time());
        $date_condition = $date_condition = false;

        if (($start_time < $current_time) && ($end_time > $current_time) ) {
//            echo '<br> TIme Condition Matched!';
            $time_condition = true;
        } else {
            //send mail for an unauthorised request for invalid time
        }
        if (($start_date < $current_date || $start_date == $current_date)
            && ($end_date > $current_date || $end_date == $current_date)) {
//            echo '<br> Date Condition Matched!';
            $date_condition = true;
        }
        else {
            $date_condition = $date_condition = false;
            //send mail for an unauthorised request for invalid date
        }

        if($time_condition && $date_condition){
            if($action=="Hold"){
                echo '
                <script>
                    alert("Schedule is active! No manual requests will be served!");
                    window.location.replace("dashboard.php");
                </script> ';
            }
            if($action=="Close"){
                echo '
                <script>
                    alert("Schedule is active! No manual requests will be served!");
                    window.location.replace("dashboard.php");
                </script> ';
            }
            if($action=="Open"){
                echo '
                <script>
                    alert("Schedule is active! No manual requests will be served!");
                    window.location.replace("dashboard.php");
                </script> ';
            }
        }
    }

    $sql = "SELECT * FROM user_and_devices WHERE id = '$row_id'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);

    ////  SETTING TIME ZONE
    date_default_timezone_set(get_timezone($con, $row["timezone"] ));


    if($row["is_guest"]){
        if($action=="Open" && !$row["open_btn"]){
            send_notification($con, "Open Button is restricted!");
            echo '
                <script>
                    alert("Open Button is restricted!");
                    window.location.replace("dashboard.php");
                </script> ';
        }
        if($action=="Close" && !$row["close_btn"]){
            send_notification($con, "Close Button is restricted!");
            echo '
                <script>
                    alert("Close Button is restricted!");
                    window.location.replace("dashboard.php");
                </script> ';
        }
        if($action=="Hold" && !$row["hold_btn"]){
            send_notification($con, "Hold Button is restricted!");
            echo '
                <script>
                    alert("Hold Button is restricted!");
                    window.location.replace("dashboard.php");
                </script> ';
        }
    }


    $sql = "SELECT * FROM schedule WHERE machine_mac = '$machine_mac'";
//    echo $sql;
    $res = mysqli_query($con, $sql);


    $sql1 = "SELECT * FROM alert WHERE machine_mac='$machine_mac'";
    $res1 = mysqli_query($con, $sql1);
    $row1 = mysqli_fetch_assoc($res1);
    $email = $row1["email"];

    $sql1 = "SELECT * FROM user_and_devices WHERE machine_mac='$machine_mac'";
//        echo 'sql1: '.$sql1;
    $res1 = mysqli_query($con, $sql1);
    $row1 = mysqli_fetch_assoc($res1);
    $device_name = $row1["device_name"];
    $u_id = $row1["user_id"];


    $sql1 = "SELECT * FROM users WHERE id=$u_id";
    $res1 = mysqli_query($con, $sql1);
    $row1 = mysqli_fetch_assoc($res1);
    $u_name = $row1["first_name"].' '.$row1["last_name"];



    //If schedule exists
    if(mysqli_num_rows($res)){

//        print_r($row1);
        if($row1["relay"]=="None"){
            send_notification($con, "Relay is set to None. No Open/Hold/Close requests will be performed.");
            echo '
                <script>
                    alert("Relay is set to None. No Open/Hold/Close requests will be performed.");
                </script>
            ';
        }



        $row = mysqli_fetch_assoc($res);
        $start_time = $row["start_time"];
        $end_time = $row["end_time"];
        $start_date = $row["start_date"];
        $end_date = $row["end_date"];
        // ============= For TIme
        $time = "2019-12-08";
//        date_default_timezone_set("Asia/Karachi");
        //$date = date('m/d/Y h:i:s a', time());
        $start_time = date("h:i:s a", strtotime($start_time));
        $end_time = date("h:i:s a", strtotime($end_time));
        $current_time = date('h:i:s a', time());
        $current_date = date('Y-m-d', time());
        //=============  For Date
        $current_date = date('Y-m-d', time());
        //======================== Listing all
//        echo 'Start Time: '.$start_time.'<br>';
//        echo 'End Time: '.$end_time.'<br>';
//        echo 'Start Date: '.$start_date.'<br>';
//        echo 'End Date: '.$end_date.'<br>';
//        echo 'Current Time: '.$current_time.'<br>';
//        echo 'Current Date: '.$current_date.'<br>';
        if(($start_time < $current_time || $start_time == $current_time) ||
            ($row["time_1"]=="on" && $current_time<$end_time) ||
            ($row["time_2"]=="on" && $current_time<$start_time)){
            echo '<br> TIme Condition Matched!';
//            echo '<script>alert("TIme Condition Matched!");</script>';
            $time_condition = true;
        }else{
            //send mail for an unauthorised request for invalid time
            echo '<script>alert("Unauthorised request on invalid time");</script>';
            unauthorized_access_mail($u_name, $device_name, $email, $con);
        }
        if(($start_date < $current_date || $start_date == $current_date) &&
            ($end_date > $current_date || $end_date == $current_date)
        ){
//            echo '<script>alert("in date cond");</script>';
            if(($row["date_1"]=="on" && $current_date<$end_date) ||
                ($row["date_2"]=="on" && $current_date>$start_date)){
                echo '<br> Date Condition Matched!';
//                echo '<script>alert("Date Condition Matched!");</script>';
                $date_condition = true;
            }
        }
        else{
            echo '<script>alert("Request on invalid time");</script>';
            unauthorized_access_mail($u_name, $device_name, $email, $con);
        }
    }
    //IF there's no schedule
    if(mysqli_num_rows($res)==0){
        /*        echo '<script>
                    alert("No Schedules Set for the device!!");
                </script> ';*/
        /*
         *  No Schedules Set for the device, so it will be true
         */
        $date_condition = $time_condition = true;
    }



    $date_condition = $time_condition = true;


    $sql1 = "SELECT * FROM user_and_devices WHERE machine_mac='$machine_mac'";
//        echo 'sql1: '.$sql1;
    $res1 = mysqli_query($con, $sql1);
    $row1 = mysqli_fetch_assoc($res1);
    $device_name = $row1["device_name"];
    $u_id = $row1["user_id"];
//        print_r($row1);
    if($row1["relay"]=="None"){

        send_notification($con, "Relay is set to None. No Open/Hold/Close requests will be performed.");
        echo '
                <script>
                    alert("Relay is set to None. No Open/Hold/Close requests will be performed.");
                    window.location.replace("dashboard.php");
                </script>
            ';
    }

//    if($date_condition && $time_condition){
    if($time_condition && $date_condition){
//        echo $row1["relay"].'----'.$action;
//        die();exit();

        // if relay is momentary, no close requests will be sent
        if($row1["relay"]=="Momentary" && $action=="Close"){
//            $action="";
//            echo '
//                <script>
//                    alert("Relay is set to momentary, no Close requests will be sent.");
//                    window.location.replace("dashboard.php");
//                </script>
//            ';
        }
        if($row1 ["relay"]=="Unlatch" && $action=="Open"){
            $action="";

            send_notification($con, "Relay is set to Unlatch, no Open requests will be sent.");
            echo '
                <script>
                    alert("Relay is set to Unlatch, no Open requests will be sent.");
                    window.location.replace("dashboard.php");
                </script>
            ';
        }



//        $sql = "INSERT INTO server_requests (machine_mac, request, user_id) VALUE ('$machine_mac', '$action', $id)";
//        mysqli_query($con, $sql);

//        date_default_timezone_set("Asia/Karachi");
        $time_of_mail = date("M d,Y h:i:s a");

        send_notification($con, "$device_name is set to $action");

        $msg = "Hi $u_name,\n
            Your request for device name '$device_name' is set to $action on $time_of_mail.\n
            You Can't reply on this auto generated email!\n\n
            
         
            MyGate Server";

        $msg = wordwrap($msg,70);
//        echo '<script>alert("'.$msg.'");</script>';
        $subject = "Alert for MyGate";
        // send email
        mail($email,$subject,$msg);
//        if(mail($email,$subject,$msg)){
//            echo '<script>alert("Mail sent to '.$email.'");</script>';
//        }


//        echo '<script>alert("'.$email.'");</script>';



        $device_name = $_GET["d_name"];
//        echo '<script>alert("'.$device_name.'");</script>';


        $sql = "UPDATE  user_and_devices SET server_request='$action' WHERE (user_id=$id AND machine_mac='$machine_mac' AND device_name='$device_name')";

        mysqli_query($con, $sql);

        ini_set("allow_url_fopen", 1);
        $url = "http://access1technologies.com/smartgate/api/confirm_request.php?machine_mac=$machine_mac&request=$action";

//        $url = "localhost/smartgate/api/confirm_request.php?machine_mac=$machine_mac&request=$action";
//        $url = "http://access1technologies.com/smartgate/api/get_details.php";
//        echo '<script>alert("'.$url.'");</script>';

        $json = file_get_contents($url);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $data = curl_exec($ch);
        curl_close($ch);
//        echo $data;


//        echo '<script>alert("Response: '.$json.'");</script>';
        $json = json_decode($data);
//        print_r($json);
        $confirm_msg =   $json->Message;

//        echo $confirm_msg; exit(); die();


        if($confirm_msg=="Record Saved"){
            echo '<script>
            alert("Action Set to '.$action.'");
            window.location.replace("dashboard.php");
        </script> ';
        }

        if($confirm_msg!="Record Saved"){
            $device_name = $_GET["d_name"];
            $redirect_to = "dashboard.php?row_id=$row_id&action=$action&machine_mac=$machine_mac&d_name=$device_name";
            header("Location: ".$redirect_to);
            echo '
            <script>
                window.location.replace("'.$redirect_to.'");
            </script> 
            ';
        }


    }
}

function unauthorized_access_mail($u_name, $device_name, $email, $con){
//    date_default_timezone_set("Asia/Karachi");
    $time_of_mail = date("M d,Y h:i:s a");

    send_notification($con, "Unauthorized access for $device_name  on $time_of_mail");

    $msg = "Hi $u_name,\n
            It is to inform you that, an unauthorized date/time access was made for device '$device_name', on $time_of_mail.\n
            You Can't reply on this auto generated email!\n\n
            
         
            MyGate Server";
    $msg = wordwrap($msg,70);
    $subject = "Alert for Unauthorized date/time access";
    // send email
    $email = get_admin_email($con);
    mail($email,$subject,$msg);
    echo '<script>
            alert("You are not authorized to access the device at a moment!");
        </script> ';
}


?>

