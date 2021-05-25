<?php 
  // Headers
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


  $data = json_decode(file_get_contents("php://input"));

  if(isset($data->Response) && isset($data->Mobile_MAC) && isset($data->Machine_MAC))
{
  $res = $data->Response;
  $mobile_mac = $data->Mobile_MAC;
  $mach_mac = $data->Machine_MAC;

    $a = "UPDATE user_and_devices SET server_request='' WHERE machine_mac='$mach_mac'";
    // if(mysqli_query($con, $a)){
    //     echo "done clear  ".$a;
    // }
    mysqli_query($con, $a);

  
    $sql = "INSERT INTO machine_req_recievedack (response, mobile_mac, machine_mac)
            VALUES ('".$res."', '".$mobile_mac."', '".$mach_mac."')";
    //print_r($data);
    //echo $count;
    if(mysqli_query($con, $sql)){
            echo json_encode(
                  array(
                      'Response' => 'ACK'
                  )
                );
    } else{
            echo json_encode(
                  array(
                      'Response' => 'NACK'
                  )
                );
    }
    
    // Close connection
    mysqli_close($con);

}else{
            echo json_encode(
                  array(
                      'Response' => 'NACK',
                      'Message' => 'Error Occured While Processing Request'
                  )
                );
}


?>