<?php

function total_devices($con, $user_id)
{
    $sql = "SELECT * FROM user_and_devices WHERE user_id=$user_id";
    $res = mysqli_query($con, $sql);
    return mysqli_num_rows($res);
}

function total_schedules($con, $user_id)
{
    $sql = "SELECT * FROM schedule WHERE user_id=$user_id";
    $res = mysqli_query($con, $sql);
    return mysqli_num_rows($res);
}

function total_alerts($con, $user_id)
{
    $sql = "SELECT * FROM alert WHERE user_id=$user_id";
    $res = mysqli_query($con, $sql);
    return mysqli_num_rows($res);
}

function total_schedules_mac($con, $mac)
{
    $schedules = "";
    $sql = "SELECT * FROM schedule WHERE machine_mac='$mac'";
    $res = mysqli_query($con, $sql);
    if(mysqli_num_rows($res)){
        while($row = mysqli_fetch_array($res)){
            $schedules .= $row["sch_name"].' ('.date("g:i a", strtotime($row["start_time"])).' ~ '.date("g:i a", strtotime($row["end_time"])).')<br>';
        }
    }else{
        $schedules = "None";
    }
    return $schedules;
}

function total_alerts_mac($con, $user_id)
{
    $sql = "SELECT * FROM alert WHERE user_id='$user_id'";
    $res = mysqli_query($con, $sql);
    return mysqli_num_rows($res);
}

function send_notification($con, $message)
{
    echo "
        <script>
            alert('Message: $message');
        </script>
    ";
    //Get token form db
    $sql = "SELECT * from users WHERE id=" . $_SESSION['id'];
    $query = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($query);
    $tokens = $row["app_token"];


    $url = 'https://fcm.googleapis.com/fcm/send';
    $fields = array(
        'registration_ids' => array($tokens),
        'data' => array('message' => $message)
    );
    $server_key = "AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo";

    $title = "Notification title";
    $notification = array('title' => $title, 'body' => $message, 'sound' => 'default', 'badge' => '1');
    $arrayToSend = array('to' => $tokens, 'notification' => $notification, 'priority' => 'high');
    $fields = json_encode($arrayToSend);

    $payload = [
        'to' => $tokens,
        'notification' => [
            'title' => "Notification form server",
            'body' => $message
        ]
    ];
    $fields = $payload;


    $headers = array(
        'Authorization:key = ' . $server_key,
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
    $result = curl_exec($ch);
    if ($result === FALSE) {
        die('Curl failed: ' . curl_error($ch));
    }

//    echo "My things :p";
//    die($result);exit();


    $input = json_encode(array($headers, $fields));
    $sql1 = "INSERT INTO api_logs (api_input, api_output) VALUES ('$input', '$result')";
//    print_r($sql1);
//    echo "
//        <script>
//            alert('SQL Query: $sql1');
//        </script>
//    ";

    if (!mysqli_query($con, $sql1)) {
        die(mysqli_error($con));
    }


//    echo "
//        <script>
//            alert('API QUERIES: $sql1   ');
//        </script>
//    ";

//    return $result;

    curl_close($ch);
}

function get_timezone($con, $id)
{
    $sql = "SELECT * FROM timezones WHERE id=$id";
    $query = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($query);
    return $row["value"];
}

