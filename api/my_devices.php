<?php 

  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  
  require '../parts/db.php';

  $dataa = json_decode(file_get_contents("php://input"));
  // Get ID
  if(isset($dataa->id)){
   $my_array = [];
  $id = $dataa->id;
  // Get post
  $sql = "SELECT * FROM user_and_devices WHERE user_id = $id";
$result = mysqli_query($con, $sql);
$data = mysqli_fetch_assoc($result);
        $post_arr = array(
          'id' => $data['id'],
          'Device_name' => $data['device_name'],
          'Mobile_MAC' => $data['mobile_mac'],
          'Machine_MAC' => $data['machine_mac'],
          'Picture' => $data['device_img']
        );
        array_push($my_array,$post_arr);
 $count=mysqli_num_rows($result);
 // $a=0;
  if($count>0) {
      while($row = mysqli_fetch_assoc($result)){
      	// $a++;
        $post_arr = array(
          'id' => $row['id'],
          'Device_name' => $row['device_name'],
          'Mobile_MAC' => $row['mobile_mac'],
          'Machine_MAC' => $row['machine_mac'],
            'Picture' => $row['device_img']
        );
        array_push($my_array,$post_arr);
//         print_r($post_arr);
        // echo 'Count: '.$a;
    }
  }
else{
    $post_arr = array(
      'Message' => 'Details Invalid!'
    );
}
  
}
else{
  $post_arr = array(
    'Login_Session' => "Parameters not set correctly"
  );
  print_r(json_encode($post_arr));
}
print_r(json_encode($my_array));

?>