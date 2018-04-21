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
	<li><a href="customer.php">Customer</a></li>
	<li><a href="car.php">Cars</a></li>
	<li><a href="service.php">Services</a></li>
	<li class="current"><a href="blacklist.php">Blacklist</a></li>
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

	<h1 align="center">Blacklist Information</h1>
	<table class="responstable">
	  <tr>
		<th> No. </th>
		<th>  Id </th>
		<th> Customer Id </th>
		<th> Customer Name </th>
		<th> Reason </th>
     </tr>

      <?php
	   	$x=1;
	 	$sql="SELECT * FROM blacklist b,customer c WHERE b.cust_id = c.cust_id";

	 	//SQL STATEMENT END
	 	$db=mysql_select_db($database, $con);

	 	$result=mysql_query($sql);
	 	if (!$result) {
	     	echo 'Could not run query: ' . mysql_error();
	     	exit;
	 	}



	 	$x=1;
	    while($row = mysql_fetch_row($result))  {
?>


		   <tr>
		     <td><?php echo $x; ?></td>
		     <td><?php echo $row[0]; ?></td>
		     <td><?php echo $row[1]; ?></td>
		     <td><?php echo $row[4]; ?></td>
		     <td><?php echo $row[2]; ?></td>
    		 <td><input name="update" type="button" value="Update" class="btn btn-warning"
			 onclick="window.location.href='<?php echo 'update/updateblacklist.php?code='.$row[0]; ?>'" /></td>
			 <td><input name="Delete" type="button" value="Delete" class="btn btn-warning"
			  onclick="window.location.href='<?php echo 'delete/deleteblacklist.php?code='.$row[0]; ?>'"/></td>
			  </tr>


			  <?php $x=$x+1; } ?>

	</table>
	<?php
		$result = mysql_query("SELECT COUNT(*) from blacklist;");
	?>
		<table class="responstable">
			<tr>
			<th>Blacklist Count =</th>
			<td><?php echo mysql_result($result, 0)?></td>
			</tr>
		</table>

	<h3 align = "center" >
		<input name="Add" type="button" value="Add Record" class="btn btn-warning"
				  onclick="window.location.href='<?php echo 'add/addblacklist.php?code='; ?>'"/>
	</h3>

<h3 align = "center" >Go Hard or Go Home</h3>
</body>
</html>