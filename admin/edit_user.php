<?php

$page_title = "Home";
$current_page = "Dashboard";
$redirec = "admin";
$dir = "../";
require 'common.php';

session_start();
$usr_id = $_GET['id'];

$sql = "SELECT * FROM users WHERE id=$usr_id";
$res = mysqli_query($con, $sql);
$user_data = mysqli_fetch_assoc($res);





if(isset($_POST["add-user"])){
    require '../parts/db.php';
    $fname=mysqli_real_escape_string($con, $_POST["fname"]);
    $lname=mysqli_real_escape_string($con, $_POST["lname"]);
    $email=mysqli_real_escape_string($con, $_POST["email"]);
    $pass=mysqli_real_escape_string($con, $_POST["pass"]);
    $connectionID = $con;

    $select = mysqli_query($connectionID, "SELECT * FROM users WHERE email = '".$email."'") or exit(mysqli_error($connectionID));
    if(mysqli_num_rows($select)) {
        echo '
                <script>
                    alert("Email already in use!");
                    window.location.replace("dashboard.php");
                </script>
            ';
    }



    $query="UPDATE users SET first_name='$fname', last_name='$lname', email='$email', password='$pass' WHERE id=$usr_id";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in first query";
    }else{
        echo "<script>alert('Record Updated');
                    window.location.replace('dashboard.php');</script>";
    }


}

?>

<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header text-center" id="top-nav-font">Edit User Details </div>
        <div class="card-body">

            <form method="post" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $user_data["first_name"];?>" name="fname">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $user_data["last_name"]; ?>" name="lname">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="text" class="form-control" id="email" value="<?php echo $user_data["email"];?>" name="email">
                </div>
                <div class="form-group">
                    <input id="nav-font" type="password" class="form-control" id="email" value="<?php echo $user_data["password"];?>" name="pass">
                </div>
                <!--
            <div class="form-group">
                    <b id="top-nav-font">Thumbnail:</b>&nbsp;<input id="nav-font" type="file" name="image" />
            </div>
            -->
                <button class="btn btn-primary btn-block" type="submit" name="add-user" id="nav-font">Update</button>


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
