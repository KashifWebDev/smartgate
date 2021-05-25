<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

require '../config/config.php';

include_once '../models/Post.php';

// Instantiate blog post object
$now = new DateTime();
$cur_time=$now->format('d-m-Y H:i:s');
//echo $cur_time;
// Get ID


if(isset($_GET["machine_mac"]) && isset($_GET["request"])){
    $mac = $_GET["machine_mac"];
    $req = $_GET["request"];
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    if($req == $row["server_request"]){
        echo json_encode(array("Message"=>"Record Saved"));
    }
}