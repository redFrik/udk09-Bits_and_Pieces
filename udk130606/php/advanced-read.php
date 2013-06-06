<html><head><title>udk data</title></head><body>
<?php
//based on POST-Arduino-Data-Wireless by ericbenwa

//edit your data here
$db_user = 'redfrik';
$db_pwd = 'asdf';
$database = 'my_redfrik';
$table = 'udk';

if(!mysql_connect('localhost', $db_user, $db_pwd))
	die("Can't connect to database");
if(!mysql_select_db($database))
	die("Can't select database");
$result= mysql_query("SELECT * FROM {$table}");
if(!$result) {
	die("Query to show fields from table failed");
}
$fields_num= mysql_num_fields($result);
echo "<h1>Table: {$table}</h1>";
echo "<table border='1'><tr>";
for($i=0; $i<$fields_num; $i++) {
	$field = mysql_fetch_field($result);
	echo "<td>{$field->name}</td>";
}
echo "</tr>\n";
while($row = mysql_fetch_row($result)) {
	echo "<tr>";
	foreach($row as $cell)
		echo "<td>$cell</td>";
	echo "</tr>\n";
}
mysql_free_result($result);
?>
</body></html>
