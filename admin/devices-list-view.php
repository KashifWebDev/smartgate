        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            All Devices Record</div>
            <?php
            //$sql = "SELECT * FROM devices  WHERE active='".$ok."'";
            $sql = "SELECT * FROM user_and_devices WHERE user_id=".$link;
            //echo "TAADAA: ".$sql;
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
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>ID</th>
                      <th>Mobile Address</th>
                      <th>Mac Address</th>
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
            <td>'.$row["machine_mac"].'</td>';
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