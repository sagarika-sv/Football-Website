<?php
session_start();
$conn = mysqli_connect("localhost","root","","chelsea");
	?>
	
<html>
<head>
<title> Official Site </title>
<color="blue">
<h1 align="center" ><strong><font color="purple"> Football Club Database System </strong> </h1>

</head>
<body background="project.jpg">


<p align= "center">

<a href="register.php"> <button type="button" > Register </button>
</a>
</p>

<p align="center">
<a href="index.php">
<button type="button"> Login </button>
</a>
</p>
<p align="center">
<a href="team.php" >
<button type="button"> Team Players </button>
</a>
</p>

<p align="center">
<a href="contact.php">
<button type="button"> Contact us </button>
</a>
</p>
</body>
</html>
 