<?php
  require '../config/config.php';
 $data_array = array();
// Check connection
$sql = "SELECT * FROM alive_status";
$result = mysqli_query($con, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $temp_array = array(
            'id' => $row['id'],
            'Mac' => $row['mac'],
            'Status' => $row['device_status'],
            'DateTime' => $row['date_time']
          );
          array_push($data_array, $temp_array);
    }
    echo json_encode($data_array);
} else {
    $post_arr = array(
        'Message' => 'No Devies Found'
    );
    print_r(json_encode($post_arr));
}

mysqli_close($con);
?>