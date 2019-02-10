<?php
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$departement = $_POST['departement'];
$email = $_POST['email'];

$servername = "localhost:3306";
$username = "massinissa";
$password = "root";
$dbname = "test";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
if($email != ""){
  $sql = "INSERT INTO employees Values ('$firstname','$lastname','$departement','$email')";
  $result = $conn->query($sql);
  echo "Utilisateur Ajouté";
  header( 'Location: index.php' ) ;
}

$conn->close();
?>
<html>
 <head>
  <title>Test PHP</title>
 </head>
 <body>

 <form action="index.php" method="post">
 <p>Firstname : <input type="text" name="firstname" /></p>
 <p>Lastname : <input type="text" name="lastname" /></p>
 <p>Departement : <input type="text" name="departement" /></p>
 <p>Email* : <input type="text" name="email" required/></p>
 <p><input type="submit" value="Valider"></p>
</form>
 <?php
 $servername = "localhost:3306";
 $username = "massinissa";
 $password = "root";
 $dbname = "test";

 // Create connection
 $conn = new mysqli($servername, $username, $password, $dbname);
 // Check connection
 if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
 }

 $sql = "SELECT * FROM employees";
 $result = $conn->query($sql);

 if ($result->num_rows > 0) {
     // output data of each row
     while($row = $result->fetch_assoc()) {
         echo "- Email: " . $row["email"]."</br>";
         echo "<hr>";
     }
 } else {
     echo "0 results";
 }
 $conn->close();
 ?>

</body>
</html>
