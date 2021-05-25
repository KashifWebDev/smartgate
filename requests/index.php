<!doctype html>
<html lang="en">
<head>
    <title>API Monitor</title>

    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="assets/css/bootstrap.min.css?" rel="stylesheet">
    <!-- Your custom styles  -->
    <link href="assets/css/stylesheet.css" rel="stylesheet">
</head>
    <body>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Request</th>
            <th scope="col">Response</th>
            <th scope="col">DateTime</th>
        </tr>
        </thead>
        <tbody>
<!--        <tr>-->
<!--            <th scope="row">1</th>-->
<!--            <td>Mark</td>-->
<!--            <td>Otto</td>-->
<!--            <td>@mdo</td>-->
<!--        </tr>-->
        <?php
        require '../parts/db.php';
        $res = mysqli_query($con,"SELECT * FROM api_logs");
        while($row = mysqli_fetch_array($res)){
            echo '
        <tr>
            <th scope="row">'.$row["id"].'</th>
            <td>'.$row["api_input"].'</td>
            <td>'.$row["api_output"].'</td>
            <td>'.$row["date_time"].'</td>
        </tr>
                ';
        }
        ?>
        </tbody>
    </table>
    </body>

</html>
