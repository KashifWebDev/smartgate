<?php include 'parts/db.php'; ?>
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            All Schedule Records</div>
            <?php
            session_start();
            $uid = $_SESSION["id"];
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM schedule_guest WHERE parent_id=$uid";
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
                      <th>User</th>
                      <th>WeekDay</th>
                      <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>Schedule Name</th>
                      <th>Date</th>
                      <th>Time</th>
                      <th>User</th>
                      <th>WeekDay</th>
                      <th>Action</th>
                  </tr>
                </tfoot>
                  <tbody>
                  <?php
                  function get_user_info($con, $id){
                      $aa = "SELECT * FROM users WHERE id = $id";
                      $bb = mysqli_query($con, $aa);
                      $cc = mysqli_fetch_array($bb);
                      return $cc["first_name"].' '.$cc["last_name"].' ('.$cc["email"].')';
                  }

                  if (mysqli_num_rows($result) > 0) {
                      // output data of each row
                      while($row = mysqli_fetch_assoc($result)) {
                          $id=$row["user_id"];
                          echo '
        <tr class="odd gradeX" id="device-view-font">
            <td>'.$row["sch_name"].'</td>
            <td>'.date("d-M,Y", strtotime($row["start_date"])).' ~ '.date("d-M,Y", strtotime($row["end_date"])).'</td>
            <td>'.date("g:i a", strtotime($row["start_time"])).' ~ '.date("g:i a", strtotime($row["end_time"])).'</td>
            <td>'.get_user_info($con, $row["user_id"]).'</td>
            <td>'.$row["weekday"].'</td>
            <td><a class="btn" id="custom_danger_btn" href="schedules-guest-list.php?del='.$row["id"].'">Delete Schedule</a>
            <!--<a class="btn" id="custom_success_btn" href="edit-schedule.php?id='.$row["id"].'">Edit Schedule</a>--></td>';
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
    $query = "DELETE FROM schedule_guest WHERE id = ".$id;
    if(mysqli_query($con, $query)){
        echo '
            <script>
              alert("Schedule Deleted!");
              window.location.replace("schedules-guest-list.php");
            </script>
          ';
    }
}

?>