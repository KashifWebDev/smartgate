<?php
    $page_title="Register A New Device";
    $current_page="Register New Device" ;
    require 'common.php';
?>

<?php
$flag=FALSE;
if(isset($_POST["add-device"])){
    $user=$_POST["user"];
    $device=$_POST["device"];
            $sql="INSERT INTO user_and_devices (email, mac, active) VALUES ('$user', '$device' ,1)";
            if (mysqli_query($con, $sql)) {
                echo "<script>alert('New Device Assigned Successfully!');document.location = 'add.php';</script>
                 ";
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($con);
            }
}
?>

<div class="container">
            <div class="card card-register mx-auto mt-5">
            <div class="card-header text-center" id="top-nav-font">Add New Device</div>
            <div class="card-body">

            <form method="post" action="">
            <div class="form-group">
                <label for="sel1">Select User</label>
                <select class="form-control" id="sel1" name="user">
                    <option>Select Users</option>
                    <?php
                        $query = "SELECT * FROM users";
                        $val=mysqli_query($con,$query);
                        /* fetch associative array */
                        while ($row=mysqli_fetch_array($val)) {
                            echo '<option value="'.$row['email'].'" >'.$row['first_name'].' '.$row['last_name'].' ('.$row['email'].')</option>';
                        }
                    ?>
                </select>
            </div>
                <div class="form-group">
                    <label for="sel1">Select Device</label>
                    <select class="form-control" id="sel1" name="device">
                        <option>Select Users</option>
                        <?php
                        $query = "SELECT DISTINCT mac FROM alive_status";
                        $val=mysqli_query($con,$query);
                        /* fetch associative array */
                        while ($row=mysqli_fetch_array($val)) {
                            echo '<option value="'.$row['mac'].'" >'.$row['mac'].'</option>';
                        }
                        ?>
                    </select>
                </div>
                <button class="btn btn-primary btn-block" type="submit" name="add-device" id="nav-font">Register</button>


          </form>
<?php
  $flag=FALSE;
    if(isset($_POST["add-device"])){
        $device_name=$_POST["device-name"];
        $device_mac=$_POST["device-mac"];
        $device_sysid=$_POST["device-sysid"];
        $device_lat=$_POST["lat"];
        $device_lng=$_POST["lng"];
        if(isset($_FILES['image'])){
          $errors= array();
          $file_name = $_FILES['image']['name'];
          $file_size =$_FILES['image']['size'];
          $file_tmp =$_FILES['image']['tmp_name'];
          $file_type=$_FILES['image']['type'];
          $file_ext=strtolower(end(explode('.',$_FILES['image']['name'])));
          
          $extensions= array("jpeg","jpg","png");
          
          if(in_array($file_ext,$extensions)=== false){
            $flag=TRUE;
             echo '<script>alert("extension not allowed, please choose a JPEG or PNG file.");</script>';
          }
          
          if($file_size > 2097152){
            $flag=TRUE;
             echo '<script>alert("File size must be excately 2 MB");</script>';
          }
          
          if(!$flag){
             $file_name = substr($file_name, 0, 5);
             $file_name=$file_name."_".rand(1, 1000);
             $file_name=str_replace(".","",$file_name);
             $file_name=$file_name.".".$file_ext;
             move_uploaded_file($file_tmp,"images/devices/".$file_name);
             //echo "Success";
             $sql="INSERT INTO devices (name,mac,system_id,thumbnail,lat,lng) VALUES ('$device_name','$device_mac','$device_sysid','$file_name', '$device_lat', '$device_lng')";
             if (mysqli_query($con, $sql)) {
                 echo "<script>alert('New Device Added Successfully!');document.location = 'devices.php';</script>
                 ";
             } else {
                 echo "Error: " . $sql . "<br>" . mysqli_error($con);
             }
          }else{
            echo "<script>alert('Error Occured  Try Again');</script>";
          }
       }
    }
?>
                <!--
                <div class="text-center">
                <a class="d-block small mt-3" href="login.html">Login Page</a>
                <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
                </div>
                -->
            </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <?php require 'parts/footer.php'; ?>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>

</body>

</html>    <script>
    // This example adds a search box to a map, using the Google Place Autocomplete
    // feature. People can enter geographical searches. The search box will return a
    // pick list containing a mix of places and predicted search terms.

    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

    function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('google_map'), {
            center: {lat: -33.8688, lng: 151.2195},
            zoom: 13,
            mapTypeId: 'roadmap'
        });

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
            searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }

            // Clear out the old markers.
            markers.forEach(function(marker) {
                marker.setMap(null);
            });
            markers = [];

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();

            places.forEach(function(place) {
                if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                var lat_val = place.geometry.location.lat();
                var lng_val = place.geometry.location.lng();
                console.log("Lat: "+lat_val+"\nLong: "+lng_val);
                document.getElementById("area_lat").value = lat_val;
                document.getElementById("area_lng").value = lng_val;
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                // Create a marker for each place.
                markers.push(new google.maps.Marker({
                    map: map,
                    icon: icon,
                    title: place.name,
                    position: place.geometry.location
                }));

                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });




    }



</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUBvIQ5yNJkBmL8lOtVr44tzLmT2d1Hh8&libraries=places&callback=initAutocomplete"
        async defer></script>