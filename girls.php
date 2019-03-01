
<html>
<body background="download.jpg">
<head>
<style>
table
{
font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>

<?php
session_start();
$conn = mysqli_connect("localhost","root","","chelsea");

$result = mysqli_query($conn,"SELECT * FROM gplayers");


echo "<table border='1'>
<tr>
<th>Number</th>
<th>Name</th>
<th>Age</th>
<th>Position</th>
<th>Date of Birth</th>
</tr>";

while($gear = mysqli_fetch_array( $result )) {
echo "<tr><td>"; 
echo $gear['g_no'];
echo "</td><td>"; 
echo $gear['g_name'];
echo "</td><td>"; 
echo $gear['g_age'];
echo "</td><td>"; 
echo $gear['g_pos'];
echo "</td><td>"; 
echo $gear['g_dob'];
echo "</td></tr>"; 
}
echo "</table>"

?>
</body>
</html>
