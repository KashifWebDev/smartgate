<?php

	$servername = "localhost";
	$username = "accesson_smart";
	$password = "bYSaw9LI2Lpw";
	$dbname = "accesson_db_smart";

/*
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "turkvjwp_smart";
*/

$con = mysqli_connect($servername, $username, $password, $dbname);
if (!$con) {
    die("Connection to Database failed: " . mysqli_connect_error());
}

?>