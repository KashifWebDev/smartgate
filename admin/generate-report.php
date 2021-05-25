<?php

require '../parts/db.php';
if (isset($_GET["delete_device"])) {
    $mac = $_GET["delete_device"];
    $sql = "DELETE FROM user_and_devices WHERE machine_mac='$mac'";
    //echo $sql;
    if (mysqli_query($con, $sql)) {
        echo '
                <script>
                    alert("Device UnLinked!");
                    window.location.replace("dashboard.php");
                </script>
            ';
    }
}

$page_title="Reports";
$current_page="Reports" ;
$redirec="admin";
$dir="../";
require 'common.php';
$id=$_GET["id"];
$usr_page_id = $id;
$id=trim($id);
$id=mysqli_real_escape_string($con, $id);
$sql = "SELECT * FROM users WHERE id=$id";
$res = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($res);
$full_name =  $row["first_name"].' '.$row["last_name"];
$usr_img = $row["image"];
$restricted = $row["is_restricted"];
$email = $row["email"];
$comp_id = $row["company"];
$sql1 = "SELECT * FROM company WHERE id=$comp_id";
$res1 = mysqli_query($con, $sql1);
$row_comp = mysqli_fetch_assoc($res1);
$company_name = $row_comp["name"];

if($restricted){
    $parameter = "allow";
    $text = "Allow User";
}
if(!$restricted){
    $parameter="restrict_user";
    $text="Restrict User";
}


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

if(isset($_POST["update-user"])){
    require '../parts/db.php';
    $fname=mysqli_real_escape_string($con, $_POST["fname"]);
    $lname=mysqli_real_escape_string($con, $_POST["lname"]);
    $email=mysqli_real_escape_string($con, $_POST["email"]);
    $pass=mysqli_real_escape_string($con, $_POST["pass"]);
    $connectionID = $con;
    $my_query="SELECT * FROM users WHERE email = '$email' AND id!=$id";
    echo $my_query;
    $select = mysqli_query($connectionID, $my_query) or exit(mysqli_error($connectionID));
    if(mysqli_num_rows($select)) {
        echo '
                <script>
                    alert("Email already in use!");
                    window.location.replace("dashboard.php");
                </script>
            ';
    }



    $query="UPDATE users SET first_name='$fname', last_name='$lname', email='$email', password='$pass' WHERE id=$id";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in first query";
    }else{
        echo "<script>alert('Record Updated');
                    window.location.replace('dashboard.php');</script>";
    }


}
?>

<div class="row">
    <div class="col-md-12 d-flex">
        <div class="user-img">
            <img id="user-avartar" style="height: 129px; padding-left: 10%;margin-bottom: 8%" class="img-circle" src="../images/users/<?php echo $usr_img; ?>">
        </div>
        <div class="user-report-details w-100" style="padding-left: 2%;">
            <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Full Name: &nbsp;&nbsp; </b> <?php echo $full_name; ?></span><br>
            <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Email:&nbsp; </b> <?php echo $email; ?></span><br>
            <span style="font-family: 'PT Sans', sans-serif; font-size: 17px"><b>Group: &nbsp;</b> <?php echo $company_name; ?></span><br>
            <div class="btn-custom-class d-flex" style="margin-top: 8px;">
                <form method="get" action="schedule-page.php">
                    <input type="hidden" name="userid" value="<?php echo $row["id"]; ?>">
                    <button name="btn_schedule" class="btn btn-primary">Schedules</button>
                </form>
                <form method="post" action="alert-page.php">
                    <input type="hidden" name="userid" value="<?php echo $row["id"]; ?>">
                    <button name="btn_alert" class="btn m-l-3" id="custom_brown_btn">Alerts</button>
                </form>
                <button name="model_btn" class="btn btn-success m-l-1 btn" data-toggle="modal" data-target="#link_new_device">
                    Link New Device
                </button>
                <button style="margin-left: 8px;" name="model_btn" class="btn btn-warning m-l-1 btn" data-toggle="modal" data-target="#edit_user">
                    Edit User Details
                </button>
                <a href="generate-report.php?id=<?php echo $usr_page_id.'&'.$parameter.'='.$id; ?>" class="btn btn-danger m-l-2px"><?php echo $text; ?></a>
            </div>
        </div>
    </div>
</div>

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
<!-- Modal For Edit User-->
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

            <div class="card mb-3">
                <div class="card-header text-primary">
                    <i class="fas fa-table"></i>
                    <span class=" font-weight-bold">Devices List</span>
                </div>
                <?php
                $sql = "SELECT * FROM user_and_devices WHERE user_id=$id";
                //$sql = "SELECT * FROM devices";
                $result = mysqli_query($con, $sql);
                ?>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Device Name</th>
                                <th>Device MAC</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Device Name</th>
                                <th>Device MAC</th>
                                <th>Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <?php
                            if (mysqli_num_rows($result) > 0) {
                                // output data of each row
                                while($row = mysqli_fetch_assoc($result)) {
                                    echo '
                        <tr class="odd gradeX" id="device-view-font">
                        <td>'.$row["device_name"].'</td>
                        <td>'.$row["machine_mac"].'</td>
                                    <td><a class="btn btn-danger" href="generate-report.php?delete_device='.$row["machine_mac"].'">Delete Device</a>
            <button class="btn btn-success" data-toggle="modal" data-target="#edit_device">Edit Device</button></td>
            
        <!-- Modal For Edit Deivce-->
        <div class="modal fade" id="edit_device" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Device Details</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="">
                            <input type="hidden" value="'.$row["id"].'" name="user_id">
                            <div class="form-group">
                                <label>Device Name</label>
                                <input id="nav-font" type="text" class="form-control" id="email" value="'.$row["device_name"].'" name="name">
                            </div>
                            <div class="form-group">
                                <label>Device MAC</label>
                                <input id="nav-font" type="text" class="form-control" id="email" value="'.$row["machine_mac"].'" name="machine">
                            </div>
                            <div class="form-group">
                                <label>Mobile MAC</label>
                                <input id="nav-font" type="text" class="form-control" id="email" value="'.$row["mobile_mac"].'" name="mobile">
                            </div>
                            <button class="btn btn-primary btn-block" type="submit" name="add-user" id="nav-font">Update</button>
        
        
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
                    ';
                                }
                            } else {
                                echo "
                        <td><center><b>No Devices Found</b></center></td>";
                            }

                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Live View  (<i>-Record From Database</i>)</div>
            </div>
            <?php
            function get_date($con, $comp_id){
                $sql = "SELECT * FROM schedule WHERE id=$comp_id";
                $res = mysqli_query($con, $sql);
                $row = mysqli_fetch_assoc($res);
                return date("d-M,Y", strtotime($row["start_date"])).' ~ '.date("d-M,Y", strtotime($row["end_date"]));
            }
            function get_time($con, $comp_id){
                $sql = "SELECT * FROM schedule WHERE id=$comp_id";
                $res = mysqli_query($con, $sql);
                $row = mysqli_fetch_assoc($res);
                return date("g:i a", strtotime($row["start_time"])).' ~ '.date("g:i a", strtotime($row["end_time"]));
            }
            if(isset($_GET["restrict_user"])){
                $u= $_GET["restrict_user"];
                unset($_GET["restrict_user"]);
                $query = "UPDATE users set is_restricted=1 WHERE id = $u";
                if(mysqli_query($con, $query)){
                    echo'
                        <script>alert("User Restricted!");
                        window.location.href = "generate-report.php?id='.$usr_page_id.'";
                        </script>
                    ';
                    header('Location: generate-report.php?id='.$usr_page_id);
                }
            }
            if(isset($_GET["allow"])){
                $u= $_GET["allow"];
                unset($_GET["allow"]);
                $query = "UPDATE users set is_restricted=0 WHERE id = $u";
                if(mysqli_query($con, $query)){
                    echo'
                        <script>alert("User Allowed!");
                        window.location.href = "generate-report.php?id='.$usr_page_id.'";
                        </script>
                    ';
                    header('Location: generate-report.php?id='.$usr_page_id);
                }
            }
            ?>


<?php
$query = "SELECT * FROM app_requests where user_id=$id";
//echo $query;
$result = mysqli_query($con, $query);

?>

<div class="card mb-3">
    <div class="card-header text-primary">
        <i class="fas fa-table"></i>
        <span class="font-weight-bold">User App Requests Histroy</span>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Event</th>
                    <th>Mobile Mac</th>
                    <th>Machine Mac</th>
                    <th>Action</th>
                    <th>TimeStamp</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Event</th>
                    <th>Mobile Mac</th>
                    <th>Machine Mac</th>
                    <th>Action</th>
                    <th>TimeStamp</th>
                </tr>
                </tfoot>
                <tbody>
                <?php
                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while($row = mysqli_fetch_assoc($result)) {
                        echo '
            
                    <tr class="odd gradeX" id="device-view-font">
                        <td>'.$row["id"].'</td>
                        <td>'.$row["mobile_mac"].'</td>
                        <td>'.$row["machine_mac"].'</td>
                        <td>'.$row["request"].'</td>
                        <td>'.$row["date_time"].'</td>';
                    }
                } else {
                    echo "
                        <td><center><b>No Request Found</b></center></td>";
                }

                ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Live View of Devices (<i>-Record From Database</i>)</div>
</div>
<?php
$query = "SELECT * FROM server_requests where user_id=$id";
//echo $query;
$result = mysqli_query($con, $query);

?>

<div class="card mb-3">
    <div class="card-header text-primary">
        <i class="fas fa-table"></i>
        <span class="font-weight-bold">User Server Requests Histroy</span>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Machine Mac</th>
                    <th>Action</th>
                    <th>TimeStamp</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Machine Mac</th>
                    <th>Action</th>
                    <th>TimeStamp</th>
                </tr>
                </tfoot>
                <tbody>
                <?php
                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while($row = mysqli_fetch_assoc($result)) {
                        echo '
            
                    <tr class="odd gradeX" id="device-view-font">
                        <td>'.$row["machine_mac"].'</td>
                        <td>'.$row["request"].'</td>
                        <td>'.$row["date_time"].'</td>';
                    }
                } else {
                    echo "
                        <td><center><b>No Request Found</b></center></td>";
                }

                ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Live View of Devices (<i>-Record From Database</i>)</div>
</div>








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

  <!-- Demo scripts for this page-->
  <script src="<?php echo $dir; ?>js/demo/datatables-demo.js"></script>

</body>

</html>
<?php
if(isset($_POST["add-user"])){
    require '../parts/db.php';
    $machine=mysqli_real_escape_string($con, $_POST["machine"]);
    $mobile=mysqli_real_escape_string($con, $_POST["mobile"]);
    $name=mysqli_real_escape_string($con, $_POST["name"]);
    $usr_id=mysqli_real_escape_string($con, $_POST["user_id"]);
    $connectionID = $con;

    $select = mysqli_query($connectionID, "SELECT * FROM user_and_devices WHERE machine_mac = '".$machine."'") or exit(mysqli_error($connectionID));
    if(mysqli_num_rows($select)>2) {
    exit('Device MAC is already being used');
    die();
    }
    $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    $query="UPDATE user_and_devices SET machine_mac='$machine', mobile_mac='$mobile', device_name='$name' WHERE id=$usr_id";
    if(!mysqli_query($con, $query)){
    //echo '<script>alert("error in first query")';
        echo "error in first query";
        }else{
            echo "<script>alert('Record Updated');
            window.location.replace('".$actual_link."');</script>";
    }
}
?>
