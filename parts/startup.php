<?php
//(0);
error_reporting(0);
    session_start();
        if(!$_SESSION['active'] || $_SESSION['active'] && $redirec=="user"){
            header('Location: index.php');
        }
        if(!(isset($_SESSION['active']) || $_SESSION['active']) && $redirec=="admin"){
            header('Location: index.php');
        }


    // Startup of Application
        require 'db.php';
        require 'config.php';


?>