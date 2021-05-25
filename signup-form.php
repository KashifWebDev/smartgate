<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login1000-form validate-form" method="post" action="">
                    <span class="login100-form-title p-b-26">
                        Register New User
                    </span>

                <?php
                if(isset($add_this) and $add_this){
                    ?>
                <span class="login100-form-title p-b-48">
                        <img style="width: 150px;" src="images/logo.jpg">
                    </span>
                <?php } ?>
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
                        <select class="form-control" id="sel1" name="company" <?php if(!$add_this) echo ' style="height: 37px; font-size: 13px;"'; ?>>
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

                <?php
                if(isset($add_this) and $add_this){
                ?>

                <div class="text-center p-t-115">
                        <span class="txt1">
                            Already Registered?
                        </span>

                    <a class="txt2" href="index.php">
                        Login
                    </a>
                </div>
                <?php } ?>
            </form>
        </div>
    </div>
</div>