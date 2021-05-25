<?php require 'parts/startup.php'; ?>


<?php
require 'parts/db.php';
if(isset($_GET["id"])){
    $id=$_GET["id"];
    $id=mysqli_real_escape_string($con, $id);
    $id=trim($id);

    $sql= "Select * FROM user_and_devices WHERE id=$id";
    $result = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($result);
    $current_user_id = $row["user_id"];
    //echo "CurrentID: ".$current_user_id;
    $current_device_name=$row["device_name"];
    $current_mobile_mac=$row["mobile_mac"];
    $current_machine_mac=$row["machine_mac"];


    //check if alert exists with same machine mac
    $sql_alert = "SELECT * FROM alert WHERE machine_mac = '$current_machine_mac'";
    $res_alert = mysqli_query($con, $sql_alert);
    if(mysqli_num_rows($res_alert)){
        echo '
            <script>
                alert("Alert with same Machine MAC already Exists! You can Edit or Delete it!");
                window.location = "list-all-alerts.php";
            </script>
        ';
        header('Location: list-all-alerts.php');
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<?php $page_title="Create Alert" ; require 'parts/head.php'; ?>

<body id="page-top">
<?php require 'parts/top-nav.php'; ?>

<div id="wrapper">

    <!-- Sidebar -->
    <?php require 'parts/user-left-nav.php'; ?>

    <div id="content-wrapper">

        <div class="container-fluid">

            <div id="content-wrapper">

                <div class="container-fluid">

                    <div class="container">
                        <div class="card card-register mx-auto mt-5">
                            <div class="card-header text-center" id="top-nav-font">Device Alerts</div>
                            <div class="card-body">
                                <!-- Information about device -->
                                <div class="form-group">
                                    <label for="email" id="top-nav-font">Device Name:</label>
                                    <input id="nav-font" type="text" value="<?php echo $current_device_name; ?>" class="form-control" id="email" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="email" id="top-nav-font">Machine Mac:</label>
                                    <input id="nav-font" type="text" value="<?php echo $current_machine_mac; ?>" class="form-control" id="email" disabled>
                                </div><hr>

                                <form method="post" action="" enctype="multipart/form-data">
                                    <input type="hidden" name="machine_mac" value="<?php echo $current_machine_mac; ?>" >
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">Alert Name:</label>
                                        <input id="nav-font" type="text " class="form-control" placeholder="Alert Name" id="email" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">Start Date:</label>
                                        <input id="nav-font" type="date" class="form-control" id="email" name="startdate" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">End Date:</label>
                                        <input id="nav-font" type="date" class="form-control" id="email" name="enddate" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">Start Time:</label>
                                        <input id="nav-font" type="time" class="form-control" name="start_time" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">End Time:</label>
                                        <input id="nav-font" type="time" class="form-control" name="end_time" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" id="top-nav-font" style="display: flex;">Email:</label>
                                        <input id="nav-font" type="email" class="form-control" name="email" required>
                                    </div>
                                    <div class="form-group">
                                        <!--<label for="pwd" id="top-nav-font" style="display: flex;">App Push:</label>-->
                                        <input id="nav-font" type="hidden" class="form-control" name="app_push" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" id="top-nav-font" style="display: flex;">User ID Alert:</label>
<!--                                        <select id="nav-font" class="form-control" name="user_id">-->
<!--                                            <option value="">None</option>-->
<!--                                                <option value="all">All Users</option>-->
<!--                                        </select>-->
                                        <select id="nav-font" class="form-control" name="user_id">
                                            <option value="0">None</option>
                                            <?php
                                            $sql = "SELECT * FROM user_and_devices WHERE machine_mac = '$current_machine_mac' ";
                                            $result = mysqli_query($con, $sql);
                                            if (mysqli_num_rows($result) > 0) {
                                                // output data of each row
                                                $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
                                                $res = mysqli_query($con, $sql);
                                                $row = mysqli_fetch_array($res);
                                                while($row = mysqli_fetch_assoc($result)) {
                                                    $user_id = $row["user_id"];
                                                    $sql = "SELECT * FROM users WHERE id = $user_id";
                                                    $res = mysqli_query($con, $sql);
                                                    $row = mysqli_fetch_array($res);
                                                    echo '
				                                       <option value="'.$row["id"].'">'.$row["email"].'</option>
                                                      ';
                                                }
                                            } else {
                                                echo "0 results";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" id="top-nav-font" style="display: flex;">Relay/Position Delta Time Alert :</label>
                                        <select id="nav-font" class="form-control" name="delta_time_alert">
                                            <option value="OFF">Off</option>
                                            <option value="ON">On</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" id="top-nav-font" style="display: flex;">Relay :</label>
                                        <select id="nav-font" class="form-control" name="relay">
                                            <option value="None">None</option>
                                            <option value="Hi">Open</option>
                                            <option value="Lo">Close</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" id="top-nav-font" style="display: flex;">Position :</label>
                                        <select id="nav-font" class="form-control" name="position">
                                            <option value="None">None</option>
                                            <option value="Hi">Open</option>
                                            <option value="Lo">Close</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" id="top-nav-font" style="display: flex;">Days of Week: <p style="margin-left: 1%;font-weight: 100;">(Ctrl+click to select multiple)</p></label>
                                        <select id="nav-font" class="form-control" name="weekdays[]" multiple="multiple" style="height: 140px;">
                                            <option value="mon">Monday</option>
                                            <option value="tue">Tuesday</option>
                                            <option value="wed">Wednesday</option>
                                            <option value="thu">Thursday</option>
                                            <option value="fri">Friday</option>
                                            <option value="sat">Saturday</option>
                                            <option value="sun">Sunday</option>
                                        </select>
                                    </div>
                                    <button class="btn btn-primary btn-block" type="submit" name="add-schedule" id="nav-font">Save Alert</button>


                                </form>
                                <?php
                                $flag=FALSE;
                                if(isset($_POST["add-schedule"])){
                                    $name=$_POST["name"];
                                    $user_id=$_POST["user_id"];
                                    $app_push=$_POST["app_push"];
                                    $email=$_POST["email"];
                                    $start_date=$_POST["startdate"];
                                    $end_date=$_POST["enddate"];
                                    $start_time = $_POST["start_time"];
                                    $end_time = $_POST["end_time"];
                                    $week_days = $_POST["weekdays"];
                                    $relay=$_POST["relay"];
                                    $position=$_POST["position"];
                                    $machine_mac=$_POST["machine_mac"];
                                    $delta_time_alert=$_POST["delta_time_alert"];

                                    $days="";
                                    if ($week_days){
                                        foreach ($week_days as $t){ $days = $t.','.$days; }
                                    }

/*                                    $connectionID = $con;
                                    $select = mysqli_query($connectionID, "SELECT * FROM alert WHERE alert_name = '".$name."'") or exit(mysqli_error($connectionID));
                                    if(mysqli_num_rows($select)) {
                                        $link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
                                        echo '
                                <script>
                                  alert("Alert Name is already being used");
                                  window.location.replace("'.$link.'");
                                </script>
                            ';
                                    }*/

                                    if($user_id=="all"){
                                        // Get all users
                                        $a = "SELECT * FROM user_and_devices WHERE user_id = $current_user_id";
                                        $b = mysqli_query($con, $a);
                                        while ($row = mysqli_fetch_assoc($b)){
                                            $each_machine_mac= $row["machine_mac"];
                                            $aaa = "INSERT INTO alert (alert_name, start_date, 
                                        end_date, start_time, end_time, email, app_push, user_id, relay, positions, weekday, machine_mac)
                                        VALUES ('$name', '$start_date', 
                                                '$end_date', '$start_time', '$end_time', '$email', '$app_push', $current_user_id
                                                , '$relay', '$position', '$days', '$each_machine_mac');
                                            ";
                                            if(mysqli_query($con, $aaa)){
                                                //echo "<script>alert('Done....! ');</script>";
                                            }else{
                                                //echo "Error! " . $sql . "<br>" . mysqli_error($con);
                                                //$er = "Error! " . "<br>" . mysqli_error($con);
                                                echo "<script>alert('Error....! ');</script>";
                                            }
                                        }
                                        echo "
                                                <script>alert('Sets to all users!');
                                                document.location = 'list-all-alerts.php';</script>
                                            ";
                                    }

                                        $sql = "INSERT INTO alert (alert_name, start_date, 
                                        end_date, start_time, end_time, email, app_push, user_id,
                                         relay, positions, weekday, machine_mac,delta_time_alert)
                                        VALUES ('$name', '$start_date', 
                                                '$end_date', '$start_time', '$end_time', '$email',
                                                 '$app_push', $user_id, '$relay', '$position',
                                                  '$days', '$machine_mac', '$delta_time_alert');
                                            ";
                                        if (mysqli_query($con, $sql)) {
                                            echo "
                                                <script>alert('New Alert Added Successfully!');
                                                document.location = 'list-all-alerts.php';</script>
                                            ";
                                        } else {
                                            echo "Error: " . $sql . "<br>" . mysqli_error($con);
                                        }
                                }
                                ?>
                            </div>
                        </div>
                    </div>








                    <!-- Bootstrap core JavaScript-->
                    <script src="vendor/jquery/jquery.min.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                    <!-- Core plugin JavaScript-->
                    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

                    <?php require 'parts/footer.php'; ?>

                </div>
                <!-- /.content-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

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

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>

</body>

</html>
