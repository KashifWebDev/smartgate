        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            All Devices Record</div>
            <?php
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM app_requests WHERE machine_mac='".$_SESSION["mac"]."' and mobile_mac='".$_SESSION["mobile_mac"]."'";
            $result = mysqli_query($con, $sql);
            ?>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                      <th>ID</th>
                      <th>Mobile Address</th>
                      <th>Mac Address</th>
                      <th>Action</th>
                      <th>TimeStamp</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>ID</th>
                      <th>Mobile Address</th>
                      <th>Mac Address</th>
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
            <td>'.$_SESSION["mobile_mac"].'</td>
            <td>'.$row["machine_mac"].'</td>
            <td>'.$row["request"].'</td>
            <td>'.$row["date_time"].'</td>';
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