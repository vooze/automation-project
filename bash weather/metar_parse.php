<?php
//Connect to the database
$db=new mysqli('localhost','local_user','wordpass','metar');
if(mysqli_connect_errno())
{
 echo "Error connecting to database\n";
 exit;
}
//Open the text file fetched from NOAA
$metar_file=fopen("~/weather/".gmdate('H')."Z.TXT", "r");
//Read file a line at a time
while($metar=fgets($metar_file, 500))
{
 //Check if the line has an ICAO code at the beginning
 //If so, find the relevant elements and put them in the database
 if(preg_match("/[A-Z]{4}/",substr($metar,0,4)))
 {
 $icao=substr($metar,0,4);
 $time=substr($metar,7,4);
 $report=substr($metar,13);
 $query="REPLACE INTO reports VALUES('$icao','$time','$report')";
 $result=$db->query($query);
 }
}
?>
