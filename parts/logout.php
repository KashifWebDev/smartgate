<?php
require 'config.php';
session_start();
$_SESSION["actice"]= false;
session_unset();
session_destroy();
header('Location: '.$path);

?>