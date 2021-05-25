<?php include 'parts/db.php'; ?>
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            All Devices Record</div>
            <?php
            session_start();
            $uid = $_SESSION["id"];
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM user_and_devices WHERE user_id=$uid";
            $result = mysqli_query($con, $sql);
            ?>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                      <th>Device Name</th>
                      <th>Machine Mac</th>
                      <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>Device Name</th>
                      <th>Machine Mac</th>
                      <th>Action</th>
                  </tr>
                </tfoot>
                <tbody>
                <?php
                        if (mysqli_num_rows($result) > 0) {
                            // output data of each row
                            while($row = mysqli_fetch_assoc($result)) {
                                $user_id=$row["id"];
                                    echo '
                                        <tr class="odd gradeX" id="device-view-font">
                                        <td>'.$row["device_name"].'</td>
                                        <td>'.$row["machine_mac"].'</td>
                                        <td><a class="btn" id="custom_primary_btn" href="alert-page.php?id='.$row["id"].'">Mangage Alerts</a></td>
                                    ';
                            }
                        } else {
                            echo "
            <td><center><b>No Request Found</b></center></td>";
                        }

                  ?> 
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Live View of Devices (<i>-Record From Database</i>)</div>
        </div>

<?php
    function device_name($con, $id){
        $sql = "Select * from user_and_devices where user_id=$id";
        //$con =;
        $result = mysqli_query($con, $sql);
        $row = mysqli_fetch_assoc($result);
        //echo $row["id"];
        return $row["device_name"];
    }
    echo mysqli_error($con);
?>