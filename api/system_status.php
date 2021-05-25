<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  require '../parts/db.php';

  // Instantiate blog post object
  $now = new DateTime();
  $cur_time=$now->format('d-m-Y H:i:s');    
  //echo $cur_time;
  // Get ID
    $data = json_decode(file_get_contents("php://input"));
    
    
if(isset($data->Machine_MAC) and isset($data->User) and isset($data->Password) and isset($data->WIFI_Status) ){
    $device_mac=$data->Machine_MAC;
    $eamil=$data->User;
    $pass=$data->Password;
    $status=$data->WIFI_Status;
    //echo $device_mac.'  '.$device_status;
    
    $u=mysqli_real_escape_string($con, $eamil);
    $p=mysqli_real_escape_string($con, $pass);
    $query="Select * from users where email='$u' and password='$p'";
    //echo $query;
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $userid=$row['id'];
    //echo $userid;
    $count_first = mysqli_num_rows($result);
    //// CHECK FOR MAC ADDRESS
    if(!$count_first){
         $post_arr = array(
        'Message' => 'Credentials Not Valid!',
        'Response' => 'NACK'
            );
         print_r(json_encode($post_arr));
    die();
    exit();
    }
    
    $condition="machine_mac='$device_mac' and ".$count_first;
    
    
    $sql = "SELECT * FROM user_and_devices WHERE $condition";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($res);
    
    $post_arr = array(
        'Machine_MAC' => $row["machine_mac"],
        'WIFI_IP' => $row["wifi_lan_ip"],
        'SERVER_IP' => $row["wifi_server_ip"],
        'User' => $u,
        'Password' => $p
          );
    
    
    // Close connection
    mysqli_close($con);
}else{
    $post_arr = array(
        'Message' => 'Parameters are not correctly set!',
        'Response' => 'NACK'
    );
}
  


    print_r(json_encode($post_arr));
  ?>