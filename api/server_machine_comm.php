<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: POST');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  require '../parts/db.php';
  require '../functions.php';

  $data = json_decode(file_get_contents("php://input"));

  if(isset($data->Machine_MAC) && isset($data->Action) && isset($data->Event) && isset($data->Pos) && isset($data->Relay))
{
    $Machine_Mac = $data->Machine_MAC;
    $Action = $data->Action;
    $event = $data->Event;
    $pos = $data->Pos;
    $relay = $data->Relay;
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='".$Machine_Mac."'";
    $result = mysqli_query($con, $sql);
    $data = mysqli_fetch_array($result);
    $count=mysqli_num_rows($result);



    date_default_timezone_set(get_timezone_from_mac($con, $Machine_Mac ));
      $daylight_status = daylight($con, $Machine_Mac);


    if($data["relay"]=="None"){
        $post_arr = array(
            'Response' => 'NACK',
            'Message' => 'Relay is set to None. No Open/Hold/Close requests will be performed.'
        );
        print_r(json_encode($post_arr));
        die();exit();
    }

    
            $qury="UPDATE user_and_devices SET position='$pos', event='$event', relay_from_api='$relay' WHERE machine_mac='".$Machine_Mac."'";
            $a =mysqli_query($con,$qury);
    
     $a = "SELECT * FROM users WHERE id=".$data["user_id"];
     //echo $a;
     $b = mysqli_query($con, $a);
     $c = mysqli_fetch_assoc($b);
     //print_r($c);
     if(mysqli_num_rows($b)){
     $email = $c["email"];
     $password = $c["password"];
     $schedule_exists = false;
   }else{
            $post_arr = array(
                'Response' => 'NACK',
                'Message' => 'Invalid MAC! No user was found against this MAC'
            );
            print_r(json_encode($post_arr));
            exit();die();
   }

    $sql = "SELECT * FROM schedule WHERE machine_mac='".$Machine_Mac."'";
    $result = mysqli_query($con, $sql);
    if(mysqli_num_rows($result)) {
        $schedule_exists=true;
        $schedule = $row = mysqli_fetch_array($result);
        $time_condition = $date_condition = false;

        $schedule_open_rqst = $schedule["request_send_open"];
        $schedule_close_rqst = $schedule["request_send_close"];

        $start_time = $row["start_time"];
        $end_time = $row["end_time"];
        $start_date = $row["start_date"];
        $end_date = $row["end_date"];
        // ============= For TIme
        $time = "2019-12-08";
        $start_time = date("h:i:s a", strtotime($start_time));
        $end_time = date("h:i:s a", strtotime($end_time));
        $current_time = date('h:i:s a', time());
        $current_date = date('Y-m-d', time());

        $start_time = strtotime($start_time);
        $end_time = strtotime($end_time);
        $current_time = strtotime($current_time);

        if($daylight_status){
            if(date("m/d") >= "3/8" && date("m/d") < "11/1"){
                $current_time = date('h:i:s a', strtotime('+1 hour'));
            }
        }



        //=============  For Date
        $current_date = date('Y-m-d', time());
        //======================== Listing all
//        echo 'Start Time: ' . $start_time . '<br>';
//        echo 'End Time: ' . $end_time . '<br>';
//        echo 'Start Date: ' . $start_date . '<br>';
//        echo 'End Date: ' . $end_date . '<br>';
//        echo 'Current Time: ' . $current_time . '<br>';
//        echo 'Current Date: ' . $current_date . '<br>';
/**/

        $date_condition = $date_condition = false;
        if (($start_time < $current_time) && ($end_time > $current_time) ) {
//            echo '<br> TIme Condition Matched!';
            $time_condition = true;
        } else {
            //send mail for an unauthorised request for invalid time
        }
        if (($start_date < $current_date || $start_date == $current_date)
            && ($end_date > $current_date || $end_date == $current_date)) {
//            echo '<br> Date Condition Matched!';
            $date_condition = true;
        }
        else {
            $date_condition = $date_condition = false;
            //send mail for an unauthorised request for invalid date
        }
    }
$time_condition = true;

    //print_r($data);
    //echo $count;

    //Check for guest schedules
    $sql = "SELECT * FROM schedule_guest WHERE machine_mac='".$Machine_Mac."'";
    $result_guest = mysqli_query($con, $sql);
    if(mysqli_num_rows($result_guest)) {
        $schedule_guests = mysqli_fetch_array($result_guest);

        $start_time = $schedule_guests["start_time"];
        $end_time = $schedule_guests["end_time"];
        $start_date = $schedule_guests["start_date"];
        $end_date = $schedule_guests["end_date"];
        // ============= For TIme
        $time = "2019-12-08";
        $start_time = date("h:i:s a", strtotime($start_time));
        $end_time = date("h:i:s a", strtotime($end_time));
        $current_time = date('h:i:s a', time());
        $current_date = date('Y-m-d', time());

        $start_time = strtotime($start_time);
        $end_time = strtotime($end_time);
        $current_time = strtotime($current_time);


        $date_condition = $date_condition = false;
        if (($start_time < $current_time) && ($end_time > $current_time) ) {
//            echo '<br> TIme Condition Matched!';
            $time_condition = true;
        } else {
            //send mail for an unauthorised request for invalid time
        }
        if (($start_date < $current_date || $start_date == $current_date)
            && ($end_date > $current_date || $end_date == $current_date)) {
//            echo '<br> Date Condition Matched!';
            $date_condition = true;
        }
        else {
            $date_condition = $date_condition = false;
            //send mail for an unauthorised request for invalid date
        }
    $action_guest = "";
        $schedule_open_rqst = $schedule_guests["request_send_open"];
        $schedule_close_rqst = $schedule_guests["request_send_close"];


        if($schedule_guests["event"]=="off"){
            $action_guest = "";
        }
        if($schedule_guests["event"]=="on"){ //Set the action here
            if($current_time > $start_time && $current_time < $end_time  && !$schedule_open_rqst){
                // For Open/Close Schedule
//                echo "currently setting the action to $action";
                    $qury="UPDATE user_and_devices SET server_request='Open' WHERE machine_mac='".$Machine_Mac."'";
                    $qury1="UPDATE schedule_guest SET request_send_open=1 WHERE machine_mac='".$Machine_Mac."'";
                    mysqli_query($con,$qury);
                    mysqli_query($con,$qury1);
            }
            if ($current_time > $end_time && !$schedule_close_rqst){
                // set request to CLOSE;
//                echo "currently setting the action to Close(hardcoded)";
                $qury="UPDATE user_and_devices SET server_request='Close' WHERE machine_mac='".$Machine_Mac."'";
                $qury1="UPDATE schedule_guest SET request_send_close=1 WHERE machine_mac='".$Machine_Mac."'";
                mysqli_query($con,$qury);
                mysqli_query($con,$qury1);
            }
        }

    } //End of guest schedule exists


    //Check for normal users schedules
    if($count>0){
        if($schedule_exists && $date_condition && $time_condition){
//            echo "schedule Exists!";
            // if relay is momentary, no close requests will be sent
            if($data["relay"]=="Momentary"){
                $action="Open";
            }
            // if relay is unlatched, no open/hold requests will be sent
            if($data["relay"]=="Unlatch"){
                $action="Close";
            }
            // if relay is none, no commands requests will be sent
            if($data["relay"]=="Latch"){
                $action=$Action;
                $action='Hold';
            }
            //If Event Is Hi, no action will be performed
            if($schedule["event"] =="Hi"){
                $action="";
            }
//            //If Event Is low, no action will be performed
//            if($schedule["positions"] =="off"){
//                $action="";
//            }



            if($current_time > $start_time && $current_time < $end_time  && !$schedule_open_rqst){
                // For Open/Close Schedule
//                echo "currently setting the action to $action";
                    if($action!="" && !empty($action)){
                    $qury="UPDATE user_and_devices SET server_request='$action' WHERE machine_mac='".$Machine_Mac."'";
                    $qury1="UPDATE schedule SET request_send_open=1 WHERE machine_mac='".$Machine_Mac."'";
                    mysqli_query($con,$qury);
                    mysqli_query($con,$qury1);
                }
            }
            if ($current_time > $end_time && !$schedule_close_rqst){
            // set request to CLOSE;
//                echo "currently setting the action to Close(hardcoded)";
            $qury="UPDATE user_and_devices SET server_request='Close' WHERE machine_mac='".$Machine_Mac."'";
            $qury1="UPDATE schedule SET request_send_close=1 WHERE machine_mac='".$Machine_Mac."'";
            mysqli_query($con,$qury);
            mysqli_query($con,$qury1);
            }

            $qury="SELECT * FROM user_and_devices WHERE machine_mac='".$Machine_Mac."'";
            $a =mysqli_query($con,$qury);

            $qury="UPDATE user_and_devices SET position_input='$pos', event='$event', relay_from_api='$relay'
                     WHERE machine_mac='$Machine_Mac'";
            mysqli_query($con,$qury);
//            echo $a.'--'.$qury;

            $b = mysqli_fetch_array($a);
            $rqst = $b["server_request"];
            $alarm = $data["alarm"];
            if($data["alarm"]=="none")
                $alarm = 0;
            if($data["relay"]=="Momentary") {
                echo json_encode(
                    array(
                        'Request' => $rqst, //$data["server_request"], // Change server_rqeust to action for mobile requests
                        'Event' => $schedule["event"],
                        'Pos' => $data["position_input"],
                        'Exit' => 'ON',   //Dummy
                        'Relay' => $data["momentary_time"],
                        'Buzz' => $data["alarm"],
                        'Mobile_MAC' => $data["mobile_mac"],
                        'Machine_MAC' => $data["machine_mac"],
                        'User' => $email,
                        'Password' => $password
                    )
                );
            }
            elseif($data["relay"]=="Latch") {
                echo json_encode(
                    array(
                        'Request' => $rqst, //$data["server_request"], // Change server_rqeust to action for mobile requests
                        'Event' => $schedule["event"],
                        'Pos' => $data["position_input"],
                        'Exit' => 'ON',   //Dummy
                        'Relay' => 0,
                        'Buzz' => $data["alarm"],
                        'Mobile_MAC' => $data["mobile_mac"],
                        'Machine_MAC' => $data["machine_mac"],
                        'User' => $email,
                        'Password' => $password
                    )
                );
            }
            else{
                echo json_encode(
                    array(
                        'Request' => $rqst, //$data["server_request"], // Change server_rqeust to action for mobile requests
                        'Event' => $schedule["event"],
                        'Pos' => $data["position_input"],
                        'Exit' => 'ON',   //Dummy
                        'Relay' => $data["relay"],
                        'Relay' => $data["relay"],
                        'Buzz' => $alarm,
                        'Mobile_MAC' => $data["mobile_mac"],
                        'Machine_MAC' => $data["machine_mac"],
                        'User' => $email,
                        'Password' => $password
                    )
                );
            }
        }
        else{
//            echo "here in else";

//            $alarm = $data["momentary_time"];
            //print_r($data);

            if($data["relay"]=="Momentary") {
//                echo "in momentary";
                echo json_encode(
                    array(
                        'Request' => $data["server_request"], // Change server_rqeust to action for mobile requests
                        'Event' =>  'Lo', //$schedule["event_server"],
                        'Pos' => $data["position_input"],
                        'Exit' => 'OFF',   //Dummy
                        'Relay' => $data["momentary_time"],
                        'Buzz' => $data["alarm"],
                        'Mobile_MAC' => $data["mobile_mac"],
                        'Machine_MAC' => $data["machine_mac"],
                        'User' => $email,
                        'Password' => $password
                    )
                );
            }
            if($data["relay"]=="Latch") {
                $new_action = $data["server_request"];
//                if($data["server_request"]=="Open"){
//                    $new_action = "Hold";
//                }
//                echo "in Latch";
//                print_r($data);
                echo json_encode(
                    array(
                        'Request' =>  $new_action, // Change server_rqeust to action for mobile requests
                        'Event' => 'Lo',
                        'Pos' => $data["position_input"],
                        'Exit' => 'ON',   //Dummy
                        'Relay' => 0,
                        'Buzz' => $data["alarm"],
                        'Mobile_MAC' => $data["mobile_mac"],
                        'Machine_MAC' => $data["machine_mac"],
                        'User' => $email,
                        'Password' => $password
                    )
                );
            }
            else{
//                echo "in final";
                echo json_encode(
                    array(
                        'Request' => $data["server_request"], // Change server_rqeust to action for mobile requests
                        'Event' => 'Lo',
                        'Pos' => $data["position_input"],
                        'Exit' => 'OFF',   //Dummy
                        'Buzz' => $data["alarm"],
                        'Relay' => $data["relay"],
                        'Mobile_MAC' => $data["mobile_mac"],
                        'Machine_MAC' => $data["machine_mac"],
                        'User' => $email,
                        'Password' => $password
                    )
                );
            }


        }
    } else{
            $post_arr = array(
                'Response' => 'NACK',
                'Message' => 'No Data returned from Database!'
            );
            
        print_r(json_encode($post_arr));
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


function success_msg($req, $mobile_mac, $mach_mac){
    echo json_encode(
      array(
          'Response' => 'ACK',
          'Mobile_MAC' => $mobile_mac,
          'Machine_MAC' => $mach_mac
      )
    );
  }

function get_timezone_from_mac($con, $mac){
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return get_timezone($con, $row["timezone"]);
//    return "Asia/Karachi";
}
function daylight($con, $mac){
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["daylight_saving"];
}


?>