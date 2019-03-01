
<html>
<head>
</head>
<body background="download.jpg">
<?php
session_start();
$conn = mysqli_connect("localhost","root","","chelsea");
	
$message="";
if(!empty($_POST["login"])) {
	$result = "INSERT INTO members VALUES('" . $_POST["user_name"] . "','". $_POST["password"]."','". $_POST["first_name"]."','". $_POST["last_name"]."','". $_POST["email"]."','". $_POST["dob"]."')";
	
	if (mysqli_query($conn, $result)) {
    echo "New record created successfully";
	} else {
		
	echo "Username already exists!";
	}
}
if(!empty($_POST["logout"])) {
	$_SESSION["username"] = "";
	session_destroy();
}
?>




<h1 align="center"><font color="purple"> To Register please fill in the following details </h1>

<form align="center" action="" method="post" >
<label for="login"><strong>Username</strong></label>
<input name="user_name" type="text" class="input-field">
<br>  <br />
<label for="login"><strong><bold> <italic> Password </italic></bold></strong></label>
<input name="password" type="password" class="input-field">
<br> </br>
<label for="login"><strong> First Name</strong> </label>
<input name="first_name" type="text" class="input-field">
<br>  <br />
<label for="login"><strong> Last Name</strong> </label>
<input name="last_name" type="text" class="input-field">
<br>  <br />
<label for="login"><strong> Email </strong> </label>
<input name="email" type="text" class="input-field">
<br>   <br />
<label for="login"><strong> Date of Birth </strong></label>
<input name="dob" type="date" class="input-field">
<br>  <br />
	<div><input type="submit" name="login" value="Login" class="form-submit-button"></span></div>
</form>



</body>
</html>