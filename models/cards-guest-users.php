
<div class="custom-container">
    <div class="row">
<?php
function user_image(){

}
function name(){

}

$usr_session_id = $_SESSION["id"];
    $sql = "SELECT * FROM $table_name WHERE $where";
    //echo $sql;
    $res = mysqli_query($con, $sql);
    if(mysqli_num_rows($res)) {
        while ($row = mysqli_fetch_assoc($res)) {
            $rand = rand();
            $aa = "SELECT * FROM user_and_devices WHERE user_id = $user_session_id";
            $bb = mysqli_query($con, $aa);
            $cc  = mysqli_fetch_array($bb);
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
                                        <?Php echo $row["first_name"]; ?>
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
                                        <?php echo $cc["machine_mac"]; ?>
                                    </span>
                                    </p>
                                    <p class="text-primary font-weight-bold">
                                        Mobile MAC:
                                        <span class="text-secondary font-weight-normal">
                                        <?php echo $cc["mobile_mac"]; ?>
                                    </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card_custom_footer">

                            <button style="width: 30%;" class="btn btn-primary" data-toggle="modal"
                                    data-target="#edit_device_<?php echo $rand; ?>">
                                Edit
                            </button>
                            <a style="width: 34%;" class="btn btn-danger"
                               href="guest-users.php?del_guest_user=<?php echo $row["id"]; ?>">
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
                                <input type="hidden" name="parent_id" value="<?php echo $row["id"]; ?>">
                                <input type="hidden" name="user_id" value="<?php echo $row["parent_id"]; ?>">
                                <div class="row">
                                    <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="email" id="top-nav-font">Schedule Name:</label>
                                                <input id="nav-font" type="text " class="form-control" placeholder="Schedule Name" id="email" name="name" required>
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
                                                <label for="pwd" id="top-nav-font" style="display: flex;">Holiday:</label>
                                                <select id="nav-font" class="form-control" name="holiday">
                                                    <option value="on">ON</option>
                                                    <option value="off">OFF</option>
                                                </select>
                                            </div>
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
                                <div class="form-group">
                                    <label>Guest Name</label>
                                    <input id="nav-font" type="text" class="form-control" id="email"
                                           value="<?php echo $row["fullname"]; ?>" name="name">
                                </div>
                                <div class="form-group">
                                    <label>Device MAC</label>
                                    <input id="nav-font" type="text" class="form-control" id="email"
                                           value="<?php echo $row["machine_mac"]; ?>" name="machine">
                                </div>
                                <div class="form-group">
                                    <label>Guest Mobile MAC</label>
                                    <input id="nav-font" type="text" class="form-control" id="email"
                                           value="<?php echo $row["mobile_mac"]; ?>" name="mobile">
                                </div>
                                <button class="btn btn-primary btn-block" type="submit" name="add-user" id="nav-font">
                                    Update
                                </button>
                                <input type="hidden" name="rowid" value="<?php echo $row["id"]; ?>">
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
    $name=mysqli_real_escape_string($con, $_POST["name"]);
    $usr_id = $_POST["rowid"];
    $connectionID = $con;



    $query="UPDATE guest_users SET machine_mac='$machine', mobile_mac='$mobile', fullname='$name' WHERE id=$usr_id";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in first query";
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
    $holiday = $_POST["holiday"];
    $position = $_POST["position"];
//    $nature = $_POST["nature"];
    $nature = '';
    $parent_id = $_POST["parent_id"];
    $user_id = $_POST["user_id"];
    $week_days = $_POST["weekdays"];

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
                                        end_date, start_time, end_time, weekday, event, holiday, positions, schedule_nature)
                                        VALUES ('$name', '$relay', $parent_id, $user_id, '$start_date', 
                                                '$end_date', '$start_time', '$end_time', '$days', '$event','$holiday','$position', '$nature');
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
