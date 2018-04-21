<?php

$hostname='localhost';
$database='car_rental';
$userdb='root';
$passdb='1234';
$con=mysql_pconnect($hostname,$userdb,$passdb) or trigger_error(mysql_error(),E_USER_ERROR);
$conn=mysqli_connect("localhost","root","1234","car_rental");
//ABOVE IS TO DO DECLARATION OF DB

?>
