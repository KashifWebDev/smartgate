<?php

//date_default_timezone_set("Asia/Karachi");  // Pakistan
//
//date_default_timezone_set("Pacific/Easter");  // Eastern Standard Time
//date_default_timezone_set("US/Central");  // Central Standard Time
//date_default_timezone_set("US/Mountain");  //  Mountain Standard Time
//date_default_timezone_set("US/Pacific");  //  Pacific Standard Time
//date_default_timezone_set("US/Alaska");  //  Alaska Standard Time
//date_default_timezone_set("US/Hawaii");  //  Hawaii-Aleutian Standard Time






require 'parts/db.php';
require 'functions.php';
date_default_timezone_set(get_timezone($con, 1));

$date = date('m/d/Y h:i:s a', time());
$start_time = date("h:i:s a", time());
$end_time = date("h:i:s a", time());
$current_time = date('h:i:s a', time());
$current_date = date('Y-m-d', time());

echo $start_time;