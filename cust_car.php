<html>
<head>
<title>JB Car Rental</title>
</head>
<link rel="stylesheet" href="css/style2.css">

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
	<li class="current"><a href="customer.php">Customer</a></li>
	<li><a href="car.php">Cars</a></li>
	<li><a href="service.php">Services</a></li>
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

	<h1 align="center">Car rent by Customer Information</h1>
	<table class="responstable">
	  <tr>
	    <th>Customer Name</th>
	    <th>Rent Date</th>
	    <th>Rent Time (Hour)</th>
	    <th>Car Model</th>

     </tr>

      <?php
	   	$x=1;
	 	$sql="SELECT c.cust_name,c.rent_date,c.rent_time,d.car_model FROM customer c JOIN customer_car b ON c.cust_id = b.cust_id JOIN cars d ON b.car_id=d.car_id ORDER BY c.cust_name";

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
		     <td><?php echo $row[0]; ?></td>
		     <td><?php echo $row[1]; ?></td>
		     <td><?php echo $row[2]; ?></td>
		     <td><?php echo $row[3]; ?></td>
			  <?php $x=$x+1; } ?>

	</table >
	<table class="responstable">
		  <tr>
		    <th>Customer Name</th>
		    <th>Number of car Rent</th>
	     </tr>

	      <?php

		 	$sql="SELECT c.cust_name, count(c.cust_name) FROM customer c JOIN customer_car b ON c.cust_id = b.cust_id JOIN cars d ON b.car_id=d.car_id GROUP BY c.cust_id ORDER BY cust_name";

		 	//SQL STATEMENT END
		 	$db=mysql_select_db($database, $con);

		 	$result=mysql_query($sql);
		 	if (!$result) {
		     	echo 'Could not run query: ' . mysql_error();
		     	exit;
		 	}
		  ?><?php

		    while($row = mysql_fetch_row($result))  { ?>


			   <tr>
			     <td><?php echo $row[0]; ?></td>
			     <td><?php echo $row[1]; ?></td>
				</tr>


				  <?php } ?>

	</table >


	<h3 align = "center" >
		<input name="Back" type="button" value="Back" class="btn btn-warning"
				  onclick="window.location.href='<?php echo 'customer.php?code='; ?>'"/>
	</h3>

	<h3 align = "center" >Go Hard or Go Home</h3>
</body>
</html>