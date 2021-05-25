<?php
    $page_title="Schedules";
    $current_page="Reports" ;
    require 'common.php';
    $uid = $_GET["userid"];
?>



<?php include 'parts/db.php'; ?>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        All Schedule Records</div>
    <?php
    session_start();
    //$uid = $_SESSION["id"];
    //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
    $sql = "SELECT * FROM schedule WHERE user_id=$uid";
    $result = mysqli_query($con, $sql);

    ?>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Schedule Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>WeekDay</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Schedule Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>WeekDay</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <?php
                $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while($row = mysqli_fetch_assoc($result)) {
                        $id=$row["user_id"];
                        echo '
        <tr class="odd gradeX" id="device-view-font">
            <td>'.$row["sch_name"].'</td>
            <td>'.date("d-M,Y", strtotime($row["start_date"])).' ~ '.date("d-M,Y", strtotime($row["end_date"])).'</td>
            <td>'.date("g:i a", strtotime($row["start_time"])).' ~ '.date("g:i a", strtotime($row["end_time"])).'</td>
            <td>'.$row["weekday"].'</td>
            <td><a class="btn" id="custom_danger_btn" href="schedule-page.php?id='.$row["id"].'">Delete Schedule</a>
            <a class="btn" id="custom_success_btn" href="schedule-edit-page.php?return_page='.$actual_link.'&id='.$row["id"].'">Edit Schedule</a></td>';
                    }
                } else {
                    echo "
            <td><center><b>No Request Found</b></center></td>";
                }
                mysqli_error($con);
                ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Live View of Devices (<i>-Record From Database</i>)</div>
</div>

<?php
//$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
function get_name($con, $id){
    $sql = "SELECT * FROM users WHERE id=$id";
    $result = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($result);
    return $row["first_name"].' '.$row["last_name"];
}

if(isset($_GET["del"])){
    $id = $_GET["del"];
    $query = "DELETE FROM schedule WHERE id = ".$id;
    if(mysqli_query($con, $query)){
        echo '
            <script>
              alert("Schedule Deleted!");
              window.location.replace("schedule-page.php");
            </script>
          ';
    }
}

?>



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