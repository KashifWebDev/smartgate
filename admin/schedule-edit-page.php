<?php
    $page_title="Schedules";
    $current_page="Reports" ;
    require 'common.php';
    $uid = $_POST["userid"];

    $return_page=$_GET["return_page"];
$id = $_GET["id"];
$id=mysqli_real_escape_string($con, $id);
$id=trim($id);
$sch_id = $id;

$sql = "SELECT * FROM schedule WHERE id=$id";
$res = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($res);



$sql= "Select * FROM user_and_devices WHERE user_id=".$row["user_id"];
//echo $sql;
$result = mysqli_query($con, $sql);
$row1 = mysqli_fetch_assoc($result);
$current_user_id = $row1["user_id"];
//echo "CurrentID: ".$current_user_id;
$current_device_name=$row1["device_name"];
$current_mobile_mac=$row1["mobile_mac"];
$current_machine_mac=$row1["machine_mac"];

?>


<?php include 'parts/db.php'; ?>


<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header text-center" id="top-nav-font">Device Schedules</div>
        <div class="card-body">
            <!-- Information about device -->
            <div class="form-group">
                <label for="email" id="top-nav-font">Device Name:</label>
                <input id="nav-font" type="text" value="<?php echo $current_device_name; ?>" class="form-control" id="email" disabled>
            </div>
            <div class="form-group">
                <label for="email" id="top-nav-font">Machine Mac:</label>
                <input id="nav-font" type="text" value="<?php echo $current_machine_mac; ?>" class="form-control" id="email" disabled>
            </div><hr>

            <form method="post" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="email" id="top-nav-font">Schedule Name:</label>
                    <input id="nav-font" type="text " class="form-control" value="<?php echo $row["sch_name"]; ?>" id="email" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email" id="top-nav-font">Start Date:</label>
                    <input id="nav-font" type="date" class="form-control" id="email" name="startdate" value="<?php echo $row["start_date"]; ?>" required>
                </div>
                <div class="form-group">
                    <label for="email" id="top-nav-font">End Date:</label>
                    <input id="nav-font" type="date" class="form-control" id="email" name="enddate" value="<?php echo $row["end_date"]; ?>" required>
                </div>
                <div class="form-group">
                    <label for="email" id="top-nav-font">Start Time:</label>
                    <input id="nav-font" type="time" class="form-control" name="start_time" value="<?php $date = date("H:i", strtotime($row['start_time'])); echo "$date"; ?>" required>
                </div>
                <div class="form-group">
                    <label for="email" id="top-nav-font">End Time:</label>
                    <input id="nav-font" type="time" class="form-control" name="end_time" value="<?php $date = date("H:i", strtotime($row['end_time'])); echo "$date"; ?>" required>
                </div>
                <div class="form-group">
                    <label for="pwd" id="top-nav-font" style="display: flex;">Relay Operation:</label>
                    <select id="nav-font" class="form-control" name="relay">
                        <option value="Momentary" <?php if($row["relay"]=="Momentary"){echo "selected";} ?>>Momentary</option>
                        <option value="Latch" <?php if($row["relay"]=="Latch"){echo "selected";} ?>>Latch</option>
                        <option value="UnLatch" <?php if($row["relay"]=="UnLatch"){echo "selected";} ?>>UnLatch</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="pwd" id="top-nav-font" style="display: flex;">Days of Week: <p style="margin-left: 1%;font-weight: 100;">(Ctrl+click to select multiple)</p></label>
                    <select id="nav-font" class="form-control" name="weekdays[]" multiple="multiple" style="height: 140px;">
                        <option value="mon">Monday</option>
                        <option value="tue">Tuesday</option>
                        <option value="wed">Wednesday</option>
                        <option value="thu">Thursday</option>
                        <option value="fri">Friday</option>
                        <option value="sat">Saturday</option>
                        <option value="sun">Sunday</option>
                    </select>
                </div>
                <button class="btn btn-primary btn-block" type="submit" name="add-schedule" id="nav-font">Save Schedule</button>


            </form>
            <?php
            if(isset($_POST["add-schedule"])){
                $name=$_POST["name"];
                $relay=$_POST["relay"];
                $start_date=$_POST["startdate"];
                $end_date=$_POST["enddate"];
                $start_time = $_POST["start_time"];
                $end_time = $_POST["end_time"];
                $week_days = $_POST["weekdays"];

                $days="";
                if ($week_days){
                    foreach ($week_days as $t){ $days = $t.','.$days; }
                }

                $connectionID = $con;
                $select = mysqli_query($connectionID, "SELECT * FROM schedule WHERE sch_name = '".$name."'") or exit(mysqli_error($connectionID));
                if(mysqli_num_rows($select)) {
                    $link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
                    echo '
                                <script>
                                  alert("Schedule Name is already being used");
                                  window.location.replace("'.$link.'");
                                </script>
                            ';
                }

                $sql="UPDATE schedule SET sch_name='$name', relay='$relay', user_id=$current_user_id,mobile_mac='$current_mobile_mac', machine_mac='$current_machine_mac', start_date='$start_date', 
                                        end_date='$end_date', start_time='$start_time', end_time='$end_time', weekday='$days'
                                        WHERE id=$sch_id";
                if (mysqli_query($con, $sql)) {
                    echo "<script>alert('Schedule updated Successfully!');document.location = '".$return_page."';</script>
                 ";
                } else {
                    echo "Error: " . $sql . "<br>" . mysqli_error($con);
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