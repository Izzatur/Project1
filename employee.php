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

	<h1 align="center">Employee Information</h1>
	<table class="responstable">
	  <tr>
		<th>No.</td>
		<th>Employee Id</th>
	    <th>Employee Name</th>
	    <th>Employee Ic</th>
	    <th>Employee Address</th>
     </tr>

      <?php
	   	$x=1;
		$res = mysql_query("SELECT count(*) from employess;");
	 	$sql="SELECT * FROM employess ORDER BY emp_name";

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
    		 <td><input name="update" type="button" value="Update" class="btn btn-warning"
			 onclick="window.location.href='<?php echo 'update/updateemployee.php?code='.$row[0]; ?>'" /></td>
			 <td><input name="Delete" type="button" value="Delete" class="btn btn-warning"
			  onclick="window.location.href='<?php echo 'delete/deleteemployee.php?code='.$row[0]; ?>'"/></td>
			  </tr>


			  <?php $x=$x+1; } ?>
			  <tr>

			  <td>Total Employee = <?php echo mysql_result($res, 0) ?></td>
			  </tr>

	</table>

	<h3 align = "center" >
	<input name="Add" type="button" value="Add Record" class="btn btn-warning"
	onclick="window.location.href='<?php echo 'add/addemployee.php?code='; ?>'"/>
	<input name="View" type="button" value="View Employee Contact Customer" class="btn btn-warning"
	onclick="window.location.href='<?php echo 'Contact.php?code='; ?>'"/>

	</h3>
	<h3 align = "center" >Go Hard or Go Home</h3>
</body>
</html>