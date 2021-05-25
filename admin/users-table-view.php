<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        All Registered users Record</div>
    <?php
    $sql = "SELECT * FROM users";
    //$sql = "SELECT * FROM devices";
    $result = mysqli_query($con, $sql);
    ?>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Group</th>
                    <th>Email</th>
                    <th>Mac Address</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Full Name</th>
                    <th>Group</th>
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
                        echo '

        <tr class="odd gradeX" id="device-view-font">
                    <td>'.$row["first_name"].' '. $row["last_name"].'</td>
                    <td>'.company_name($con, $row["company"]).'</td>
                    <td>'.$row["email"].'</td>
                    <td>'.$row["mac"].'</td>
                    <td class="center"><a class="device-action" href="userid_'.$row["id"].'.php" class="deleteaction">View</a>
                        <a class="device-action" id="edit-btn-list" href="edit_user.php?id='.$row["id"].'" class="deleteaction">Edit</a>
                        <a class="device-action" id="delete-btn-list" href="dashboard.php?del_user='.$row["id"].'" class="deleteaction">Delete</a></td>
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
    function company_name($con, $comp_id){
        $sql = "SELECT * FROM company WHERE id=$comp_id";
        $res = mysqli_query($con, $sql);
        $row = mysqli_fetch_assoc($res);
        return $row["name"];
    }
?>