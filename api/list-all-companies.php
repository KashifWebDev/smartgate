<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  require '../parts/db.php';

    $main_array = array();



  $query = "SELECT * FROM company";
  $result = mysqli_query($con, $query);
 while( $row = mysqli_fetch_assoc($result) ){

      $temp_array = array(
        'id' => $row["id"],
        'name' => $row["name"]
      );

      array_push($main_array, $temp_array);


}
  // Turn to JSON & output
    echo json_encode($main_array);
//print_r($main_array);
?>