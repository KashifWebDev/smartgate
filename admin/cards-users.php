<div class="custom-container">
    <div class="rowd">
<?php
    $sql = "SELECT * FROM $table_name WHERE $where";
    //echo $sql;
    $res = mysqli_query($con, $sql);
    while($row = mysqli_fetch_assoc($res)){
        $rand = rand();
        $img_name = $row["image"];
?>
        <div class="col-md-4">
            <div class="col-md-inner">
                <div class="card border border-custom-color font-family-ubuntu" id="card-hover-effect">
                    <div class="card-header font-weight-bold"><?Php echo $row["first_name"].' '.$row["last_name"]; ?></div>
                    <div class="card-body d-flex">
                        <div class="card-left float-left d-block w-50">
                            <img src="../images/users/<?php echo $img_name; ?>" id="user-avartar" style="height: 129px; padding-left: 10%;margin-bottom: 8%" class="img-circle">
                            <button class="btn btn-primary btn-block" id="custom_primary_btn_no" onclick="window.location.href='generate-report.php?id=<?php echo $row["id"]; ?>'">
                                <i class="fas fa-info-circle text-white" id="info-favicon"></i> More Details
                            </button>
                        </div>
                        <div class="card-right float-left w-50 p-l-4">
                            <div class="user-card-details">
                                <div style="height: 129px; margin-bottom: 8%;">
                                    <p class="text-primary font-weight-bold">
                                        <a href="#">Devices:</a>
                                        <span class="text-secondary font-weight-normal">
                                        <?php echo total_devices($con, $row["id"]); ?>
                                    </span>
                                    </p>
                                    <p class="text-primary font-weight-bold">
                                        <a href="#">Groups:</a>
                                        <span class="text-secondary font-weight-normal">
                                        <?php echo company_name($con, $row["company"]); ?>
                                    </span>
                                    </p>
                                    <p class="text-primary font-weight-bold">
                                        <a href="#">Schedules:</a>
                                        <span class="text-secondary font-weight-normal">
                                        <?php echo total_schedules($con, $row["id"]); ?>
                                    </span>
                                    </p>
                                    <p class="text-primary font-weight-bold">
                                        <a href="#">Alerts:</a>
                                        <span class="text-secondary font-weight-normal">
                                        <?php echo total_alerts($con, $row["id"]); ?>
                                    </span>
                                    </p>
                                </div>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#del_user_<?php echo $rand; ?>">Delete User</button>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer font-italic text-center"><?php echo $row["email"]; ?></div>
                </div>
            </div>
        </div>


        <!-- Modal Delete Users-->
        <div class="modal fade" id="del_user_<?php echo $rand; ?>" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
<!--                    <div class="modal-header">-->
<!--                        <button type="button" class="close" data-dismiss="modal">&times;</button>-->
<!--                        <h4 class="modal-title">Delete User</h4>-->
<!--                    </div>-->
                    <div class="modal-body">
                        <b>Are you sure to delete user <i><?Php echo $row["first_name"].' '.$row["last_name"]; ?></i>?</b>
                    </div>
                    <div class="modal-footer">
                        <a href="dashboard.php?del_user=<?php echo $row["id"]; ?>" class="btn btn-success text-white">DELETE</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
<?php  } ?>
    </div>
</div>

<?php
function company_name($con, $comp_id){
    $sql = "SELECT * FROM company WHERE id=$comp_id";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($res);
    return $row["name"];
}
function total_devices($con, $user_id){
    $sql = "SELECT * FROM user_and_devices WHERE user_id=$user_id";
    $res = mysqli_query($con, $sql);
    return mysqli_num_rows($res);
}
function total_schedules($con, $user_id){
    $sql = "SELECT * FROM schedule WHERE user_id=$user_id";
    $res = mysqli_query($con, $sql);
    return mysqli_num_rows($res);
}
function total_alerts($con, $user_id){
    $sql = "SELECT * FROM alert WHERE user_id=$user_id";
    $res = mysqli_query($con, $sql);
    return mysqli_num_rows($res);
}
?>