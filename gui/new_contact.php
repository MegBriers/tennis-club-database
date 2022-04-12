<!-- 
	PHP that lets the users add further contact details 
    Adapted from :  
	Simple PHP page for Simple MariaDB PHP Example - based on https://www.php.net/manual/en/mysqli.examples-basic.php but using prepared statements
	 and in a procedural style.

     @author jonl & rah11 
-->
<!DOCTYPE HTML>
<html>
<head>
<title>New Number</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<h1>Adding phone numbers</h1>

<?php
	// getting required numbers
    $type = $_POST['phones'];
    $number = $_POST['number'];
    $email = $_POST['email'];
	//build the connection string based on the info in the connections.php file
	require_once "connections/connection.php";
	$mysqli = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

	if (mysqli_errno($mysqli)) {
		// standard error message
		echo "Sorry, the website is experiencing problems.";
		echo "We'd love to show you the tennis information so check back soon and hopefully it'll be all fixed."."<br>";
		echo "For any urgent requests, please try contacting our secretary josie@notts_tennis.com"; 
		exit;
	}


	// Prepared statement
	if (!($stmt = mysqli_prepare($mysqli, "INSERT INTO player_phone VALUES (?,?,?)"))) {
		echo "Prepare failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
	}

	// Prepared statement: bind a string and execute 
	if (!mysqli_stmt_bind_param($stmt, "sss", $email, $number, $type)) {
		echo "Binding parameters failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
	}
	
	// Need to re-do the SQL query
	if (!mysqli_stmt_execute($stmt)) {

		// primary key duplicate
        if (mysqli_errno($mysqli) == 1062) {
            echo "<p>That email and phone number are already stored in our database.</p>"."<br>";
        }elseif(mysqli_errno($mysqli) == 1452){
			// foreign key failure - there isn't a registered person with that email 
            echo "<p>Sorry, you aren't in our club records. Please become a member of our club before trying to add contact information.</p>"."<br>"; 
        }elseif(mysqli_errno($mysqli) == 4025){
			// constraint problems - number is not long enough/too long or has alpha characters in it
            echo "<p>The number you have entered should have 11 characters and may contain things other than numbers.</p>"."<br>";
            echo "<p>We accept three types of phone; mobile, home and work. Please contact Gary with details if you believe your phone falls outwith this category.</p>"."<br>";
        }else{
			// generic error statement (not in expected causes)
            echo "<p>The website is experiencing problems.</p>"."<br>";
        }
	};
	
	/*bind the results of the statement to the variables */
	mysqli_stmt_store_result($stmt); // needed so we can get the number of rows
    if (mysqli_affected_rows($mysqli) == -1) {
		echo "<p>Sorry, we couldn't add your additional contact details to our records. Please try again. </p>";
	}
	else {	
        echo "<p>Thanks, that's your contact details added to our records!</p>"."<br>"; 		
	}
?>

	<a href="index.html"><h2>Go back to Home</h2></a>
    <a href="addcontact.html"><h2>Add additional contact numbers</h2></a>
</body>
</html>
