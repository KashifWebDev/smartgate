<?php
error_reporting(0);
session_start();
if(isset($_SESSION["signup_error"]) and $_SESSION["signup_error"]!=""){
          echo $_SESSION["signup_error"];
}


if(isset($_POST["submit"])){
    require 'parts/db.php';
    $u=mysqli_real_escape_string($con, $_POST["uname"]);
    $p=mysqli_real_escape_string($con, $_POST["pass"]);
    $c=$_POST["company"];
    $query="Select * from users where email='$u' and password='$p' and company=$c";
    $query1 = "Select * from guest_users where email='$u' and password='$p'";
    $result = mysqli_query($con, $query);
    $result1 = mysqli_query($con, $query1);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC);
    $count = mysqli_num_rows($result);
    $count1 = mysqli_num_rows($result1);
    if($count == 1) {
        session_start();
        $_SESSION['active'] = true;
        $_SESSION['id'] = $row["id"];
        $_SESSION['fname'] = $row["first_name"];
        $_SESSION['lname'] = $row["last_name"];
        $_SESSION['country'] = $row["country"];
        $_SESSION['email'] = $row["email"];
        $_SESSION['mac'] = $row["mac"];
        $_SESSION['mobile_mac'] = $row["mobile_mac"];
        $_SESSION['user_type'] = $row["user_type"];
        $_SESSION['isadmin'] = $admin = $row["is_admin"];
        $restrict = $row["is_restricted"];
        $_SESSION['company'] = $row["company"];

        if($restrict){
            echo "<script>alert('You are restricted by Administrator!');</script>";
            //header("location: index.php");
        }
        if($admin && !$restrict){
            header("location: admin/dashboard.php");
        }else if(!$restrict) {
            header("location: dashboard.php");
        }

//echo '<script>alert("'.$admin.'")</script>';
    }
    if($count1 == 1) {
        session_start();
        $_SESSION['active'] = true;
        $_SESSION['id'] = $row1["id"];
        $_SESSION['parent_id'] = $row1["parent_id"];
        $_SESSION['name'] = $row1["fullname"];
        $_SESSION['lname'] = "";
        $_SESSION['country'] = "";
        $_SESSION['email'] = $row1["email"];
        $_SESSION['mac'] = $row1["machine_mac"];
        $_SESSION['mobile_mac'] = $row1["mobile_mac"];
        $restrict = $row1["is_restricted"];

        if($restrict){
            echo "<script>alert('You are restricted by Administrator!');</script>";
            //header("location: index.php");
        }
        if(!$restrict) {
            header("location: dashboard_guest.php");
        }

//echo '<script>alert("'.$admin.'")</script>';
    }

    else {
        echo '<script>alert("Invalid Email or Password")</script>';
    }

}



?>

<!DOCTYPE html>
<html lang="en">
	<title>Login Page</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login1000-form validate-form" method="post" action="index.php">
					<span class="login100-form-title p-b-26">
						Welcome Back
					</span>
					<span class="login100-form-title p-b-48">
						<img style="width: 150px;" src="images/logo.jpg">
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: aasdf">
                        <label class="focus-input100" style="color: grey;margin-top: -10px">Email</label>
						<input class="input100" type="email" name="uname">
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
                        <span class="focus-input100" style="color: grey;margin-top: -10px">Password</span>
						<input class="input100" type="password" name="pass">
					</div>
            <?php
             require 'parts/db.php';
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM company";
            $result = mysqli_query($con, $sql);
            ?>

				    <div class="form-group">
				      <select class="form-control" id="sel1" name="company" style="padding-bottom: 4px;">
				        <option>Select Group</option>
                <?php
                        if (mysqli_num_rows($result) > 0) {
                            // output data of each row
                            while($row = mysqli_fetch_assoc($result)) {
                              echo '
				        <option value="'.$row["id"].'">'.$row["name"].'</option>
                                    ';
                                        }
                                    } else {
                                        echo "0 results";
                                    }

                              ?> 

				      </select>
				    </div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" name="submit">
								Login
							</button>
						</div>
					</div>



                    <div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

                        <a class="txt2" href="signup.php">
                            Sign Up
                        </a>
                    </div>

                </form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.15.0/esm/popper-utils.js"></script>

</body>
</html>