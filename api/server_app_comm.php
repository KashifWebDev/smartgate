<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: POST');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  require '../parts/db.php';


  // Instantiate blog post object
  $now = new DateTime();
  $cur_time=$now->format('d-m-Y H:i:s');    
  //echo $cur_time;
  // Get ID


  $data = json_decode(file_get_contents("php://input"));

  if(isset($data->Machine_MAC) && isset($data->Request) && isset($data->Mobile_MAC) && isset($data->User) && isset($data->Password))
{
    $Machine_Mac = $data->Machine_MAC;
    $Mobile_MAC = $data->Mobile_MAC;
    $User = $data->User;
    $Password = $data->Password;
    $Request = $data->Request;
$login_auth = false;

    
     $a = "SELECT * FROM users WHERE email='$User' AND password='$Password'";
//     echo $a;
     $b = mysqli_query($con, $a);
     if(mysqli_num_rows($b)){
         $row = mysqli_fetch_array($b);
         $login_auth = true;
         $guest_id = $row["id"];
         $parent_id = $row["parent_id"];
         $u_email = $row["email"];
         $u_pass = $row["password"];
         $user_type = $row["user_type"];
//         echo $u_email.' ! '.$u_pass;

         $sql = "SELECT * FROM user_and_devices WHERE user_id=$parent_id AND machine_mac='".$Machine_Mac."'";
         $result = mysqli_query($con, $sql);
         $data = mysqli_fetch_array($result);
        //print_r($data);
         $count=mysqli_num_rows($result);
         if(!$count){
	         $sql = "SELECT * FROM user_and_devices WHERE machine_mac='".$Machine_Mac."'";
	         $result = mysqli_query($con, $sql);
	         $data = mysqli_fetch_array($result);
         }

         /// check if open/hold/close buttons are restricted or not
         $row = $data;
         $action = $Request;
         //echo "<br>";
  		//print_r($row);

             if($action=="Open" && !$row["open_btn"]){
                 echo json_encode(
                     array(
                         'Response' => 'NACK',
                         'Message' => 'Open Button is restricted!'
                     )
                 );die();exit();
             }
             if($action=="Close" && !$row["close_btn"]){
                 echo json_encode(
                     array(
                         'Response' => 'NACK',
                         'Message' => 'Close Button is restricted!'
                     )
                 );die();exit();
             }
             if($action=="Hold" && !$row["hold_btn"]){
                 echo json_encode(
                     array(
                         'Response' => 'NACK',
                         'Message' => 'Hold Button is restricted!'
                     )
                 );die();exit();
             }


//         if($data["relay"]=="None"){
//             echo json_encode(
//                 array(
//                     'Response' => 'NACK',
//                     'Message' => 'Relay is set to None. No Open/Hold/Close requests will be performed.'
//                 )
//             );die();exit();
//         }
         // if($data["relay"]=="Momentary" && $Request=="Close"){
         //     echo json_encode(
         //         array(
         //             'Response' => 'NACK',
         //             'Message' => 'Relay is set to momentary, no Close requests will be sent.'
         //         )
         //     );die();exit();
         // }
         if($data["relay"]=="None"){
             echo json_encode(
                 array(
                     'Response' => 'NACK',
                     'Message' => 'Relay is set to None. No Open/Hold/Close requests will be performed.'
                 )
             );die();exit();
         }
         if($data["relay"]=="Unlatch" && $Request=="Open"){
             echo json_encode(
                 array(
                     'Response' => 'NACK',
                     'Message' => 'Relay is set to Unlatch, no Open requests will be sent.'
                 )
             );die();exit();
         }
     }
        if($login_auth){
//            echo "yes";
            //check if user is guest and if guest is allowed at this time

            if($user_type=="guest"){
                    $aa = "SELECT * FROM schedule_guest WHERE user_id = $guest_id";
                    $bb = mysqli_query($con, $aa);
                    $guest_row = mysqli_fetch_array($bb);
                require 'time_config.php';

                $current_time = date('h:i:s a', time());
                $current_date = date('Y-m-d', time());


                    $start_date = $guest_row["start_date"];
                    $start_time = date("h:i:s a", strtotime($guest_row["start_time"]));
                    $end_date = $guest_row["end_date"];
                    $end_time = date("h:i:s a", strtotime($guest_row["end_time"]));

                //======================== Listing all
//        echo 'Start Time: ' . $start_time . '<br>';
//        echo 'End Time: ' . $end_time . '<br>';
//        echo 'Start Date: ' . $start_date . '<br>';
//        echo 'End Date: ' . $end_date . '<br>';
//        echo 'Current Time: ' . $current_time . '<br>';
//        echo 'Current Date: ' . $current_date . '<br>';
                    $uid = $row["id"];
                $a1 = "SELECT * FROM  schedule_guest WHERE user_id=$uid";
                $b1 = mysqli_query($con, $a1);
                $sch_exist = mysqli_num_rows($b1);

                if($sch_exist) {
                    if (!(strtotime($current_time) >= strtotime($start_time) &&
                        strtotime($current_time) <= strtotime($end_time))
                    ) {
//                        echo "Time conditioni  matched";
                        //DateTime condition NOT matched
                        if(($guest_row["time_1"]=="on" && strtotime($current_time)<strtotime($end_time)) ||
                            ($guest_row["time_2"]=="on" && strtotime($current_time)>strtotime($start_time))){
                            echo json_encode(
                                array(
                                    'Response' => 'NACK',
                                    'Message' => 'Guest User is not allowed at the moment (time)!'
                                )
                            );
                            die();
                            exit();
                        }

                    }
                    if (!($start_date < $current_date || $start_date == $current_date)
                        && ($end_date > $current_date || $end_date == $current_date) ||
                        ($guest_row["date_2"]=="on" && $current_date>$start_date)
                    ) {
//                        echo "Date conditioni not matched";
                        echo json_encode(
                            array(
                                'Response' => 'NACK',
                                'Message' => 'Guest User is not allowed at the moment (date)!'
                            )
                        );
                        die();
                        exit();
                    }
                }
            }

        if($Request!="" && !empty($Request)){
        $a = "UPDATE user_and_devices SET server_request='$Request' WHERE machine_mac='".$Machine_Mac."'";
        $b = "INSERT INTO app_requests (mobile_mac, machine_mac, request) VALUES ('$Mobile_MAC', '$Machine_Mac', '$Request')";
        mysqli_query($con, $b);
        mysqli_query($con, $a);
            echo json_encode(
                array(
                    'Response' => "ACK",
                    // 'Request' => $Request,
                    'Mobile_MAC' => $Mobile_MAC,
                    'Machine_MAC' => $Machine_Mac,
                    'Action' => $Request,
                    'Pos' => $row["position"],
                    'User' => $u_email,
                    'Password' => $u_pass
                )
            );
        }


        }
   else{
            $post_arr = array(
                'Response' => 'NACK',
                'Message' => 'Incorrect Email/Password'
            );
            print_r(json_encode($post_arr));
    }
    
    // Close connection
    mysqli_close($con);

}else{
            echo json_encode(
                  array(
                      'Response' => 'NACK',
                      'Message' => 'Parameters are not set correctly!'
                  )
                );
}

?>