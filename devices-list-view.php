<div class="row">
    <div class="col-md-9">
        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                All Devices Record</div>
            <?php
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM user_and_devices WHERE user_id=".$_SESSION["id"];
            $result = mysqli_query($con, $sql);
            ?>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Device Name</th>
                            <th>Mobile Address</th>
                            <th>Mac Address</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Device Name</th>
                            <th>Mobile Address</th>
                            <th>Mac Address</th>
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
                <td>'.$row["mobile_mac"].'</td>
                <td>'.$row["machine_mac"].'</td>
                <td class="center">
                    <a class="device-action" href="dashboard.php?action=Open&machine_mac='.$row["machine_mac"].'" class="deleteaction" style="color:green;">Open</a>
                    <a class="device-action" href="dashboard.php?action=Close&machine_mac='.$row["machine_mac"].'" class="deleteaction" style="color:red;"> Close</a>
                    <a class="device-action" href="dashboard.php?action=Hold&machine_mac='.$row["machine_mac"].'" class="deleteaction"> Hold</a>
                </td>';
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
    </div>
    <div class="col-md-3">
            <div class="card card-register ">
                <div class="card-header text-center" id="top-nav-font">Link New Device</div>
                <div class="card-body">

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
            </div>
    </div>
</div>

<?php
session_start();
$record_id = $_SESSION["id"];

if(isset($_POST["link-device"])){
    $mobile_mac = $_POST["mobile_mac"];
    $device_mac = $_POST["device_mac"];
    $loc = $_POST["device_name"];

    $query = "SELECT * FROM user_and_devices WHERE machine_mac = '".$device_mac."'";
    $select = mysqli_query($con, $query);

    if(mysqli_num_rows($select)) {
        unset($_POST["link-device"]);
        echo '<script>alert("Deivce Mac is already being used!");
                window.location.replace("dashboard.php");
                </script>';
        exit();

    }

    $now = new DateTime();
    $cur_time=$now->format('d-m-Y H:i:s');

    $query="Insert into user_and_devices (user_id, device_name, machine_mac, mobile_mac, active, date_time) 
            VALUES ($record_id, '$loc', '$device_mac', '$mobile_mac', 1, '$cur_time')";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in second query. ERR: ".mysqli_error($con);
    }else{
        echo "<script>alert('Device Linked!');
                window.location.replace('dashboard.php');
                </script>";
    }


}
?>