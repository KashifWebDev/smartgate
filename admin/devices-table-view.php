        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            All Devices Record</div>
            <?php
            $sql = "SELECT * FROM user_and_devices  WHERE active=1";
            //$sql = "SELECT * FROM devices";
            $result = mysqli_query($con, $sql);
            ?>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>ID</th>
                      <th>Email</th>
                      <th>Mac Address</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>ID</th>
                      <th>Email</th>
                      <th>Mac Address</th>
                      <th>Action</th>
                  </tr>
                </tfoot>
                <tbody>
                <?php
                        if (mysqli_num_rows($result) > 0) {
                            // output data of each row
                            while($row = mysqli_fetch_assoc($result)) {
                                //echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
            echo '

        <tr class="odd gradeX" id="device-view-font">
            <td class="center">'.$row["id"].'</td>
            <td>'.$row["email"].' ('. getname($row["email"]).')</td>
            <td>'.$row["mac"].'</td>
            <td class="center"><a class="device-action" href="#" class="deleteaction">View Details</a></td>
        </tr>

            ';
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

<?php
function getname($email){
    require '../parts/db.php';
    $query="Select * from users where email='$email'";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $count = mysqli_num_rows($result);
    if($count == 1) {
        return $row["first_name"].' '.$row['last_name'];
        }
}
?>