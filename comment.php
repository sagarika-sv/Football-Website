<?php

$conn = mysqli_connect("localhost","root","","chelsea");
	
$message="";
if(!empty($_POST["yes"])) {
	$result = "update player_vote set vote_yes= vote_yes+1 where name not like 'Club'";
	
	if (mysqli_query($conn, $result)) {
    echo "Thank you for voting!";
	} else {
		echo mysqli_error($conn);
	echo "Some issue happened!";
	}
}
if(!empty($_POST["no"])) {
	$result = "update player_vote set vote_no = vote_no+1 where name not like 'Club'";
	
	if (mysqli_query($conn, $result)) {
    echo "Thank you for voting!";
	} else {
		echo mysqli_error($conn);
	echo "Some issue happened!";
	}
}
if(!empty($_POST["yes_team"])) {
	$result = "update player_vote set vote_yes= vote_yes+1 where name like 'Club'";
	
	if (mysqli_query($conn, $result)) {
    echo "Thank you for voting!";
	} else {
		echo mysqli_error($conn);
	echo "Some issue happened!";
	}
}
if(!empty($_POST["no_team"])) {
	$result = "update player_vote set vote_no = vote_no+1 where name  like 'Club'";
	
	if (mysqli_query($conn, $result)) {
    echo "Thank you for voting!";
	} else {
		echo mysqli_error($conn);
	echo "Some issue happened!";
	}
}
if(!empty($_POST["eff_value"])) {
	$result = "call eff_value_player()";
	
	if (mysqli_query($conn, $result)) {
    echo "Value calculated";
	$result1 = mysqli_query($conn,"SELECT name, eff_value FROM player_vote");
	
	echo "<table border='1'>
	<tr>
	<th>Name</th>
	<th>Effective Value</th>
	</tr>";

	while($gear = mysqli_fetch_array( $result1 )) {
		echo "<tr><td>"; 
		echo $gear['name'];
		echo "</td><td>"; 
		echo $gear['eff_value'];
		echo "</td></tr>"; 
	}
	echo "</table>";


	} 
	else {
		echo mysqli_error($conn);
	echo "Some issue happened!";
	}
}
if(!empty($_POST["logout"])) {
	$_SESSION["username"] = "";
	session_destroy();
}
?>

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

<h1 align="center"> <font color="purple"> Do you want to see this player in the club? </h1>

<?php
session_start();
$conn = mysqli_connect("localhost","root","","chelsea");

$result = mysqli_query($conn,"SELECT * FROM player_vote where name not like 'Club'");

?>
<form align="center" action="" method="post" >
<table border='1'>
</td><td> 
<div>Name</div> 

<div><td>Yes?</td></div>
<div><td>No?</td></div>
</td></tr>

<?php
while($gear = mysqli_fetch_array( $result )) {
echo "<tr><td>"; 
echo $gear['name']?>

</td><td>
<div class="radio"><label for="yes"><input type="radio" name="yes" > Yes</label> </div>
</td><td> 
<div class="radio"><label for="no"><input type="radio" name="no" > No</label> </div>

</td></tr>
 <?php
}
echo "</table>"

?>
<div><input type="submit" name="login" value="Vote" class="form-submit-button"></span></div>


<h1 align="center"> <font color="purple"> Did we perform well today? </h1>

<?php
$conn = mysqli_connect("localhost","root","","chelsea");


?>
<form align="center" action="" method="post" >
<table border='1'>
</td><td> 

<div>Yes?</td></div>
<div><td>No?</td></div>
</td></tr>

<?php
echo "<tr><td>"; 
?>
<div class="radio"><label for="yes_team"><input type="radio" name="yes_team" > Yes</label> </div>
</td><td> 
<div class="radio"><label for="no_team"><input type="radio" name="no_team" > No</label> </div>

</td></tr>
 <?php
echo "</table>"

?>
<div><input type="submit" name="login_team" value="Vote	" class="form-submit-button"></span></div>
<h1 align="center"> <font color="purple"> Calculate the effective value of  votes? </h1>
<div><input type="submit" name="eff_value" value="Calculate" class="form-submit-button"></span></div>
</form>
</body>
</html>
