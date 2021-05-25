<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: POST');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  require '../parts/db.php';

  $data = json_decode(file_get_contents("php://input"));


  if(isset($data->Machine_MAC)) {
  $mach_mac = $data->Machine_MAC;

    $query="Select * from user_and_devices where machine_mac='$mach_mac'";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $count = mysqli_num_rows($result);
    if($row["server_request"]=="Open" || $row["server_request"]=="Hold"){
      $relay = "Hi";
    }
    if($row["server_request"]=="Close"){
      $relay = "Lo";
    }
    if($count >0) {
            if (mysqli_query($con, $query)) {
                        echo json_encode(
                            array(
                                'Response' => "ACK",
                                'Mobile_MAC' => $row["machine_mac"],
                                'Machine_MAC' => $row["mobile_mac"],
                                'Position_Input' => $row["position"],
                                'Relay' => $row["relay_from_api"],
                                //'Relay' => $relay,
                                'Event' => $row["event"],
                            )
                          );
                  } else {
                      echo "Error: " . $sql . "<br>" . mysqli_error($con);
                  }

        }else {
                echo json_encode(
                      array(
                          'Response' => "NACK",
                          'Message' => "Machine MAC not matched!"
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