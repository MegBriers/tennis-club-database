<!-- 
	PHP that lets the users get query 1 required for the spec
    Adapted from :  
	Simple PHP page for Simple MariaDB PHP Example - based on https://www.php.net/manual/en/mysqli.examples-basic.php but using prepared statements
	 and in a procedural style.

     @author jonl & rah11 
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Venue Query Results</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<h1>Venue Query Results</h1>


<?php
	//gets the value posted in the 'search' field
	$name = $_POST['search'];
	$vname = $name;


	//build the connection string based on the info in the connections.php file
	require_once "connections/connection.php";
	$mysqli = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

	# an error has happened
	if (mysqli_errno($mysqli)) {
		// Let's try this:
		echo "Sorry, this website is experiencing problems."."<br>";
		echo "We'd love to show you the tennis information so check back soon and hopefully it'll be all fixed."."<br>";
		echo "For any urgent requests, please try contacting our secretary jack@notts_tennis.com"; 
		exit;
	}

	// preparing a statement to get the information about each match
	if (!($stmt = mysqli_prepare($mysqli, "SELECT id, name_from_email(p1_email), name_from_email(p2_email), date_played, court_number from played_match where venue_name = ?"))) {
		echo "Prepare failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
	}

	// placing the variable names in the slots free in the prepared statement
	if (!mysqli_stmt_bind_param($stmt, "s", $vname)) {
		echo "Binding parameters failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
	}
	
	if (!mysqli_stmt_execute($stmt)) {
		// Oh no! The query failed. 
		echo "Sorry, the website is experiencing problems.";
		echo "We'd love to show you the tennis information so check back soon and hopefully it'll be all fixed."."<br>";
		echo "For any urgent requests, please try contacting our secretary josie@notts_tennis.com"; 
		exit;
	}
	
	echo "<p>All matches that have occured in : $vname</p>";
	
	/*bind the results of the statement to the variables */
	mysqli_stmt_store_result($stmt);
	// retrieving all the returned variables 
	mysqli_stmt_bind_result($stmt, $id, $p1, $p2, $d, $c);
	// specific error statement 
	if (mysqli_stmt_num_rows($stmt) === 0) {
		echo "<p>We could not find a match history for the venue '$name', sorry about that. Please try again.</p>";
	}
	else {	
		// print our results in a talbe
		echo "<table>\n";
		echo "<tr><th>Forename</th><th>Player 1</th><th>Player 2</th><th>Date Played</th><th>Court Number</th></tr>\n"; //table header row
		/* fetch value into bound variable */
		while (mysqli_stmt_fetch($stmt)) {
			echo "<tr><td>" . $id . "</td><td>" . $p1 . "</td><td>" . $p2 . "</td><td>" . $d . "</td><td>" . $c . "</td></tr>\n";
		}
		echo "</table>\n";			
	}

	mysqli_close($mysqli);
	
?>
	
	<a href="index.html"><h2>Go back to Home</h2></a>
</body>
</html>
