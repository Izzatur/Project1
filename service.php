<html>
<head>
<title>JB Car Rental</title>
<link rel="stylesheet" href="css/style2.css">
</head>

<?php
include('config.php');
session_start();
?>

<body>
<header>
<div class="menu_block ">
					<div class="container_12">
						<div class="grid_12">
	<nav class="horizontal-nav full-width horizontalNav-notprocessed">
	<ul class="sf-menu">
	<li><a href="homepage.php">Home</a></li>
	<li><a href="employee.php">Employee</a></li>
	<li><a href="customer.php">Customer</a></li>
	<li><a href="car.php">Cars</a></li>
	<li class="current"><a href="service.php">Services</a></li>
	<li><a href="blacklist.php">Blacklist</a></li>
	</ul>
	</nav>
	</div>
	</div>
	</div>
	<div class="container_12">
	<div class="grid_12">
		<h1>
		<a href="homepage.php">
		<img src="images/logo.gif" alt="Your Happy Family">
		</a>
		</h1>
		</div>
		</div>
		<div class="clear"></div>
	</header>

	<h1 align="center">Service Information</h1>
	<table class="responstable">
	  <tr>
		<th> No. </th>
		<th> Id </th>
		<th> Date </th>
	    <th> Payment (RM)</th>
	    <th> Reason </th>
	    <th> Car Id </th>
	    <th> Car Model </th>

     </tr>

      <?php
	   	$x=1;
	 	$sql="SELECT * FROM service s, cars c WHERE  s.car_id = c.car_id ORDER BY serv_date DESC";

	 	//SQL STATEMENT END
	 	$db=mysql_select_db($database, $con);

	 	$result=mysql_query($sql);
	 	if (!$result) {
	     	echo 'Could not run query: ' . mysql_error();
	     	exit;
	 	}
	  ?><?php


	 	$x=1;
	    while($row = mysql_fetch_row($result))  { ?>


		   <tr>
		     <td><?php echo $x; ?></td>
		     <td><?php echo $row[0]; ?></td>
		     <td><?php echo $row[1]; ?></td>
		     <td><?php echo $row[2]; ?></td>
		     <td><?php echo $row[3]; ?></td>
		     <td><?php echo $row[4]; ?></td>
		     <td><?php echo $row[7]; ?></td>
    		 <td><input name="update" type="button" value="Update" class="btn btn-warning"
			 onclick="window.location.href='<?php echo 'update/updateservice.php?code='.$row[0]; ?>'" /></td>
			 <td><input name="Delete" type="button" value="Delete" class="btn btn-warning"
			  onclick="window.location.href='<?php echo 'delete/deleteservice.php?code='.$row[0]; ?>'"/></td>
			  </tr>


			  <?php $x=$x+1; } ?>

	</table>
	 <?php
				 	$res = mysql_query("SELECT SUM(serv_payment) from service;");
					$sql="SELECT c.car_model, COUNT(s.serv_no) from service s JOIN cars c ON s.car_id=c.car_id GROUP BY car_model";

						 	//SQL STATEMENT END
						 	$db=mysql_select_db($database, $con);

						 	$result=mysql_query($sql);
						 	if (!$result) {
						     	echo 'Could not run query: ' . mysql_error();
						     	exit;
	 							}
			  ?>


			<table class="responstable">
					<tr>
					<th>Total Payment =</th>
					<td>RM <?php echo mysql_result($res, 0)?></td>
					</tr>
		</table>
		<table class="responstable">
			 <tr>
			 	<th>Car Model</th>
			 	<th>Service Count</th>
			</tr>
			 <?php
	   				while($row = mysql_fetch_row($result))  { ?>

					<tr>
					<td><?php echo $row[0] ?></td>
					<td><?php echo $row[1] ?></td>
					</tr>
					<?php $x=$x+1; } ?>
			</table>
	<h3 align = "center" >
		<input name="Add" type="button" value="Add Record" class="btn btn-warning"
				  onclick="window.location.href='<?php echo 'add/addservice.php?code='; ?>'"/>
	</h3>

	<h3 align = "center" >Go Hard or Go Home</h3>
</body>
</html>