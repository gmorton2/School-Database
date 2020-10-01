<!DOCTYPE html>
<html>
<body>
Your SSN Number is: <?php echo $_POST['student_cwid']; ?>
    <br><br>

<?php
$SSN = $_POST["student_cwid"];
$hostName = "localhost";
$userName = "cs332s29";
$password = "phaeg5Ku";
$dbName = $userName;

$conn = new mysqli($hostName, $userName, $password, $dbName);

if($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query4 = "select course_id, grade from enrollment_record where student_cwid = $SSN;";
$result = $conn->query($query4);

if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "Course ID: " . $row["course_id"] . " | ";
        echo "\t";
        echo "Grade Value: " . $row["grade"] . " | ";
        echo "<br>";
    }
}
else {
    echo "0 results";
}

$conn->close();
?>
</body>
</html>

