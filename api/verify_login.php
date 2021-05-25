<?php 

  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  
  require '../parts/db.php';

  $dataa = json_decode(file_get_contents("php://input"));
  // Get ID
  if(isset($dataa->email) and isset($dataa->password) and isset($dataa->company) ){

  $myusername = $dataa->email;
  $mypassword =$dataa->password;
  $company =$dataa->company;
  // Get post
  $sql = "SELECT * FROM users WHERE email = '".$myusername."' and password = '".$mypassword."' and company=$company";
$result = mysqli_query($con, $sql);
$data = mysqli_fetch_array($result);
 $count=mysqli_num_rows($result);
 $row = mysqli_fetch_array($result);

 if($row["user_type"]=="guest"){
     $lname = '';
 }else{
     $lname = $data['last_name'];
 }

  if($count>0) {
    $post_arr = array(
      'Login_Session' => TRUE,
      'id' => $data['id'],
      'First_name' => $data['first_name'],
      'Last Name' => $lname,
//      'Country' => $data['country'],
      'Picture' => $data['image'],
      'Email' => $data['email'],
      'Password' => $data['password'],
      'Company' => $data['company']
    );
  }
else{
    $post_arr = array(
      'Message' => 'Login Details Invalid!'
    );
}
  
}
else{
  $post_arr = array(
    'Login_Session' => "Parameters not set correctly"
  );
//  print_r(json_encode($post_arr));
}
print_r(json_encode($post_arr));

?>