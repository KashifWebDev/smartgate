    <?php
$page_title="Home";
$current_page="Dashboard" ;
$redirec="admin";
$dir="../";
require 'common.php';


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
                                            <div class="form-group">
                                                <label for="pwd" id="top-nav-font" style="display: flex;">App Push:</label>
                                                <input id="nav-font" type="text" class="form-control" name="app_push" value="<?php echo $row["app_push"]; ?>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="pwd" id="top-nav-font" style="display: flex;">Relay :</label>
                                                <select id="nav-font" class="form-control" name="relay">
                                                    <option value="ON">ON</option>
                                                    <option value="OFF">OFF</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="pwd" id="top-nav-font" style="display: flex;">Position :</label>
                                                <select id="nav-font" class="form-control" name="position">
                                                    <option value="ON">ON</option>
                                                    <option value="OFF">OFF</option>
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

                                        <!--
                                        <div class="text-center">
                                        <a class="d-block small mt-3" href="login.html">Login Page</a>
                                        <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
                                        </div>
                                        -->
                                    </div>
                                </div>
                            </div>
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
                                            $app_push = $_POST["app_push"];
                                            $relay = $_POST["relay"];
                                            $positions = $_POST["position"];

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
                                        email ='$email', app_push='$app_push', relay = '$relay', positions = '$positions'
                                        WHERE id=$sch_id";
                                            if (mysqli_query($con, $sql)) {
                                                echo "<script>alert('Alert updated Successfully!');document.location = 'dashboard.php';</script>
                 ";
                                            } else {
                                                echo "Error: " . $sql . "<br>" . mysqli_error($con);
                                            }
                                        }
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