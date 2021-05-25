<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');


  require '../parts/db.php';
  

  // Instantiate blog post object
  $now = new DateTime();
  $cur_time=$now->format('d-m-Y H:i:s');    
  //echo $cur_time;
  // Get ID


  $data = json_decode(file_get_contents("php://input"));


  //Get ID
if(isset($data->first_name) and isset($data->last_name) and isset($data->email) and isset($data->password) and isset($data->devie_name) and isset($data->mobile_mac) and isset($data->machine_mac) and isset($data->company) ){

  $fname = $data->first_name;
  $lname = $data->last_name;
  $email =$data->email;
  $pass =$data->password;
  $device_name =$data->devie_name;
  $mob_mac =$data->mobile_mac;
  $mac_mac =$data->machine_mac;
  $company =$data->company;

//CHeck for existing email
        $select = mysqli_query($con, "SELECT * FROM users WHERE email = '".$email."'") or exit(mysqli_error($connectionID));
        if(mysqli_num_rows($select)) {
          $post_arr = array(
            'Message' => 'This email is already being used'
          );
          print_r(json_encode($post_arr));
            exit();
            die();
        }
//Starting Inserting Record
    $query="Insert into users (first_name, last_name, email, password, company)
            VALUES ('$fname', '$lname', '$email', '$pass', '$company')";
    if(!mysqli_query($con, $query)){
        //echo '<script>alert("error in first query")';
        echo "error in first query";
    }else{
        //echo "<script>alert('record inserted');</script>";
    }


$userid_abc=$row["id"];
echo $userid_abc;

    $now = new DateTime();
    $cur_time=$now->format('d-m-Y H:i:s');
 

$record_id=mysqli_insert_id($con);

    $query="Insert into user_and_devices (user_id, device_name, machine_mac, mobile_mac, active, date_time)
            VALUES ($record_id, '$device_name', '$mac_mac', '$mob_mac', 1, '$cur_time')";
    if(!mysqli_query($con, $query)){
                $post_arr = array(
                    'Message' => 'Error Occured While registering user',
                    'Flag' => "1",
                    'Err' => mysqli_error($con)
                  );
    }else{
                $post_arr = array(
                    'Message' => 'User Created Successfully'
                  );
    }

print_r(json_encode($post_arr));
//End Inserting Record


}
else{
  $post_arr = array(
    'Message' => 'Parameters not set correctly!'
  );
  print_r(json_encode($post_arr));
}