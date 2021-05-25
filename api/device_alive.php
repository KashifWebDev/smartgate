<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  require '../config/config.php';

  include_once '../models/Post.php';

  // Instantiate blog post object
  $now = new DateTime();
  $cur_time=$now->format('d-m-Y H:i:s');    
  //echo $cur_time;
  // Get ID
    $data = json_decode(file_get_contents("php://input"));
    
    
if(isset($data->Machine_MAC) and isset($data->Status) and isset($data->WIFI_LAN_IP) and isset($data->WIFI_SERVER_IP) ){
    $device_mac=$data->Machine_MAC;
    $device_status=$data->Status;
    $wifi_lan=$data->WIFI_LAN_IP;
    $wifi_server=$data->WIFI_SERVER_IP;
    //echo $device_mac.'  '.$device_status;
    $sql = "UPDATE user_and_devices SET device_status = '".$device_status."', date_time = '".$cur_time."', wifi_lan_ip = '".$wifi_lan."', wifi_server_ip = '".$wifi_server."' WHERE machine_mac = '".$device_mac."'";
    //echo $sql;
    if(mysqli_query($con, $sql)){
        success_msg($device_mac);
    } else{
        err_msg();
        //return "ERROR: Could not able to execute $sql. " . mysqli_error($con);
    }
    
    // Close connection
    mysqli_close($con);
}else{
    $post_arr = array(
        'Message' => 'Parameters are not correctly set!',
        'Response' => 'NACK'
    );
    print_r(json_encode($post_arr));
}
  




    
function success_msg($mac){
    $post_arr = array(
        'Machine_MAC' => $mac,
        'Response' => 'ACK'
    );
    print_r(json_encode($post_arr));
}
function err_msg(){
    $post_arr = array(
        'Response' => 'NACK'
    );
    print_r(json_encode($post_arr));
}
  ?>