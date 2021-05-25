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

if(isset($data->Action) && isset($data->Mobile_MAC) && isset($data->Machine_MAC) && isset($data->Event) && isset($data->Pos)
    && isset($data->Exit)&& isset($data->Buzz))
{
    $res = $data->Action;
    $mobile_mac = $data->Mobile_MAC;
    $mach_mac = $data->Machine_MAC;
    $event = $data->Event;
    $pos = $data->Pos;
    $exit = $data->Exit;
    $buzz = $data->Buzz;
//    $sql = "INSERT INTO machine_req_completeack (action, mobile_mac, machine_mac, Event, Pos, Exitt, Buzz) VALUES ('".$res."', '".$mobile_mac."', '".$mach_mac."', '".$event."', '".$pos."', '".$exit."', '".$buzz."')";
    //print_r($data);
    //echo $count;
    //echo $sql;
//    if(mysqli_query($con, $sql)){
//        echo json_encode(
//            array(
//                'Response' => 'ACK'
//            )
//        );
//    } else{
//        echo json_encode(
//            array(
//                'Response' => 'NACK',
//                'Query' => mysqli_error($con)
//            )
//        );
//    }
        echo json_encode(
            array(
                'Response' => 'ACK'
            )
        );
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