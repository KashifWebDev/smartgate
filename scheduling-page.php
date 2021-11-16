<?php require 'parts/startup.php'; ?>

<?php
require 'parts/db.php';
error_reporting(E_ALL);
if (isset($_GET["id"]))
{
    $id = $_GET["id"];
    $id = mysqli_real_escape_string($con, $id);
    $id = trim($id);
    $sql = "Select * FROM user_and_devices WHERE id=$id";
    $result = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($result);
    $current_user_id = $row["user_id"];
    $current_device_name = $row["device_name"];
    $current_mobile_mac = $row["mobile_mac"];
    $current_machine_mac = $row["machine_mac"];
}
?>
<!DOCTYPE html>
<html lang="en">

<?php $page_title = "Add New Schedule";
require 'parts/head.php'; ?>

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
                            <div class="card-header text-center" id="top-nav-font">Device Schedules</div>
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
                                        <input id="nav-font" type="text " class="form-control" placeholder="Schedule Name" id="email" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">Start Date:</label>
                                        <input id="nav-font" type="date" class="form-control" id="email" name="startdate">
                                    </div>
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">End Date:</label>
                                        <input id="nav-font" type="date" class="form-control" id="email" name="enddate">
                                    </div>
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">Start Time:</label>
                                        <input id="nav-font" type="time" class="form-control" name="start_time">
                                    </div>
                                    <div class="form-group">
                                        <label for="email" id="top-nav-font">End Time:</label>
                                        <input id="nav-font" type="time" class="form-control" name="end_time">
                                    </div>
<!--                                    <div class="form-group">-->
<!--                                        <label for="pwd" id="top-nav-font" style="display: flex;">Event Input:</label>-->
<!--                                        <select id="nav-font" class="form-control" name="event">-->
<!--                                            <option value="Hi">ON</option>-->
<!--                                            <option value="Lo">OFF</option>-->
<!--                                        </select>-->
<!--                                    </div>-->
                                    <input type="hidden" value="Hi" name="event">
<!--                                    <div class="form-group">-->
<!--                                        <label for="pwd" id="top-nav-font" style="display: flex;">Position Input:</label>-->
<!--                                        <select id="nav-font" class="form-control" name="position">-->
<!--                                            <option value="None">None</option>-->
<!--                                            <option value="on">ON</option>-->
<!--                                            <option value="off">OFF</option>-->
<!--                                        </select>-->
<!--                                    </div>-->
                                    <input type="hidden" value="on" name="position">
                                    <!--                                    <div class="form-group">-->
                                    <!---->
                                    <!--                                        <label for="pwd" id="top-nav-font" style="display: flex;">Schedule Type:</label>-->
                                    <!---->
                                    <!--                                        <select id="nav-font" class="form-control" name="nature">-->
                                    <!---->
                                    <!--                                            <option value="open">Open Schedule</option>-->
                                    <!---->
                                    <!--                                            <option value="close">Close Schedule</option>-->
                                    <!---->
                                    <!--                                        </select>-->
                                    <!---->
                                    <!--                                    </div>-->
                                    <div class="form-group">
                                        <label for="pwd" id="top-nav-font" style="display: flex;">Relay Operation:</label>
                                        <select id="nav-font" class="form-control" name="relay">
                                            <option value="None">None</option>
                                            <option value="Momentary">Momentary</option>
                                            <option value="Latch">Latch</option>
                                            <option value="UnLatch">UnLatch</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" id="top-nav-font" style="display: flex;">Days of Week: <p style="margin-left: 1%;font-weight: 100;">(Ctrl+click to select multiple)</p></label>
                                        <input type="button" name="Button" value="Select All" onclick="selectAll('select_box',true)" />
                                        <script>
                                            function selectAll(selectBox,selectAll) {
                                                if (typeof selectBox == "string") {
                                                    selectBox = document.getElementById(selectBox);
                                                }
                                                if (selectBox.type == "select-multiple") {
                                                    for (var i = 0; i < selectBox.options.length; i++) {
                                                        selectBox.options[i].selected = selectAll;
                                                    }
                                                }
                                            }
                                        </script>
                                        <select id="select_box" class="form-control select_all" name="weekdays[]" multiple="multiple" style="height: 140px;">
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
                                $flag = false;
                                if (isset($_POST["add-schedule"]))
                                {
                                    $name = $_POST["name"];
                                    $relay = $_POST["relay"];
                                    $start_date = $_POST["startdate"];
                                    $end_date = $_POST["enddate"];
                                    $start_time = $_POST["start_time"];
                                    $end_time = $_POST["end_time"];
                                    $event = $_POST["event"];
                                    $position = $_POST["position"];
                                    $week_days = $_POST["weekdays"];
                                    if (empty($start_date)) $start_date = '2018-04-18';
                                    if (empty($end_date)) $end_date = '2030-04-18';
                                    if (empty($start_time)) $start_time = '00:00';
                                    if (empty($end_time)) $end_time = '23:59';
                                    $days = "";
                                    if ($week_days)
                                    {
                                        foreach ($week_days as $t)
                                        {
                                            $days = $t . ',' . $days;
                                        }
                                    }
                                    $connectionID = $con;
                                    $sql = "INSERT INTO schedule (sch_name, relay, user_id,mobile_mac, machine_mac, start_date, 
                                        end_date, start_time, end_time, weekday, event, positions)
                                        VALUES ('$name', '$relay', $current_user_id, '$current_mobile_mac', '$current_machine_mac', '$start_date', 
                                                '$end_date', '$start_time', '$end_time', '$days', '$event','$position');
                                     ";
                                    if (mysqli_query($con, $sql))
                                    {
                                        echo "<script>
                                                alert('New Schedule Added Successfully!');
                                                document.location = 'dashboard.php';
                                               </script>
                                         ";
                                    }
                                    else
                                    {
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
