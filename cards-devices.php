<?php //require 'functions.php'; ?>
<?php //require '../functions.php'; ?>
<div class="custom-container">
    <div class="row">
<?php
    $sql = "SELECT DISTINCT  * FROM $table_name WHERE $where";
//    echo $sql;
    $res = mysqli_query($con, $sql);
    while($row = mysqli_fetch_assoc($res)){
//        print_r($row);
        $rand = rand();
        $alarm_value = $row["alarm"];
        $event = $row["event_server"];
        $position_input = $row["position_input"];
        $relay = $row["relay"];
        $momentary_time= $row["momentary_time"];
        //echo $alarm_value;

        $rand = rand();
//        print_r($row);
?>
<script>
    function alarm(val, machine_mac) {
        var url = 'dashboard.php?alert_val='+val+'&mac='+machine_mac;
        console.log(url);
        window.location=url;
    }
    function event(val, machine_mac) {
        var url = 'dashboard.php?event_val='+val+'&mac='+machine_mac;
        console.log(url);
        window.location=url;
    }
    function position_input(val, machine_mac) {
        var url = 'dashboard.php?position_val='+val+'&mac='+machine_mac;
        console.log(url);
        window.location=url;
    }
    function relay(val, machine_mac) {
        var url = 'dashboard.php?relay_val='+val+'&mac='+machine_mac;
        console.log(url);
        window.location=url;
    }
    function momentary_time(val, machine_mac) {
        var url = 'dashboard.php?momentary_val='+val+'&mac='+machine_mac;
        console.log(url);
        window.location=url;
    }
</script>
        <div class="col-md-4">
            <div class="col-md-inner">
                <div class="card border border-custom-color font-family-ubuntu" id="card-hover-effect">
                    <div class="card-header font-weight-bold"><?Php //echo $row["first_name"].' '.$row["last_name"]; ?></div>
                    <div class="card-body row">
                        <div class="col-md-4">
<!--                            <img src="images/--><?php //echo $img_name; ?><!--" class="img-responsive">-->
<!--                            <img src="images/devices/--><?php //echo $row["device_img"]; ?><!--" class="img-responsive">-->

                            <div class="col-md-4no" style="position: relative">
                                <img src="images/devices/<?php echo $row["device_img"]; ?>" class="img-responsive">
                                <button data-toggle="modal" class="upload-pic-btn-guest"
                                        data-target="#upload_img_<?php echo $rand; ?>"
                                        style="position: unset; top: initial;">
                                    upload
                                </button>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="user-card-details">
                                <p class="text-primary font-weight-bold">
                                    Name:
                                    <span class="text-secondary font-weight-normal">
                                        <?php echo $row["device_name"]; ?>
                                    </span>
                                    <span id="status" class="active_status status_<?php echo $rand; ?> mt-2 text-center font-weight-bold mt-2">
                                        <span class="active_status_offline">Offline</span>
                                    </span>
                                </p>
                                <p class="text-primary font-weight-bold">
                                    Device MAC:
                                    <span class="text-secondary font-weight-normal">
                                        <?php echo $row["machine_mac"]; ?>
                                    </span>
                                </p>
                                <p class="text-primary font-weight-bold">
                                    Mobile MAC:
                                    <span class="text-secondary font-weight-normal">
                                        <?php echo $row["mobile_mac"]; ?>
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <script>
                        $(document).ready(function(){
                            update_status('status_<?php echo $rand; ?>', '<?php echo $row["machine_mac"]; ?>');
                        });
                    </script>
                    <div class="card_custom_footer">
                        <div style="/*padding-left:2px">
                            <?php
                            if($_SESSION["user_type"]!="guest"){ ?>
                                    <button style="width: 48%;" class="btn btn-primary" data-toggle="modal" data-target="#edit_device_<?php echo $rand; ?>">
                                        Edit Details
                                    </button>
                                    <a style="width: 49%;" class="btn btn primary" id="custom_brown_btn" href="scheduling-page.php?id=<?php echo $row["id"]; ?>">Create Schedule</a>
                            <?php } ?>
<!--                            <div class="my-2">-->
<!--                                <button style="width: 48%;" class="btn btn-danger" data-toggle="modal"-->
<!--                                        data-target="#live_status_--><?php //echo $rand; ?><!--">-->
<!--                                    Live Status-->
<!--                                </button>-->
<!--                                <button style="width: 48%;" class="btn btn-success" data-toggle="modal"-->
<!--                                        data-target="#device_settings_--><?php //echo $rand; ?><!--">-->
<!--                                    Device Settings-->
<!--                                </button>-->
<!--                            </div>-->
                        </div>
                        <div class="m-t-2">
                            <div class="my-2">
                                <button style="width: 30%;" class="btn btn-info" data-toggle="modal"
                                        data-target="#live_status_<?php echo $rand; ?>">
                                    Live Status
                                </button>
                                <button style="width: 34%;" class="btn btn-success" data-toggle="modal"
                                        data-target="#device_settings_<?php echo $rand; ?>">
                                    Settings
                                </button>
                                <button style="width: 32%;" class="btn btn-danger" data-toggle="modal"
                                        data-target="#del_device_<?php echo $rand; ?>">
                                    Delete
                                </button>
                            </div>
                        </div>
                        <div class="m-t-2">
                            <a href="dashboard.php?row_id=<?php echo $row["id"]; ?>&action=Open&machine_mac=<?php echo $row["machine_mac"]; ?>&d_name=<?php echo $row["device_name"]; ?>" class="btn btn-warning color-white"  style="width: 30%;">Open</a>
                            <a href="dashboard.php?row_id=<?php echo $row["id"]; ?>&action=Hold&machine_mac=<?php echo $row["machine_mac"]; ?>&d_name=<?php echo $row["device_name"]; ?>" class="btn btn-secondary color-white" style="width: 34%;">Hold</a>
                            <a href="dashboard.php?row_id=<?php echo $row["id"]; ?>&action=Close&machine_mac=<?php echo $row["machine_mac"]; ?>&d_name=<?php echo $row["device_name"]; ?>" class="btn btn-info color-white" style="width: 32%;">Close</a>
                        </div>
                    </div>
                    <div class="card-footer font-italic text-center"><?php //echo $row["email"]; ?></div>
                </div>
            </div>
        </div>

        <!-- Modal Delete Device-->
        <div class="modal fade" id="del_device_<?php echo $rand; ?>" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <!--                    <div class="modal-header">-->
                    <!--                        <button type="button" class="close" data-dismiss="modal">&times;</button>-->
                    <!--                        <h4 class="modal-title">Delete User</h4>-->
                    <!--                    </div>-->
                    <div class="modal-body">
                        <b>Are you sure to delete device <i><?php echo $row["device_name"]; ?></i>?</b>
                    </div>
                    <div class="modal-footer">
                        <a href="dashboard.php?del_device=<?php echo $row["machine_mac"]; ?>" class="btn btn-success text-white">DELETE</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal For Device Settings-->
        <div class="modal fade" id="device_settings_<?php echo $rand; ?>" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Device Settings</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="">
                        <select class="form-control mb-2" id="edited" name="event" required="">
                            <option value="">Event</option>
                            <option value="Hi">ON <?php if($event=="Hi") echo "(Selected)"; ?></option>
                            <option value="Lo">OFF <?php if($event=="Lo") echo "(Selected)"; ?></option>
                        </select>
                        <select class="form-control mb-2" id="edited" name="alarm" required="">
                            <option value="">Alarm</option>
                            <option value="none">none <?php if($alarm_value=="none") echo "(Selected)"; ?></option>
                            <option value="1">1sec <?php if($alarm_value=="1") echo "(Selected)"; ?></option>
                            <option value="2">2sec <?php if($alarm_value=="2") echo "(Selected)"; ?></option>
                            <option value="5">5sec <?php if($alarm_value=="5") echo "(Selected)"; ?></option>
                            <option value="10">10sec <?php if($alarm_value=="10") echo "(Selected)"; ?></option>
                        </select>
                        <select class="form-control mb-2" id="edited" name="position_input" required="">
                            <option value="">Position Input</option>
                            <option value="none">none <?php if($position_input=="none") echo "(Selected)"; ?></option>
                            <option value="ON">ON <?php if($position_input=="ON") echo "(Selected)"; ?></option>
                            <option value="OFF">OFF <?php if($position_input=="OFF") echo "(Selected)"; ?></option>
                        </select>
                        <select class="form-control mb-2" id="edited" name="relay" required="">
                            <option value="">Relay</option>
                            <option value="None">None <?php if($relay=="None") echo "(Selected)"; ?></option>
                            <option value="Momentary">Momentary <?php if($relay=="Momentary") echo "(Selected)"; ?></option>
                            <option value="Latch">Latch <?php if($relay=="Latch") echo "(Selected)"; ?></option>
                            <option value="Unlatch">Unlatch <?php if($relay=="Unlatch") echo "(Selected)"; ?></option>
                        </select>
                        <select class="form-control mb-2" id="edited" name="momentary_time" required="">
                            <option value="">Momentary Time</option>
                            <option value="2">2sec <?php if($momentary_time=="2") echo "(Selected)"; ?></option>
                            <option value="10">10sec <?php if($momentary_time=="10") echo "(Selected)"; ?></option>
                            <option value="30">30sec <?php if($momentary_time=="30") echo "(Selected)"; ?></option>
                            <option value="60">60sec <?php if($momentary_time=="60") echo "(Selected)"; ?></option>
                        </select>
                            <input type="hidden" name="machine_mac" value="<?php echo $row["machine_mac"]; ?>">
                            <div class="modal-footer">
                                <button name="device_settings" type="submit" class="btn btn-success">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                        <?php
                            if(isset($_POST["device_settings"])){
                                $alarm = $_POST["alarm"];
                                $pos = $_POST["position_input"];
                                $relay = $_POST["relay"];
                                $event = $_POST["event"];
                                $mom_time = $_POST["momentary_time"];
                                $mac = $_POST["machine_mac"];
//                                print_r($_POST);die();exit();
                                $sql = "UPDATE user_and_devices SET event_server='$event',
                                   alarm='$alarm', position_input='$pos', relay='$relay',
                                    momentary_time=$mom_time WHERE machine_mac='$mac'";
                                if(mysqli_query($con, $sql)){
                                    echo '<script>alert("Settings Updated!")
                                     window.location.replace("dashboard.php");
                                        ;</script>';
                                    header('Location: dashboard.php');
                                }
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal For Live Status-->
        <div class="modal fade" id="live_status_<?php echo $rand; ?>" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Live Status</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                <td><b>Relay Status:</b></td>
                                <td>&nbsp;&nbsp;<?php
                                    if($row["relay_from_api"] == "Hi")
                                        echo "On";
                                    if($row["relay_from_api"] == "Lo")
                                        echo "Off";
                                    ?></td>
                            </tr>
                            <tr>
                                <td><b>Position Input:</b></td>
                                <td>&nbsp;&nbsp;<?php
                                    if($row["position"] == "Hi")
                                        echo "Open";
                                    if($row["position"] == "Lo")
                                        echo "Closed";
                                    ?></td>
                            </tr>
                            <tr>
                                <td><b>Event Input:</b></td>
                                <td>&nbsp;&nbsp;<?php
                                    if($row["event"] == "Hi")
                                        echo "On";
                                    if($row["event"] == "Lo")
                                        echo "Off";
                                    ?></td>
                            </tr>
<!--                            <tr>-->
<!--                                <td><b>Exit Input:</b></td>-->
<!--                                <td>&nbsp;&nbsp;--><?php //echo "OFF"; ?><!--</td>-->
<!--                            </tr>-->
                            <tr>
                                <td><b>Schedules:</b></td>
                                <td><?php echo get_total_active_schedules($con, $row["machine_mac"]); ?></td>
                            </tr>
                            <tr>
                                <td><b>Time:</b></td>
                                <td>&nbsp;&nbsp;<?php echo device_current_time(get_timezone($con, $row["timezone"])); ?></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal For Edit Device Details-->
        <div class="modal fade" id="edit_device_<?php echo $rand; ?>" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Update Device</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="">
                            <div class="form-group">
                                <label>Device Name</label>
                                <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $row["device_name"]; ?>" name="name">
                            </div>
                            <div class="form-group">
                                <label>Device MAC</label>
                                <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $row["machine_mac"]; ?>" name="machine">
                            </div>
                            <div class="form-group">
                                <label>Mobile MAC</label>
                                <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $row["mobile_mac"]; ?>" name="mobile">
                            </div>
                            <div class="form-group">
                                <div class="form-group">
                                    <label>Timezone</label>
                                    <select id="nav-font" class="form-control" name="time_zone_id">
                                        <option value="">Select TimeZone</option>
                                        <?php
                                        $query= "SELECT * FROM timezones";
                                        $res_in = mysqli_query($con, $query);
                                        while($row_in = mysqli_fetch_assoc($res_in)){
                                            ?>
                                            <option value="<?php echo $row_in["id"]; ?>"
                                                <?php echo $row_in["id"] == $row["timezone"] ? 'Selected' : ''; ?>>
                                                <?php echo $row_in["title"]; echo $row_in["id"] == $row["timezone"] ? ' (Selected)' : ''; ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group">
                                    <label>Daylight Saving Time</label>
                                    <select id="nav-font" class="form-control" name="daylight">
                                        <option value="0" <?php echo $row["daylight_saving"] == 0 ? 'Selected' : ''; ?>>OFF</option>
                                        <option value="1"<?php echo $row["daylight_saving"] == 1 ? 'Selected' : ''; ?>>ON</option>
                                    </select>
                                </div>
                            </div>
                            <button class="btn btn-primary btn-block" type="submit" name="add-user" id="nav-font">Update</button>
                      <input type="hidden" name="rowid" value="<?php echo $row["id"]; ?>">
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal For Upload Image-->
        <div class="modal fade" id="upload_img_<?php echo $rand; ?>" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Update Picture</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="image_upload_form" action="" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="rowid" value="<?php echo $row["id"]; ?>">
                            <input type="file" id="file" name="image_guest" />
                            <input name="upload_device_img" type="submit"/>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

<?php  } ?>
    </div>
</div>


<?php
function get_total_active_schedules($con, $Machine_Mac){
    date_default_timezone_set(get_timezone_from_mac($con, $Machine_Mac ));

    $schedules = "";
    $sql = "SELECT * FROM schedule WHERE machine_mac='$Machine_Mac'";
    $res = mysqli_query($con, $sql);
    if(mysqli_num_rows($res)){
        while($row = mysqli_fetch_array($res)){
            $start_time = $row["start_time"];
            $end_time = $row["end_time"];
            $start_date = $row["start_date"];
            $end_date = $row["end_date"];
            // ============= For TIme
            //$date = date('m/d/Y h:i:s a', time());
            $start_time = date("h:i:s a", strtotime($start_time));
            $end_time = date("h:i:s a", strtotime($end_time));
            $current_time = date('h:i:s a', time());
            $current_date = date('Y-m-d', time());

            $daylight_status = daylight($con, $Machine_Mac);
            if($daylight_status){
                if(date("m/d") >= "3/8" && date("m/d") < "11/1"){
                    $current_time = date('h:i:s a', strtotime('+1 hour'));
                }
            }
            $current_date = date('Y-m-d', time());

            $time_condition = $date_condition = false;

//            echo '<script>console.log("'.$current_time.'\n'.$start_time.'\n'.$end_time.'");</script>';

            if (($start_time < $current_time) && ($end_time > $current_time) ) {
                //echo '<br> TIme Condition Matched!';
//                echo '<script>alert("TIme condition match");</script>';
                $time_condition = true;
            }
            if (($start_date < $current_date || $start_date == $current_date)
                && ($end_date > $current_date || $end_date == $current_date)) {
                //echo '<br> Date Condition Matched!';
//                echo '<script>alert("Date condition match for mac '.$Machine_Mac.'");</script>';
                $date_condition = true;
            }
            if($date_condition && $time_condition){
                $schedules .= '<li>'.
                    $row["sch_name"].
                    ' <br>('
                    .date("g:i a", strtotime($row["start_time"])).
                    ' ~ '.
                    date("g:i a", strtotime($row["end_time"])).
                    ')</li>';
            }
        }
    }else{
        $schedules = "None";
    }
    return $schedules;
}

function daylight($con, $mac){
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["daylight_saving"];
}
function get_timezone_from_mac($con, $mac){
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return get_timezone($con, $row["timezone"]);
}
?>

<?php

if(isset($_POST["add-user"])){
//    require 'parts/db.php';
//    print_r($_POST); exit(); die();
    $machine=mysqli_real_escape_string($con, $_POST["machine"]);
    $mobile=mysqli_real_escape_string($con, $_POST["mobile"]);
    $name=mysqli_real_escape_string($con, $_POST["name"]);
    $daylight= $_POST['daylight'];
    $usr_id = $_POST["rowid"];
    $timezone = $_POST["time_zone_id"];
    $connectionID = $con;

//    $select = mysqli_query($connectionID, "SELECT * FROM user_and_devices WHERE machine_mac = '".$machine."'") or exit(mysqli_error($connectionID));
//    if(mysqli_num_rows($select)>2) {
//        exit('Device MAC is already being used');
//        die();
//    }



    $query="UPDATE user_and_devices SET machine_mac='$machine', mobile_mac='$mobile',
                device_name='$name', timezone=$timezone, daylight_saving=$daylight WHERE id=$usr_id";

//    echo $query; die();exit();
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")</script>';
        echo "error in first query";
    }else{
        echo "<script>alert('Record Updated');
                    window.location.replace('dashboard.php');</script>";
    }


}

if(isset($_POST['upload_device_img'])) {
//    echo '
//                <script>alert("Image uploading done!");</script>
//            ';
//require 'parts/db.php';
$row_id = $_POST["rowid"];
$errors = array();
$rand = rand(1,100).'_';
$file_name =  $rand.$_FILES['image_guest']['name'];
$file_size = $_FILES['image_guest']['size'];
$file_tmp = $_FILES['image_guest']['tmp_name'];
$file_type = $_FILES['image_guest']['type'];
$file_ext = strtolower(end(explode('.', $_FILES['image']['name'])));
echo "My Ext: ".$file_ext;
$extensions = array("jpeg", "jpg", "png", "image/jpeg");


if ($file_size > 2097152) {
$errors[] = 'File size must be excately 2 MB';
}
//    exit();die();


if (empty($errors) == true) {
move_uploaded_file($file_tmp, "images/devices/" . $file_name);
$sql = "UPDATE user_and_devices SET device_img='$file_name' WHERE id = $row_id";
echo $sql;
if (mysqli_query($con, $sql)) {
echo '
<script>window.location.replace("dashboard.php");</script>
';
}
} else {
echo '
<script>alert("'.$errors.'");</script>
';
print_r($errors);
}
}

function device_current_time($timezone){
    date_default_timezone_set($timezone);
    return date('m/d/Y h:i:s a', time());
}
?>

<script>
    function update_status(div_id, mac) {
        $.ajax({
            url: 'ajax/device_status.php',
            type: 'post',
            data: {
                mac:mac
            },
            success: function (response) {
                // alert(response);
                // console.log('mac: '+)
                $("."+div_id).html(response);
                console.log("Updated! "+div_id);
            }
        });
        setTimeout('update_status("'+div_id+'", "'+mac+'")', 1000);
    }
</script>
