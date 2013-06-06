<?php
//based on POST-Arduino-Data-Wireless by ericbenwa
foreach($_REQUEST as $key => $value) {
	if($key=="freq") {
		$freq= $value;
	} else if($key=="amp") {
		$amp= $value;
	} else if($key=="rate") {
		$rate= $value;
	}
}

//edit your data here
$username = "redfrik";
$password = "asdf";
$database = "my_redfrik";
$tablename = "udk";

if(mysql_connect("localhost", $username, $password)) {
	@mysql_select_db($database) or die ("Unable to select database");
	$query= "INSERT INTO $tablename VALUES ($freq,$amp,$rate,now())";
	$result= mysql_query($query);
  } else {
	echo('Unable to connect to database.');
  }
?>