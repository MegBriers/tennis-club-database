<!-- 
	PHP that lets the users get a match history of a given player in the club
    Adapted from :  
	Simple PHP page for Simple MariaDB PHP Example - based on https://www.php.net/manual/en/mysqli.examples-basic.php but using prepared statements
	 and in a procedural style.

     @author jonl & rah11 
-->
<html>
<head>
        <title>
        Player History
        </title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        </head>
    <body>
    <?php

$email = $_POST['person'];

//build the connection string based on the info in the connections.php file
require_once "connections/connection.php";
$mysqli = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

if (mysqli_errno($mysqli)) {
    // generic error message across the site
    echo "Sorry, the website is experiencing problems.";
    echo "We'd love to show you the tennis information so check back soon and hopefully it'll be all fixed."."<br>";
    echo "For any urgent requests, please try contacting our secretary josie@notts_tennis.com"; 
    exit;
}

// Prepared statement
if (!($stmt = mysqli_prepare($mysqli, "SELECT id, name_from_email(p1_email), name_from_email(p2_email), date_played, court_number, venue_name, is_winner_cur(id) FROM played_match WHERE p1_email = ? or p2_email = ?"))) {
    echo "Prepare failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
}

// Prepared statement: bind a string and execute 
if (!mysqli_stmt_bind_param($stmt, "ss", $email, $email)) {
    echo "Binding parameters failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
}

// Need to re-do the SQL query
if (!mysqli_stmt_execute($stmt)) {
    // coming here with registered users, so unlikely to ever ever get here
    // i.e. users cannot be at fault 
    echo "Sorry, the website is experiencing problems."."<br>";
};

mysqli_stmt_store_result($stmt); // needed so we can get the number of rows!
mysqli_stmt_bind_result($stmt, $id, $p1, $p2, $d, $c, $v, $w);
if (mysqli_stmt_num_rows($stmt) === 0) {
    echo "<p>Yet to compete in any matches but we're looking forward to seeing them on the court soon!</p>";
}else{
    echo "<h1>Match history</h1>";
    echo "<table>\n";
    echo "<tr><th>Match ID</th><th>Player 1</th><th>Player 2</th><th>Date Played</th><th>Court Number<th>Venue Name</th><th>Winning Player</tr>\n"; //table header row
	/* fetch value into bound variable */
    while (mysqli_stmt_fetch($stmt)) {
			// Print our results in a table
	    echo "<tr><td>" . $id . "</td><td>" . $p1 . "</td><td>" . $p2 . "</td><td>" . $d . "</td><td>" . $c . "</td><td>". $v . "</td><td>" . $w . "</td></tr>\n";
    }
    echo "</table>\n";			
    mysqli_close($mysqli);
}

echo "<p>To organise a game please contact : $email</p>";
echo "<br>";
echo "<a href=\"index.html\"><h2>Go back to Home</h2></a>";
?>
</body>
</html>