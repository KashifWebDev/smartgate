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
// 
// print_r($data);
  //Get ID
if(isset($data->id) and isset($data->device_name) and isset($data->device_mac) and isset($data->mobile_mac)){
  $record_id =$data->id;
  $loc =$data->device_name;
  $device_mac =$data->device_mac;
  $mobile_mac =$data->mobile_mac;

    $query = "SELECT * FROM user_and_devices WHERE machine_mac = '".$device_mac."'";
    $select = mysqli_query($con, $query);

    if(mysqli_num_rows($select)) {
        unset($_POST["link-device"]);
          $post_arr = array(
            'Message' => 'MAC Address is already being used!'
          );
print_r(json_encode($post_arr));
        exit();
    }
    $query="Insert into user_and_devices (user_id, device_name, machine_mac, mobile_mac, active, date_time) 
            VALUES ($record_id, '$loc', '$device_mac', '$mobile_mac', 1, '$cur_time')";
    if(mysqli_query($con, $query)){
          $post_arr = array(
            'Message' => 'Device Added!'
          );
        }
    else{
          $post_arr = array(
            'Message' => 'Error Occured While Added Device'
          );
    }

//End Inserting Record
}
else{
  $post_arr = array(
    'Message' => 'Parameters not set correctly!'
  );
}

print_r(json_encode($post_arr));
?>