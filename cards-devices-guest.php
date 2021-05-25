
<div class="custom-container">
    <div class="row">
<?php
function get_device_name($mac, $con){
//    return '123';
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
//    return $sql;
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["device_name"];
}
    $sql = "SELECT * FROM $table_name WHERE $where";
    //echo $sql;
    $res = mysqli_query($con, $sql);
    while($row = mysqli_fetch_assoc($res)){
        $rand = rand();
        $alarm_value = $row["alarm"];
        //echo $alarm_value;
?>
<script>
    function alarm(val, machine_mac) {
        var url = 'dashboard.php?alert_val='+val+'&mac='+machine_mac;
        console.log(url);
        window.location=url;
    }
</script>
        <div class="col-md-4">
            <div class="col-md-inner">
                <div class="card border border-custom-color font-family-ubuntu" id="card-hover-effect">
                    <div class="card-header font-weight-bold"><?Php echo $row["first_name"].' '.$row["last_name"]; ?></div>
                    <div class="card-body row">
                        <div class="col-md-4">
                            <img src="images/<?php echo $img_name; ?>" class="img-responsive">
                            <select class="form-control" id="edited" name="cat" required="" onchange="alarm(this.value, '<?php echo $row["machine_mac"]; ?>');">
                                <option value="">Alarm</option>
                                <option value="none">none <?php if($alarm_value=="none") echo "(Selected)"; ?></option>
                                <option value="1">1sec <?php if($alarm_value=="1") echo "(Selected)"; ?></option>
                                <option value="2">2sec <?php if($alarm_value=="2") echo "(Selected)"; ?></option>
                                <option value="5">5sec <?php if($alarm_value=="5") echo "(Selected)"; ?></option>
                                <option value="10">10sec <?php if($alarm_value=="10") echo "(Selected)"; ?></option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="user-card-details">
                                <p class="text-primary font-weight-bold">
                                    Name:
                                    <span class="text-secondary font-weight-normal">
                                        <?php echo get_device_name($row["machine_mac"], $con); ?>
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
                                <p class="text-primary font-weight-bold">
                                    Schedules:
                                    <span class="text-secondary font-weight-normal">
                                        <?php echo total_schedules_mac($con, $row["machine_mac"]); ?>
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="card_custom_footer">

<!--                            <button style="width: 48%;" class="btn btn-primary" data-toggle="modal" data-target="#edit_device_--><?php //echo $rand; ?><!--">-->
<!--                                Edit Details-->
<!--                            </button>-->
<!--                            <a style="width: 48%;" class="btn btn primary" id="custom_brown_btn" href="scheduling-page.php?id=--><?php //echo $row["id"]; ?><!--">Create Schedule</a>-->
                        <div class="m-t-2">
                            <a href="dashboard_guest.php?action=Open&machine_mac=<?php echo $row["machine_mac"]; ?>" class="btn btn-warning color-white"  style="width: 30%;">Open</a>
                            <a href="dashboard_guest.php?action=Hold&machine_mac=<?php echo $row["machine_mac"]; ?>" class="btn btn-danger color-white" style="width: 34%;">Hold</a>
                            <a href="dashboard_guest.php?action=Close&machine_mac=<?php echo $row["machine_mac"]; ?>" class="btn btn-success color-white" style="width: 32%;">Close</a></div>
                    </div>
                    <div class="card-footer font-italic text-center"><?php echo $row["email"]; ?></div>
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
<?php  } ?>
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

    $select = mysqli_query($connectionID, "SELECT * FROM user_and_devices WHERE machine_mac = '".$machine."'") or exit(mysqli_error($connectionID));
    if(mysqli_num_rows($select)>2) {
        exit('Device MAC is already being used');
        die();
    }



    $query="UPDATE user_and_devices SET machine_mac='$machine', mobile_mac='$mobile', device_name='$name' WHERE id=$usr_id";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in first query";
    }else{
        echo "<script>alert('Record Updated');
                    window.location.replace('dashboard.php');</script>";
    }


}
?>