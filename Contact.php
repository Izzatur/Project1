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
	<li class="current"><a href="employee.php">Employee</a></li>
	<li><a href="customer.php">Customer</a></li>
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

	<h1 align="center">Employee Customers Information</h1>
	<table class="responstable">
	  <tr>
		<th>No.</td>
		<th>Employee Id</th>
	    <th>Employee Name</th>
	    <th>Employee contact Customer</th>
     </tr>

      <?php
	   	$x=1;
	 	$sql="SELECT e.emp_id, e.emp_name, c.cust_name FROM employess e JOIN employee_customer d ON d.emp_id = e.emp_id JOIN customer c ON d.cust_id = c.cust_id ORDER BY e.emp_name";

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


			  <?php $x=$x+1; } ?>

	</table>
	<table class="responstable">
		  <tr>
		    <th>Employee Name</th>
		    <th>Count contact Customer</th>
	     </tr>

	      <?php

		 	$sql="SELECT e.emp_name, count(emp_name) FROM employess e JOIN employee_customer d ON d.emp_id = e.emp_id JOIN customer c ON d.cust_id = c.cust_id GROUP BY e.emp_name";

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

	</table>

	<h3 align = "center" >
	<input name="Back" type="button" value="Back" class="btn btn-warning"
			  onclick="window.location.href='<?php echo 'employee.php?code='; ?>'"/>
	</h3>
	<h3 align = "center" >Go Hard or Go Home</h3>
</body>
</html>