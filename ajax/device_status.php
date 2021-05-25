<?php
require "../parts/db.php";

if(isset($_POST["mac"])){
    $m = $_POST["mac"];
    $sql = "SELECT * FROM machine_req_completeack where machine_mac='$m' ORDER BY id DESC LIMIT 1;";
//    $sql = "SELECT * FROM user_and_devices where machine_mac='$m'";
    //echo "query: ".$sql."<br>";
    $res = mysqli_query($con, $sql);
    if(mysqli_num_rows($res)){
        $row = mysqli_fetch_array($res);
        $id = $row["id"];
        $db_time = $row['date_time'];
//        echo "CurrentID: ".$id."     Full time: ".$db_time."<br><br>";
        $date_time = explode(" ", $row["date_time"]);
        $date_time = $date_time[1];



        $aa = "SELECT * FROM user_and_devices WHERE machine_mac='$m'";
        $bb = mysqli_query($con, $aa);
        $row = mysqli_fetch_array($bb);
        device_current_time($row['timezone']);

        $now = new DateTime();
        $cur_time=$now->format('H:i:s');

        $plustime = date("H:i:s", (strtotime($date_time) + 40));
//        echo 'Current: '.$cur_time.'<br>'.'Database: '.$date_time.'<br>'.'+10sec: '.$plustime;

        if($plustime>$cur_time){
//            echo "yes";
            echo '<span class="active_status_online">Online</span>';
        }else{
            echo '<span class="active_status_offline">Offline</span>';
        }
    }else{
        echo '<span class="active_status_offline">Offline</span>';
//        echo '<span class="active_status_offline">Data Not Found</span>';
    }
}
else{
    echo '<span class="active_status_offline">MAC not found</span>';
}

function device_current_time($timezone){
    date_default_timezone_set($timezone);
}

?>