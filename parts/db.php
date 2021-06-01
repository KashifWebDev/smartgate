<?php
session_start();

	//$servername = "https://host368.hostmonster.com";

//	$servername = "localhost";
//	$username = "accesson_smart";
//	$password = "bYSaw9LI2Lpw";
//	$dbname = "accesson_db_smart";

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "project_smartgate";


	$con = mysqli_connect($servername, $username, $password, $dbname);
	if(!$con){ ?>
		
				<div class="container error_con">
                    <div class="alert alert-danger">
					  <center><b>*****!! DATABASE CONNECTION FALIED !!*****</b><hr>
					  <strong>Error!</strong> There's a problem connecting with database. <a href="#">Report to Fix. </a>Sorry for inconvenient.</center>
					</div>
				</div>
	<?php
			 }
	?>
