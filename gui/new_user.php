<!-- 
    The PHP that deals with adding a new user to the system
    Adapted from :  
	Simple PHP page for Simple MariaDB PHP Example - based on https://www.php.net/manual/en/mysqli.examples-basic.php but using prepared statements
	 and in a procedural style.

     @author jonl & rah11 
-->
<!DOCTYPE HTML>
<html>
<head>
<title>New Membership</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
</head>
<body>

<h1>Your Membership Application</h1>


<?php
    // creating a function allows for decreased duplication of phone when dealing with possibilites of multiple phone numbers
    function writePhone($mysqli, $user_email, $user_phone, $phone_type) {
        // preparing the statement this time to INSERT into the database
	    if (!($stmt = mysqli_prepare($mysqli, "INSERT INTO player_phone VALUES (?,?,?)"))) {
		    echo "Prepare failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
	    }

	    // binding the required variables (all strings as not to lose the leading 0)
	    if (!mysqli_stmt_bind_param($stmt, "sss", $user_email, $user_phone, $phone_type)) {
		    echo "Binding parameters failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
	    }
	
	
	    if (!mysqli_stmt_execute($stmt)) {
            // error messages 
		    echo "<p>Sorry, we couldn't add your phone to our records.</p>";

            // meaning : a constraint has failed
            if(mysqli_errno($mysqli) == 4025){
                echo "<p>The number you have entered should have 11 characters and may contain things other than numbers.</p>"."<br>";
                echo "<p>We accept three types of phone; mobile, home and work. Please contact Gary with details if you believe your phone falls outwith this category.</p>"."<br>";
                echo "<p>Please fill in the additional phone numbers form with a correctly inputted phone number.</p>"."<br>";
                echo"<a href=\"addcontact.html\"><h2>Add additional contact numbers</h2></a>";
            }
		    exit;
	    };
	
	    /*bind the results of the statement to the variables */
	    mysqli_stmt_store_result($stmt); // needed so we can get the number of rows
        if (mysqli_affected_rows($mysqli) == 0) {
		    echo "<p>Sorry, we couldn't add your phone to our records.</p>";
	    }
    
    }


	// retrieving all the past through values from the form 
	$fname = $_POST['first'];
    $mname = $_POST['middle'];
    $lname = $_POST['last'];
    $email = $_POST['email'];
    $dob = $_POST['dob'];
    // may be empty
    $mob = $_POST['mob'];
    $work = $_POST['work'];
    $home = $_POST['home'];

    // needs to be passed through as strings (what they're stored as in the database)
    $mob = (string) $mob;
    $work = (string) $work;
    $home = (string) $home;

    // check they aren't leaving out required fields
    if (strlen($fname) == 0 or strlen($lname) == 0 or strlen($email) == 0) {
        echo "<p>Please enter all the required information. </p>";
        echo "<a href=\"index.html\"><h2>Go back to Home</h2></a>";
        echo "<a href=\"addcontact.html\"><h2>Add additional contact numbers</h2></a>";
        exit;
    }

	// build the connection string based on the info in the connections.php file
	require_once "connections/connection.php";
	$mysqli = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

	// connection error
	if (mysqli_errno($mysqli)) {
		// generic error message across site if problem with connection
		echo "Sorry, this website is experiencing problems.";
        echo "We'd love to show you the tennis information so check back soon and hopefully it'll be all fixed."."<br>";
		echo "For any urgent requests, please try contacting our secretary josie@notts_tennis.com"; 
		exit;
	}


	// preparing a statement, insert this time
	if (!($stmt = mysqli_prepare($mysqli, "INSERT INTO player (email, forename, middlenames, surname, date_of_birth) VALUES (?,?,?,?,?)"))) {
		echo "Prepare failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
	}

	// binding all the relevant variables to the statement 
	if (!mysqli_stmt_bind_param($stmt, "sssss", $email, $fname, $mname, $lname, $dob)) {
		echo "Binding parameters failed: (" . mysqli_errno($mysqli) . ") " . mysqli_error($mysqli);
	}
	

	if (!mysqli_stmt_execute($stmt)) {
        // primary key constraint would not hold 
        if(mysqli_errno($mysqli) == 1062) {
            echo "<p>That email is already in use. Please try again with a new email address.</p>";#
        }elseif(mysqli_errno($mysqli) == 1644){
            // date of birth is incorrect (either after today or the member is under 5)
            echo "<p>Please try again with a correct date of birth. Please note we only accept members of the club after their 5th birthday.</p>"."<br>";
        }elseif(mysqli_errno($mysqli) == 4025){
            // all the desired information has not been entered
            echo "<p>Please enter a valid email </p>";
        }else{
            // to be removed before submission 
		    echo "Error: Our query failed to execute and here is why: \n";
		    echo "Errno: " . mysqli_errno($mysqli) . "\n";
		    echo "Error: " . mysqli_error($mysqli) . "\n";
        }
	};
	
	mysqli_stmt_store_result($stmt); // needed so we can get the number of rows
    // nothing has been inserted 
    if (mysqli_affected_rows($mysqli) == -1) {
		echo "<p>Sorry $fname, we couldn't add your details to our records. Please try again.</p>";
	}
	else {	
        echo "<p>Welcome to our club $fname, you are succesfully a member! We hope to see you out on the courts soon.🎾</p>"."<br>"; 		
        
        // if they have been entered to the database, then we can begin entering their phone information
        // if it is present (hence the check for 0 - field is an int)

        if ($mob != 0){
            writePhone($mysqli, $email, $mob, "mobile");
        }
    
        if($home != 0){
            writePhone($mysqli, $email, $home, "home");
        }
        
        if($work != 0){
            writePhone($mysqli, $email, $work, "work");
        }
    
    }
    
	mysqli_close($mysqli);
	
?>

	<a href="index.html"><h2>Go back to Home</h2></a>
    <a href="addcontact.html"><h2>Add additional contact numbers</h2></a>
</body>
</html>
