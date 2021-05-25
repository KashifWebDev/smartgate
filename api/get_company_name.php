<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  require '../parts/db.php';


  $data = json_decode(file_get_contents("php://input"));

if(isset($data->id)){
  $query = "SELECT * FROM company WHERE id=$data->id";
  $result = mysqli_query($con, $query);
  $row = mysqli_fetch_assoc($result);
      echo json_encode(
      array(
        'ID' => (int)$row["id"],
        'Name' => $row["name"]
      )
    );

}else{
    echo json_encode(
      array('Message' => 'No Record Found')
    );
}

?>