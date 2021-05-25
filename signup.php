<?php
error_reporting(0);
session_start();
if(isset($_POST["submit"])){
    require 'parts/db.php';
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
//        $select = mysqli_query($connectionID, "SELECT * FROM user_and_devices WHERE machine_mac = '".$mac."'") or exit(mysqli_error($connectionID));
//        if(mysqli_num_rows($select)) {
//            exit('Device MAC already registered!');
//            die();
//        }



    $query="Insert into users (first_name, last_name, email, password, mac, mobile_mac, company)
            VALUES ('$fname', '$lname', '$email', '$pass', '$mac', '$m_mac', '$comp')";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in first query";
    }else{
        echo "<script>alert('record inserted');</script>";
    }


$userid_abc=$row["id"];
//echo $userid_abc;

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

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Signup Page</title>
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
</head>
<body>
    
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login1000-form validate-form" method="post" action="">
                    <span class="login100-form-title p-b-26">
                        Welcome Back
                    </span>
                    <span class="login100-form-title p-b-48">
                        <img style="width: 150px;" src="images/logo.jpg">
                    </span>

                    <div class="wrap-input100 validate-input" data-validate = "Valid email is: aasdf">
                        <input class="input100" type="text" name="fname">
                        <span class="focus-input100" data-placeholder="First Name"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Valid email is: aasdf">
                        <input class="input100" type="text" name="lname">
                        <span class="focus-input100" data-placeholder="Last Name"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Valid email is: aasdf">
                        <input class="input100" type="email" name="email">
                        <span class="focus-input100" data-placeholder="Email"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Valid email is: aasdf">
                        <input class="input100" type="text" name="location">
                        <span class="focus-input100" data-placeholder="Device Name"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Valid email is: aasdf">
                        <input class="input100" type="text" name="mac">
                        <span class="focus-input100" data-placeholder="Device MAC Address"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Valid email is: aasdf">
                        <input class="input100" type="text" name="mobile_mac">
                        <span class="focus-input100" data-placeholder="Mobile MAC Address"></span>
                    </div>
            <?php
             require 'parts/db.php';
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM company";
            $result = mysqli_query($con, $sql);
            ?>


                    <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <span class="btn-show-pass">
                            <i class="zmdi zmdi-eye"></i>
                        </span>
                        <input class="input100" type="password" name="pass">
                        <span class="focus-input100" data-placeholder="Password"></span>
                    </div>


                    <div >
				    <div class="form-group">
				      <select class="form-control" id="sel1" name="company">
				        <option>Select Company</option>
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
                    </div>
                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn" name="submit">
                                Register
                            </button>
                        </div>
                    </div>


                    <div class="text-center p-t-115">
                        <span class="txt1">
                            Already Registered?
                        </span>

                        <a class="txt2" href="index.php">
                            Login
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

</body>
</html>