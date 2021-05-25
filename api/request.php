<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: POST');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  require '../parts/db.php';
  

  // Instantiate blog post object
  $now = new DateTime();
  $cur_time=$now->format('d=m-Y H:i:s');    
  //echo $cur_time;
  // Get ID


  $data = json_decode(file_get_contents("php://input"));


  if(isset($data->Request) and isset($data->Mobile_MAC) and isset($data->Machine_MAC) and isset($data->User) and isset($data->Password) ) {
  $req = $data->Request;
  $mobile_mac = $data->Mobile_MAC;
  $mach_mac = $data->Machine_MAC;
  $u = $data->User;
  $p = $data->Password;
  /*
    Check if user&pass is valid for Mobile/Machine MAC
  */
  //echo $req.'~'.$mobile_mac.'~'.$mach_mac.'~'.$u.'~'.$p.'<br>';
    //// CHECK FOR LOGIN CREDENTIALS
    $u=mysqli_real_escape_string($con, $u);
    $p=mysqli_real_escape_string($con, $p);
    $query="Select * from users where email='$u' and password='$p'";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $userid=$row['id'];
    $count_first = mysqli_num_rows($result);
    //// CHECK FOR MAC ADDRESS
    $condition="mobile_mac='$mobile_mac' and machine_mac='$mach_mac' and ".$count_first;
    $query="Select * from user_and_devices where $condition";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $userid=$row['machine_mac'];
    $count = mysqli_num_rows($result);
    if($count >0) {
            echo json_encode(
                  array(
                      'Response' => "ACK",
                      'Mobile_MAC' => $mobile_mac,
                      'Machine_MAC' => $mach_mac
                  )
                );
    }else {
            echo json_encode(
                  array(
                      'Response' => "NACK",
                      'Message' => "Credentials or Mobile/Machine MAC not matched!"
                  )
                );
    }
}else {
            $post_arr = array(
                'Message' => 'JSON Format Invalid',
                'Response' => 'NACK'
            );
            print_r(json_encode($post_arr));
    }
    
?>