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
	<li class="current"><a href="car.php">Cars</a></li>
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



	<h1 align="center">Cars Information</h1>
	<table class="responstable">
	  <tr>
		<th> No. </th>
		<th> Car Id </th>
		<th> No Plat </th>
		<th> Model </th>
	    <th> Colour </th>
	    <th> Price/day(RM) </th>
	    <th> Price/hour(RM) </th>

     </tr>

      <?php
	   	$x=1;
	 	$sql="SELECT * FROM cars ORDER BY car_priceday";

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
		     <td><?php echo $row[5]; ?></td>
    		 <td><input name="update" type="button" value="Update" class="btn btn-warning"
			 onclick="window.location.href='<?php echo 'update/updatecar.php?code='.$row[0]; ?>'" /></td>
			 <td><input name="Delete" type="button" value="Delete" class="btn btn-warning"
			  onclick="window.location.href='<?php echo 'delete/deletecar.php?code='.$row[0]; ?>'"/></td>
			  </tr>


			  <?php $x=$x+1; } ?>
	</table>
	<?php
				 	$res = mysql_query("SELECT count(*) from cars;");

						 	$sql="SELECT car_colour, COUNT(*) from cars GROUP BY car_colour";

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
					<th> Total car = </th>
					<td><?php echo mysql_result($res, 0) ?></td>
					</tr>
			</table>
			 <table class="responstable">
			 <tr>
			 	<th>Car Colour</th>
			 	<th>Car Count</th>
			</tr>
			 <?php
	   				while($row = mysql_fetch_row($result))  { ?>

					<tr>
					<td><?php echo $row[0] ?></td>
					<td><?php echo $row[1] ?></td>
					</tr>
					<?php $x=$x+1; } ?>
			</table>
			<?php
			$sql="SELECT max(car_priceday), max(car_pricehour), min(car_priceday), min(car_pricehour) from cars;";

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
					<th>Highest car price/day</th>
					<th>Highest car price/hour</th>
					<th>Lowest car price/day</th>
					<th>Lowest car price/hour</th>
					</tr>
					<?php
	   				while($row = mysql_fetch_row($result))  { ?>
					<tr>
					<td><?php echo $row[0]?></td>
					<td><?php echo $row[1]?></td>
					<td><?php echo $row[2]?></td>
					<td><?php echo $row[3]?></td>
					</tr>
					<?php }?>
			</table>


	<h3 align = "center" >
		<input name="Add" type="button" value="Add Record" class="btn btn-warning"
				  onclick="window.location.href='<?php echo 'add/addcar.php?code='; ?>'"/>
	</h3>
	<h3 align = "center" >Go Hard or Go Home</h3>
</body>
</html>