<?php require 'parts/startup.php'; ?>
<!DOCTYPE html>
<html lang="en">
<?php
$id = $_GET["id"];
$id=mysqli_real_escape_string($con, $id);
$id=trim($id);
$sch_id = $id;

$sql = "SELECT * FROM alert WHERE id=$id";
$res = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($res);



$sql= "Select * FROM user_and_devices WHERE user_id=".$row["user_id"];
//echo $sql;
$result = mysqli_query($con, $sql);
$row1 = mysqli_fetch_assoc($result);
$current_user_id = $row1["user_id"];
//echo "CurrentID: ".$current_user_id;
$current_device_name=$row1["device_name"];
$current_mobile_mac=$row1["mobile_mac"];
$current_machine_mac=$row1["machine_mac"];

?>

<?php $page_title="All Alerts" ; require 'parts/head.php'; ?>

<body id="page-top">
<?php require 'parts/top-nav.php'; ?>

<div id="wrapper">

    <!-- Sidebar -->
    <?php require 'parts/user-left-nav.php'; ?>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <?php $current_page=$page_title ; require 'parts/top-pagger.php'; ?>

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
                                            <div class="form-group">
                                                <label for="email" id="top-nav-font">Schedule Name:</label>
                                                <input id="nav-font" type="text " class="form-control" value="<?php echo $row["alert_name"]; ?>" id="email" name="name" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" id="top-nav-font">Start Date:</label>
                                                <input id="nav-font" type="date" class="form-control" id="email" name="startdate" value="<?php echo $row["start_date"]; ?>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" id="top-nav-font">End Date:</label>
                                                <input id="nav-font" type="date" class="form-control" id="email" name="enddate" value="<?php echo $row["end_date"]; ?>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" id="top-nav-font">Start Time:</label>
                                                <input id="nav-font" type="time" class="form-control" name="start_time" value="<?php $date = date("H:i", strtotime($row['start_time'])); echo "$date"; ?>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" id="top-nav-font">End Time:</label>
                                                <input id="nav-font" type="time" class="form-control" name="end_time" value="<?php $date = date("H:i", strtotime($row['end_time'])); echo "$date"; ?>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="pwd" id="top-nav-font" style="display: flex;">Email:</label>
                                                <input id="nav-font" type="email" class="form-control" name="email" value="<?php echo $row["email"]; ?>" required>
                                            </div>

<!--                                            <div class="form-group">-->
                                                    <!--<label for="pwd" id="top-nav-font" style="display: flex;">App Push:</label>-->
<!--                                                <input id="nav-font" type="hidden" class="form-control" name="app_push" value="">-->
<!--                                            </div>-->
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
                                                    <option value="Hi">ON</option>
                                                    <option value="Lo">OFF</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="pwd" id="top-nav-font" style="display: flex;">Position :</label>
                                                <select id="nav-font" class="form-control" name="position">
                                                    <option value="None">None</option>
                                                    <option value="Hi">ON</option>
                                                    <option value="Lo">OFF</option>
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
                                            <button class="btn btn-primary btn-block" type="submit" name="add-schedule" id="nav-font">Save Schedule</button>


                                        </form>
                                        <?php
                                        $flag=FALSE;
                                        if(isset($_POST["add-schedule"])){
                                            $name=$_POST["name"];
                                            $relay=$_POST["relay"];
                                            $start_date=$_POST["startdate"];
                                            $end_date=$_POST["enddate"];
                                            $start_time = $_POST["start_time"];
                                            $end_time = $_POST["end_time"];
                                            $week_days = $_POST["weekdays"];
                                            $email=$_POST["email"];
//                                            $app_push = $_POST["app_push"];
                                            $app_push = '';
                                            $relay = $_POST["relay"];
                                            $positions = $_POST["position"];
                                            $delta_time_alert = $_POST["delta_time_alert"];

                                            $days="";
                                            if ($week_days){
                                                foreach ($week_days as $t){ $days = $t.','.$days; }
                                            }

                                            $connectionID = $con;
                                            $select = mysqli_query($connectionID, "SELECT * FROM alert WHERE alert_name = '".$name."'") or exit(mysqli_error($connectionID));
                                            if(mysqli_num_rows($select)>2) {
                                                $link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
                                                echo '
                                <script>
                                  alert("Alert Name is already being used");
                                  window.location.replace("'.$link.'");
                                </script>
                            ';
                                            }

                                            $sql="UPDATE alert SET alert_name='$name', relay='$relay', start_date='$start_date', 
                                        end_date='$end_date', start_time='$start_time', end_time='$end_time', weekday='$days',
                                        email ='$email', app_push='$app_push', relay = '$relay',
                                         positions = '$positions', delta_time_alert = '$delta_time_alert'
                                        WHERE id=$sch_id";
                                            if (mysqli_query($con, $sql)) {
                                                echo "<script>alert('Alert updated Successfully!');document.location = 'list-all-alerts.php';</script>
                 ";
                                            } else {
                                                echo "Error: " . $sql . "<br>" . mysqli_error($con);
                                            }
                                        }
                                        ?>
                                        <!--
                                        <div class="text-center">
                                        <a class="d-block small mt-3" href="login.html">Login Page</a>
                                        <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
                                        </div>
                                        -->
                                    </div>
                                </div>
                            </div>


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
