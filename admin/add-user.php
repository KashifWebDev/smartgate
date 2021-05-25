<?php
$page_title="Add User";
$current_page="Add User" ;
$redirec="admin";
$dir="../";
require 'common.php';

if(isset($_POST["add-user"])){
    require '../parts/db.php';
    $fname=mysqli_real_escape_string($con, $_POST["fname"]);
    $lname=mysqli_real_escape_string($con, $_POST["lname"]);
    $email=mysqli_real_escape_string($con, $_POST["email"]);
    $loc=mysqli_real_escape_string($con, $_POST["location"]);
    $mac=mysqli_real_escape_string($con, $_POST["mac"]);
    $m_mac=mysqli_real_escape_string($con, $_POST["mobile_mac"]);
    $pass=mysqli_real_escape_string($con, $_POST["pass"]);
    $comp = $_POST["company"];
    $connectionID = $con;

    $select = mysqli_query($connectionID, "SELECT * FROM users WHERE email = '".$email."'") or exit(mysqli_error($connectionID));
    if(mysqli_num_rows($select)) {
        exit('This email is already being used');
        die();
    }



    $query="Insert into users (first_name, last_name, email, password, mac, mobile_mac, company)
            VALUES ('$fname', '$lname', '$email', '$pass', '$mac', '$m_mac', '$comp')";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in first query";
    }else{
        echo "<script>alert('record inserted');</script>";
    }


    $userid_abc=$row["id"];
    echo $userid_abc;

    $now = new DateTime();
    $cur_time=$now->format('d-m-Y H:i:s');


    $record_id=mysqli_insert_id($con);

    $query="Insert into user_and_devices (user_id, device_name, machine_mac, mobile_mac, active, date_time)
            VALUES ($record_id, '$loc', '$mac', '$m_mac', 1, '$cur_time')";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in second query".mysqli_error($con);
    }else{
        //echo "sencond query success";
    }

}

?>

<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header text-center" id="top-nav-font">Add New User</div>
        <div class="card-body">

            <form method="post" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" placeholder="First Name" name="fname">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" placeholder="Last Name" name="lname">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" placeholder="Email" name="email">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" placeholder="Device Name" name="location">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" placeholder="Device MAC" name="mac">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" placeholder="Mobile MAC" name="mobile_mac">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="password" class="form-control" id="email" placeholder="Password" name="pass">
                </div>
                <div class="form-group">
                    <?php
                    //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
                    $sql = "SELECT * FROM company";
                    $result = mysqli_query($con, $sql);
                    ?>
                    <select class="form-control" name="company">
                        <option value="">--Select Group--</option>
                        <?php
                        if (mysqli_num_rows($result) > 0) {
                            // output data of each row
                            while($row = mysqli_fetch_assoc($result)) {
                                //echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
                                echo '
				                 <option value="'.$row["id"].'">'.$row["name"].'</option>
                                ';
                            }
                        }

                        ?>
                    </select>
                </div>
                <!--
            <div class="form-group">
                    <b id="top-nav-font">Thumbnail:</b>&nbsp;<input id="nav-font" type="file" name="image" />
            </div>
            -->
                <button class="btn btn-primary btn-block" type="submit" name="add-user" id="nav-font">Register</button>


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
<script src="<?php echo $dir; ?>vendor/chart.js/Chart.min.js"></script>
<script src="<?php echo $dir; ?>vendor/datatables/jquery.dataTables.js"></script>
<script src="<?php echo $dir; ?>vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="<?php echo $dir; ?>js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="<?php echo $dir; ?>js/demo/datatables-demo.js"></script>
<script src="<?php echo $dir; ?>js/demo/chart-area-demo.js"></script>


</body>

</html>
