<?php
// the message
$msg = "First line of text\nSecond line of text";
$msg = wordwrap($msg,70);
$to = "dexayoh801@imail8.net";
$subject = "My Subject";
// send email
echo mail($to,$subject,$msg);
?>