<!DOCTYPE html>
<html>
<body>
    Your SSN Number is: <?php echo $_POST['ssn']; ?>
    <br><br>
<?php
$SSN = $_POST["ssn"];
$hostName = "localhost";
$userName = "cs332s29";
$password = "phaeg5Ku";
$dbName = $userName;

$conn = new mysqli($hostName, $userName, $password, $dbName);

if($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "select c.course_title, s.classroom, s.meeting_days, s.beginning_time, s.ending_time from Professor p, Course c, Course_Sections s where p.ssn_number = '$SSN' and p.ssn_number = s.prof_ssn and s.course_id = c.course_id;";
$result = $conn->query($sql);

if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "Class Title: " . $row["course_title"] . " | ";
        echo "\t";
        echo "Classroom: " . $row["classroom"] . " | ";
        echo "\t";
        echo "Meeting Days: " . $row["meeting_days"] . " | ";
        echo "\t";
        echo "Class Time: " . $row["beginning_time"] . ' - ' . $row["ending_time"] . " | ";
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

