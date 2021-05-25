<?php
$sql = "SELECT * FROM users ";
$result = mysqli_query($con, $sql);
?>

<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Members of <?php echo $company_name; ?>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <?php
                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while($row = mysqli_fetch_assoc($result)) {
                        if( $row["company"]==$comp_id ){
                         echo '
                            <tr class="odd gradeX" id="device-view-font">
                                <td>'.$row["id"].'</td>
                                <td><img style="height: 24px;" src="../images/user-avatar.png">&nbsp;'.$row["first_name"].' '.$row["last_name"].'</td>
                                <td>'.$row["email"].'</td>
                                <td class="center"><a class="device-action" href="userid_'.$row["id"].'.php" class="deleteaction">View Details</a></td>
                           ';
                    }
                        }
                    }
                 else {
                    echo "
            <td><center><b>No Members Found</b></center></td>";
                }

                ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Live View of Devices (<i>-Record From Database</i>)</div>
</div>