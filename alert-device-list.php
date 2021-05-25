<?php include 'parts/db.php'; ?>
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            All alerts Record</div>
            <?php
            session_start();
            $uid = $_SESSION["id"];
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM alert WHERE user_id=$uid";
            $result = mysqli_query($con, $sql);

            ?>
          <div class="card-body">
            <div class="table table-striped">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                      <th scope="col">Alert Name</th>
                      <th scope="col">Date</th>
                      <th scope="col">Time</th>
                      <th scope="col">WeekDay</th>
                      <th scope="col">Email</th>
                      <th scope="col">App Push</th>
                      <th scope="col">Relay</th>
                      <th scope="col">Position</th>
                      <th scope="col">Actions</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>Alert Name</th>
                      <th>Date</th>
                      <th>Time</th>
                      <th>WeekDay</th>
                      <th>Email</th>
                      <th>App Push</th>
                      <th>Relay</th>
                      <th>Position</th>
                      <th>Actions</th>
                  </tr>
                </tfoot>
                  <tbody>
                  <?php
                  if (mysqli_num_rows($result) > 0) {
                      // output data of each row
                      while($row = mysqli_fetch_assoc($result)) {
                          $id=$row["user_id"];
                          echo '
        <tr class="odd gradeX" id="device-view-font">
            <td>'.$row["alert_name"].'</td>
            <td>'.date("d-M,Y", strtotime($row["start_date"])).' ~ '.date("d-M,Y", strtotime($row["end_date"])).'</td>
            <td>'.date("g:i a", strtotime($row["start_time"])).' ~ '.date("g:i a", strtotime($row["end_time"])).'</td>
            <td>'.$row["weekday"].'</td>
            <td>'.$row["email"].'</td>
            <td>'.$row["app_push"].'</td>
            <td>'.$row["relay"].'</td>
            <td>'.$row["positions"].'</td>
            <td><a class="btn" id="custom_danger_btn" href="alert-device-list.php?del='.$row["id"].'">Delete Alert</a>
            <a class="btn" id="custom_success_btn" href="edit-alert.php?id='.$row["id"].'">Edit Alert</a></td>';
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
    $query = "DELETE FROM alert WHERE id = ".$id;
    if(mysqli_query($con, $query)){
        echo '
            <script>
              alert("Alert Deleted!");
              window.location.replace("list-all-alerts.php");
            </script>
          ';
    }
}

?>