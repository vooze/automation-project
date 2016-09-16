<?php
/*Extract the parameter named icao from the URL and put into a variable*/
 $q=$_GET["icao"];
 /*Make a new database connection, user=web_user, password=password,
 database= metar*/
 @ $db = new mysqli('localhost','web_user','password','metar');
 if (mysqli_connect_errno())
 {
 echo "Error: Could not connect to database";
 exit;
 }
 //Find the report for the ICAO code in the database
 $query = "select * from reports where icao = '".$q."'";
 $result = $db->query($query);
 $num_results = $result->num_rows;
 for ($i = 0; $i <$num_results; $i++)
 {
 $row = $result->fetch_assoc();
$arr = array('icao' => $row['icao'], 'time' => $row['time'],
'report' => str_replace("\n", '', $row['report']);

 /* get the JSON printed */
 echo json_encode($arr);
 }
?>
