
<script>
    function open_btn(val, id) {
        var url = 'guest-users.php?open_btn_val='+val+'&row_id='+id;
        console.log(url);
        window.location=url;
    }
    function hold_btn(val, id) {
        var url = 'guest-users.php?hold_btn_val='+val+'&row_id='+id;
        console.log(url);
        window.location=url;
    }
    function close_btn(val, id) {
        var url = 'guest-users.php?close_btn_val='+val+'&row_id='+id;
        console.log(url);
        window.location=url;
    }
</script>
<div class="custom-container">
    <div class="row">
<?php


$usr_session_id = $_SESSION["id"];
//    $sql = "SELECT * FROM $table_name WHERE $where";
//    echo $sql;
    $res = mysqli_query($con, $sql);
    if(mysqli_num_rows($res)) {
        while ($row = mysqli_fetch_assoc($res)) {
//            print_r($row);
            $rand = rand();
            $aa = "SELECT * FROM user_and_devices WHERE user_id = $user_session_id AND is_guest=1";
//            echo $aa;
            $bb = mysqli_query($con, $aa);
            $cc  = mysqli_fetch_array($bb);
//            print_r($cc);
            ?>
            <div class="col-md-4">
                <div class="col-md-inner">
                    <div class="card border border-custom-color font-family-ubuntu" id="card-hover-effect">
                        <div class="card-header font-weight-bold">&nbsp;</div>
                        <div class="card-body row">
                            <div class="col-md-4" style="position: relative">
                                <img src="images/users/<?php echo $row["image"]; ?>" class="img-responsive">
                                <button data-toggle="modal" class="upload-pic-btn-guest" data-target="#upload_img_<?php echo $rand; ?>" >upload</button>
                            </div>
                            <div class="col-md-6">
                                <div class="user-card-details">
                                    <p class="text-primary font-weight-bold">
                                        Name:
                                        <span class="text-secondary font-weight-normal">
                                        <?Php echo $row["first_name"].' '.$row["last_name"]; ?>
                                    </span>
                                    </p>
                                    <p class="text-primary font-weight-bold">
                                        Email:
                                        <span class="text-secondary font-weight-normal">
                                        <?Php echo $row["email"]; ?>
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
                        <div class="card_custom_footer">

                            <button style="width: 98%;" class="btn btn-primary mb-2" data-toggle="modal"
                                    data-target="#guest_settings_<?php echo $rand; ?>">
                                Guest Access Settings
                            </button>
                            <button style="width: 30%;" class="btn btn-info" data-toggle="modal"
                                    data-target="#edit_device_<?php echo $rand; ?>">
                                Edit
                            </button>
                            <a style="width: 34%;" class="btn btn-danger"
                               href="guest-users.php?del_guest_user=<?php echo $row["user_row_id"]; ?>&del_device_id=<?php echo $row["devices_row_id"]; ?>
                                ">
                                Delete
                            </a>
                            <button style="width: 32%;" class="btn" id="custom_brown_btn" data-toggle="modal"
                                    data-target="#create_schedule_<?php echo $rand; ?>"
                               href="#">
                                Schedule
                            </button>
                            <div class="m-t-2">
                                <a href="dashboard.php?action=Open&machine_mac=<?php echo $row["machine_mac"]; ?>"
                                   class="btn btn-warning color-white" style="width: 30%;">Open</a>
                                <a href="dashboard.php?action=Hold&machine_mac=<?php echo $row["machine_mac"]; ?>"
                                   class="btn" style="width: 34%;" id="custom_brown_btn">Hold</a>
                                <a href="dashboard.php?action=Close&machine_mac=<?php echo $row["machine_mac"]; ?>"
                                   class="btn btn-success color-white" style="width: 32%;">Close</a></div>
                        </div>
                        <div class="card-footer font-italic text-center"><?php echo $row["emaild"]; ?></div>
                    </div>
                </div>
            </div>
            <!-- Modal For Guest Access Settings-->
            <div class="modal fade" id="guest_settings_<?php echo $rand; ?>" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Guest Access Controls</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <select class="form-control mb-2" id="edited" name="cat" required="" onchange="open_btn(this.value, '<?php echo $cc["id"]; ?>');">
                                <option value="">Open Button</option>
                                <option value="1">Enabled <?php if($cc["open_btn"]=="1") echo "(Selected)"; ?></option>
                                <option value="0">Disabled <?php if($cc["open_btn"]=="0") echo "(Selected)"; ?></option>
                            </select>
                            <select class="form-control mb-2" id="edited" name="cat" required="" onchange="hold_btn(this.value, '<?php echo $cc["id"]; ?>');">
                                <option value="">Hold Button</option>
                                <option value="1">Enabled <?php if($cc["hold_btn"]=="1") echo "(Selected)"; ?></option>
                                <option value="0">Disabled <?php if($cc["hold_btn"]=="0") echo "(Selected)"; ?></option>
                            </select>
                            <select class="form-control mb-2" id="edited" name="cat" required="" onchange="close_btn(this.value, '<?php echo $cc["id"]; ?>');">
                                <option value="">Close Button</option>
                                <option value="1">Enabled <?php if($cc["close_btn"]=="1") echo "(Selected)"; ?></option>
                                <option value="0">Disabled <?php if($cc["close_btn"]=="0") echo "(Selected)"; ?></option>
                            </select>
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
                                <input name="upload_guest_img" type="submit"/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal For Add Schedule -->
            <div class="modal fade" id="create_schedule_<?php echo $rand; ?>" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Updata Device</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="" enctype="multipart/form-data">
                                <input type="hidden" name="parent_id" value="<?php echo $row["parent_id"]; ?>">
                                <input type="hidden" name="user_id" value="<?php echo $row["id"]; ?>">
                                <div class="row">
                                    <div class="col-md-6">
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
                                            <div class="form-group">
                                                <label for="pwd" id="top-nav-font" style="display: flex;">Event Input:</label>
                                                <select id="nav-font" class="form-control" name="event">
                                                    <option value="none">NONE</option>
                                                    <option value="on">ON</option>
                                                    <option value="off">OFF</option>
                                                </select>
                                            </div>
                                    </div>
                                    <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="pwd" id="top-nav-font" style="display: flex;">Position Input:</label>
                                                <select id="nav-font" class="form-control" name="position">
                                                    <option value="none">NONE</option>
                                                    <option value="Open">Open</option>
                                                    <option value="Closed">Closed</option>
                                                </select>
                                            </div>
<!--                                            <div class="form-group">-->
<!--                                                <label for="pwd" id="top-nav-font" style="display: flex;">Schedule Type:</label>-->
<!--                                                <select id="nav-font" class="form-control" name="nature">-->
<!--                                                    <option value="open">Open Schedule</option>-->
<!--                                                    <option value="close">Close Schedule</option>-->
<!--                                                </select>-->
<!--                                            </div>-->
                                            <div class="form-group">
                                                <label for="pwd" id="top-nav-font" style="display: flex;">Relay Operation:</label>
                                                <select id="nav-font" class="form-control" name="relay">
                                                    <option value="none">NONE</option>
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
                                                        // have we been passed an ID
                                                        if (typeof selectBox == "string") {
                                                            selectBox = document.getElementById(selectBox);
                                                        }
                                                        // is the select box a multiple select box?
                                                        if (selectBox.type == "select-multiple") {
                                                            for (var i = 0; i < selectBox.options.length; i++) {
                                                                selectBox.options[i].selected = selectAll;
                                                            }
                                                        }
                                                    }
                                                </script>
                                                <select id="select_box" class="form-control" name="weekdays[]" multiple="multiple" style="height: 140px;">
                                                    <option value="mon">Monday</option>
                                                    <option value="tue">Tuesday</option>
                                                    <option value="wed">Wednesday</option>
                                                    <option value="thu">Thursday</option>
                                                    <option value="fri">Friday</option>
                                                    <option value="sat">Saturday</option>
                                                    <option value="sun">Sunday</option>
                                                </select>
                                            </div>
                                    </div>
                                    <!-- End of row class -->
                                </div>
                                <button class="btn btn-primary btn-block" type="submit" name="add-schedule" id="nav-font">Save Schedule</button>


                            </form>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Modal For Edit Guest Details-->
            <div class="modal fade" id="edit_device_<?php echo $rand; ?>" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Updata Guest</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="">
                                <div class="form-group">
                                    <label>Guest Email</label>
                                    <input id="nav-font" type="text" class="form-control" id="email"
                                           value="<?php echo $row["email"]; ?>" name="name">
                                </div>
                                <div class="form-group">
                                    <label>Guest Password</label>
                                    <input id="nav-font" type="text" class="form-control" id="email"
                                           value="<?php echo $row["password"]; ?>" name="name">
                                </div>
                                <label>Guest Name</label>
                                <div class="row no-gutters">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input id="nav-font" type="text" class="form-control" id="email"
                                                   value="<?php echo $row["first_name"]; ?>" name="name1"
                                            placeholder="first_name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input id="nav-font" type="text" class="form-control" id="email"
                                                   value="<?php echo $row["last_name"]; ?>" name="name2"
                                                   placeholder="last_name">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Device MAC</label>
                                    <input id="nav-font" type="text" class="form-control" id="email"
                                           value="<?php echo $cc["machine_mac"]; ?>" name="machine">
                                </div>
                                <div class="form-group">
                                    <label>Guest Mobile MAC</label>
                                    <input id="nav-font" type="text" class="form-control" id="email"
                                           value="<?php echo $cc["mobile_mac"]; ?>" name="mobile">
                                </div>
                                <button class="btn btn-primary btn-block" type="submit" name="add-user" id="nav-font">
                                    Update
                                </button>
                                <input type="hidden" name="rowid_users" value="<?php echo $row["id"]; ?>">
                                <input type="hidden" name="rowid_devices" value="<?php echo $cc["id"]; ?>">
                            </form>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        <?php }
    }
    else{
        echo '
            <div class="well w-100 font-weight-bold text-primary" style="margin-bottom: 30%;">You have no guest users!</div>
        ';
    }
?>
    </div>
</div>


<?php

if(isset($_POST["add-user"])){
    require 'parts/db.php';
    $machine=mysqli_real_escape_string($con, $_POST["machine"]);
    $mobile=mysqli_real_escape_string($con, $_POST["mobile"]);
    $name1=mysqli_real_escape_string($con, $_POST["name1"]);
    $name2=mysqli_real_escape_string($con, $_POST["name2"]);
    $usr_id = $_POST["rowid_users"];
    $device_id = $_POST["rowid_devices"];
    $connectionID = $con;



    $query="UPDATE users SET first_name='$name1',last_name='$name2' WHERE id=$usr_id";
    $query1="UPDATE devices SET machine_mac='$machine', mobile_mac='$mobile' WHERE id=$device_id";
    if(!mysqli_query($con, $query) && !mysqli_query($con, $query1)){
        //echo '<script>alert("error in first query")';
        echo "error in query";
    }else{
        echo "<script>alert('Record Updated');
                    window.location.replace('guest-users.php');</script>";
    }


}



// CREATE NEW SCHEDULE


if (isset($_POST["add-schedule"])) {
    $name = $_POST["name"];
    $relay = $_POST["relay"];
    $start_date = $_POST["startdate"];
    $end_date = $_POST["enddate"];
    $start_time = $_POST["start_time"];
    $end_time = $_POST["end_time"];
    $event = $_POST["event"];
    $position = $_POST["position"];
//    $nature = $_POST["nature"];
    $nature = '';
    $parent_id = $_POST["parent_id"];
    $user_id = $_POST["user_id"];
    $week_days = $_POST["weekdays"];


    if(empty($start_date))
        $start_date='2018-04-18';
    if(empty($end_date))
        $end_date='2030-04-18';
    if(empty($start_time))
        $start_time='00:00';
    if(empty($end_time))
        $end_time='23:59';

    $days = "";
    if ($week_days) {
        foreach ($week_days as $t) {
            $days = $t . ',' . $days;
        }
    }

    $connectionID = $con;
    $select = mysqli_query($connectionID, "SELECT * FROM schedule_guest WHERE sch_name = '" . $name . "'") or exit(mysqli_error($connectionID));
    if (mysqli_num_rows($select)) {
        $link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        echo '
                                <script>
                                  alert("Schedule Name is already being used");
                                  window.location.replace("' . $link . '");
                                </script>
                            ';
    }

    $sql = "INSERT INTO schedule_guest (sch_name, relay, parent_id, user_id, start_date, 
                                        end_date, start_time, end_time, weekday, event, positions, schedule_nature)
                                        VALUES ('$name', '$relay', $parent_id, $user_id, '$start_date', 
                                                '$end_date', '$start_time', '$end_time', '$days', '$event','$position', '$nature');
                    ";
    if (mysqli_query($con, $sql)) {
        echo "<script>alert('New Schedule Added Successfully!');document.location = 'dashboard.php';</script>
                 ";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
    }
}




if(isset($_POST['upload_guest_img'])) {
//    echo '
//                <script>alert("Image uploading done!");</script>
//            ';
    require 'parts/db.php';
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
        move_uploaded_file($file_tmp, "images/users/" . $file_name);
        $sql = "UPDATE users SET image='$file_name' WHERE id = $row_id";
        echo $sql;
        if (mysqli_query($con, $sql)) {
            echo '
                <script>window.location.replace("guest-users.php");</script>
            ';
        }
    } else {
        echo '
                <script>alert("'.$errors.'");</script>
            ';
        print_r($errors);
    }
}
 ?>
