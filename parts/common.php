<?php
//session_start();
require 'parts/startup.php';
$dir="";
require 'db.php';
function get_admin_email($con){
    $sql = "SELECT * FROM users WHERE is_admin=1";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_array($res);
    return $row["email"];
}
?>
    <!DOCTYPE html>
    <html lang="en">

<?php require 'parts/head.php'; ?>

<body id="page-top">
<?php require 'parts/top-nav.php'; ?>

<div id="wrapper">

    <!-- Sidebar -->
<?php
    if($_SESSION["user_type"]!="guest")
        require 'parts/user-left-nav.php';
?>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
<?php require 'parts/top-pagger.php';

if($_SESSION["user_type"]=="guest"){
    echo '
            <div class="container-fluid">
                <div class="alert alert-warning alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Welcome!</strong> This is a guest account.
                </div>
            
            </div>
            ';
}
?>

