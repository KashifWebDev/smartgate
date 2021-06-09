<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

require '../parts/db.php';
//require '../parts/startup.php';
require '../functions.php';


// Instantiate blog post object
$now = new DateTime();
$cur_time=$now->format('d-m-Y H:i:s');
//echo $cur_time;
// Get ID


$data = json_decode(file_get_contents("php://input"));

//print_r($data);die();

if(isset($data->Action) && isset($data->Mobile_MAC) && isset($data->Machine_MAC) && isset($data->Event) && isset($data->Pos)
    && isset($data->Exit)&& isset($data->Buzz) && isset($data->Relay))
{
    $device_action = $data->Action;
    $mobile_mac = $data->Mobile_MAC;
    $mach_mac = $data->Machine_MAC;
    $event = $data->Event;
    $pos = $data->Pos;
    $exit = $data->Exit;
    $buzz = $data->Buzz;
    $relay = $data->Relay;


//    $a = "UPDATE user_and_devices SET server_request='' WHERE machine_mac='$mach_mac'";
//    mysqli_query($con, $a);

    $aa = "SELECT * FROM user_and_devices WHERE machine_mac='$mach_mac'";
    $bb = mysqli_query($con, $aa);
    $row = mysqli_fetch_array($bb);
    device_current_time($row['timezone']);
//    date_default_timezone_set("Asia/Karachi");


    $time_now = date('Y-m-d H:i:s');  //Just for database data_time record



    $sql = "SELECT * FROM alert WHERE machine_mac= '$mach_mac'";
//    echo $sql;die();
    $res = mysqli_query($con, $sql);
    if(mysqli_num_rows($res)){
        $row = mysqli_fetch_assoc($res);
        $start_time = $row["start_time"];
        $end_time = $row["end_time"];
        $start_date = $row["start_date"];
        $end_date = $row["end_date"];
        // ============= For TIme
        $time = "2019-12-08";

//        die(get_timezone_from_mac($con, $mach_mac ));
        ////  SETTING TIME ZONE
//        echo "trying";
//        echo get_timezone_from_mac($con, $mach_mac );
//         die();exit();

        date_default_timezone_set(get_timezone_from_mac($con, $mach_mac ));

        //$date = date('m/d/Y h:i:s a', time());
        $start_time = date("h:i:s a", strtotime($start_time));
        $end_time = date("h:i:s a", strtotime($end_time));
        $current_time = date('h:i:s a', time());
        $current_date = date('Y-m-d', time());

        if($row["delta_time_alert"]=="ON"){
            $orignalTime = date('Y-m-d H:i:s');
            $orignal_minus_20mnts = date('Y-m-d H:i:s',strtotime('-20 minutes',strtotime($orignalTime)));
            $orignal_minus_21mnts = date('Y-m-d H:i:s',strtotime('-21 minutes',strtotime($orignalTime)));
            $sql_query = "SELECT * FROM machine_req_completeack WHERE 
                            date_time >= '$orignal_minus_21mnts' AND date_time <= '$orignal_minus_20mnts'";
//            echo $sql_query;
            $sql_res = mysqli_query($con, $sql_query);
            $sql_row = mysqli_fetch_array($sql_res);
//            echo "Delta is on     relay: ".$sql_row["relay"]."   pos: ".$sql_row["Pos"];
//            die();exit();
            $orignalTime = date('Y-m-d H:i:s');
            if(($sql_row["relay"]=="Hi" || $sql_row["Pos"]=="Hi") && $row["delta_time_alert_sent"]!=true){
                $u_name = get_user_name($con, $mach_mac);
                $email = get_email($con, $mach_mac);
                $device_name = get_device_name($con, $mach_mac);
                $msg = "Relay/Position Input is been high from 20 minutes";
                $body = "Hi $u_name,\n
                    \t $device_name Relay/Position is high from 20minutes!
                    \nThis is an autogenerated email!\n\n
                    Regards,
                    MyGate Server";
                send_alert_app_email($con, $msg, $body, $email, $u_name, $mach_mac);
                $s = "UPDATE alert SET delta_time_alert_sent=1 WHERE machine_mac = '$mach_mac'";
                mysqli_query($con, $s);
            }
        }


        $relay_from_db = $row["relay"];
        $pos_from_db = $row["positions"];
//        echo $relay_from_db.' ! '.$pos_from_db; exit();die();
        if(($relay_from_db==$relay || $pos_from_db==$pos) && $row["relay_pos_alert_sent"]!=1){
            $u_name = get_user_name($con, $mach_mac);
            $email = get_email($con, $mach_mac);
            $device_name = get_device_name($con, $mach_mac);
            $msg = $row["relay"]==$relay ? "Relay Alert! Relay is $relay_from_db" : "Position Alert! Position is $pos_from_db";
            $body = "Hi $u_name,\n
                    \t $device_name relay and Position input are mentioned below:\n
                    Relay:      $relay_from_db\n
                    Position:   $pos_from_db\n
                    \nThis is an autogenerated email!\n\n
                    Regards,
                    MyGate Server";
            send_alert_app_email($con, $msg, $body, $email, $u_name, $mach_mac);
            $s = "UPDATE alert SET relay_pos_alert_sent=1 WHERE machine_mac = '$mach_mac'";
            mysqli_query($con, $s);
        }



        if(($start_time < $current_time || $start_time == $current_time) &&
            ($end_time > $current_time || $end_time == $current_time) &&
            ($start_date < $current_date || $start_date == $current_date) &&
            ($end_date > $current_date || $end_date == $current_date)){

                session_start();
                $_SESSION['id'] = get_user_id($con, $mach_mac);
                $alert_status = alert_status($con, $mach_mac);


                if($relay=="Hi"){
                    $device_name = get_device_name($con, $mach_mac);
                    $u_name = get_user_name($con, $mach_mac);
                    $email = get_email($con, $mach_mac);
                    $msg = "Open Relay Alert! for $device_name";
                    if(!$alert_status) send_alert_app_email($con, $msg, '', $email, $u_name, $mach_mac);
                }
                if($pos=="Hi"){
                    $device_name = get_device_name($con, $mach_mac);
                    $u_name = get_user_name($con, $mach_mac);
                    $email = get_email($con, $mach_mac);
                    //$msg = "Position Input Hi Alert! for $device_name";
                    $msg = "$device_name is Open (Position Hi)";
                    if(!$alert_status) send_alert_app_email($con, $msg, '', $email, $u_name, $mach_mac);
                }
        }
    }

//echo "--".$data->Action."--";die();


    $sql = "INSERT INTO machine_req_completeack (action, mobile_mac, machine_mac, Event, Pos, Exitt, Buzz, relay, date_time) VALUES
                    ('$device_action', '$mobile_mac', '$mach_mac', '$event', '$pos', '$exit',
                    '$buzz.', '$relay', '$time_now')";
    $sql1 = "UPDATE user_and_devices SET relay_from_api='$relay' WHERE machine_mac='$mach_mac'";
    mysqli_query($con, $sql1);
    //print_r($data);
    //echo $count;
    //echo $sql;
    if(mysqli_query($con, $sql)){
        echo json_encode(
            array(
                'Response' => 'ACK'
            )
        );
    } else{
        echo json_encode(
            array(
                'Response' => 'NACK',
                'Query' => mysqli_error($con)
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

function device_current_time($timezone){
    date_default_timezone_set($timezone);
}
function send_alert_app_email($con, $msg, $body, $email, $u_name, $mach_mac)
{
    if($body=='') $body = $msg;
    send_mail($con, $msg, $email, $u_name);
    send_notification($con, $msg);
    $sql = "UPDATE alert SET alert_sent=1 WHERE machine_mac='$mach_mac'";
    mysqli_query($con, $sql);
}
function get_device_name($con, $mac){
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["device_name"];
}
function get_user_id($con, $mac){
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["user_id"];
}
function get_email($con, $mac){
    $sql = "SELECT * FROM alert WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["email"];
}
function get_user_name($con, $mac){
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    $uid = $row["id"];
    $sql2 = "SELECT * FROM users WHERE id= $uid";
//    return $sql;
    $res2 = mysqli_query($sql2);
    $row2 = mysqli_fetch_array($res2);
    return $row2["first_name"].' '.$row2["last_name"];
}
function send_mail($con, $title, $email, $u_name){
//    $title = "Open Relay Alert! for device $device_name";
    send_notification($con, $title);
    date_default_timezone_set("Asia/Karachi");
    $time_of_mail = date("M d,Y h:i:s a");

    $msg = "Hi $u_name,\n
            $title
             Time: $time_of_mail.\n
            You Can't reply on this auto generated email!\n\n
            Regards,\nMyGate Server";
    $msg = wordwrap($msg,70);

    // send email
    if($email!="") mail($email,$title,$msg);
}
function alert_status($con, $mac){
    $sql = "SELECT * FROM alert WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["alert_sent"];
}
function get_timezone_from_mac($con, $mac){
    $sql = "SELECT * FROM user_and_devices WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return get_timezone($con, $row["timezone"]);
}
?>