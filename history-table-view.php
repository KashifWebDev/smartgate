        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            All Devices Record</div>
            <?php
             $user_id=$_SESSION["id"];
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM app_requests WHERE user_id=".$user_id;
            $result = mysqli_query($con, $sql);
            ?>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                      <th>ID</th>
                      <th>Mobile Mac</th>
                      <th>Machine Mac</th>
                      <th>Action</th>
                      <th>TimeStamp</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>ID</th>
                      <th>Mobile Mac</th>
                      <th>Machine Mac</th>
                      <th>Action</th>
                      <th>TimeStamp</th>
                  </tr>
                </tfoot>
                <tbody>
                <?php
                        if (mysqli_num_rows($result) > 0) {
                            // output data of each row
                            while($row = mysqli_fetch_assoc($result)) {
 echo '

        <tr class="odd gradeX" id="device-view-font">
            <td>'.$row["id"].'</td>
            <td>'.$row["mobile_mac"].'</td>
            <td>'.$row["machine_mac"].'</td>
            <td>'.$row["request"].'</td>
            <td>'.$row["date_time"].'</td>';
                            }
                        } else {
                            echo "0 results";
                        }

                  ?> 
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Live View of Devices (<i>-Record From Database</i>)</div>
        </div>