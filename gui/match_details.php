<!-- 
	PHP that begins the query to let users get match history of a given player
    Required to be php so we could get drop down with values 
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
require_once "connections/connection.php";
$mysqli = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

if (mysqli_errno($mysqli)) {
    // site wide error message
	echo "Sorry, the website is experiencing problems.";
	echo "We'd love to show you the tennis information so check back soon and hopefully it'll be all fixed."."<br>";
	echo "For any urgent requests, please try contacting our secretary josie@notts_tennis.com"; 
	exit;
}


$result = mysqli_query($mysqli, "SELECT email, name_from_email(email) FROM player");
// adapted from : https://stackoverflow.com/questions/22752762/fill-a-dropdown-list-with-query-result-from-php-table
echo "<h1> Player result history </h1>";
echo "<form action=\"match_history.php\", method=\"POST\">
    <label for=\"phones\">Choose a player:</label>";
echo "<select name='person'>";
foreach($result as $row) {
    // adapted so that you can send email across instead of name (as email is the PK and more useful)
    echo "<option value='" . $row['email'] . "'>" . $row['name_from_email(email)'] . "</option>";
}  
echo "</select>";
echo "<input type=\"submit\">";
echo "</form>";  
echo "<br>";
// always useful to be able to navigate around site
echo "<a href=\"index.html\"><h2>Go back to Home</h2></a>";


?>
</body>
</html>