<?php 

  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  
  require '../parts/db.php';

  $dataa = json_decode(file_get_contents("php://input"));
  // Get ID
  if(isset($dataa->id) and isset($dataa->token)){

  $id = $dataa->id;
  $token =$dataa->token;
  // Get post
  $sql = "UPDATE users SET app_token='$token' WHERE id=$id";
  if(mysqli_query($con, $sql)){
      $post_arr = array(
          'Message' => "Token updated!"
      );
  }
else{
    $post_arr = array(
      'Message' => 'Error Occured while while updating token',
        'Err' =>  mysqli_error($con)
    );
}
  
}
else{
  $post_arr = array(
    'Message' => "Parameters not set correctly"
  );
//  print_r(json_encode($post_arr));
}
print_r(json_encode($post_arr));

?>