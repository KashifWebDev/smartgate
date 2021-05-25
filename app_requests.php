<?php
require 'parts/db.php';

$result = mysqli_query($con,"SELECT * FROM app_requests ORDER BY id DESC LIMIT 30");

echo "<table border='1'>
<tr>
<th>Mobile MAC</th>
<th>Machine MAC</th>
<th>Request</th>
<th>Date Time</th>
</tr>";

while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $row['mobile_mac'] . "</td>";
echo "<td>" . $row['machine_mac'] . "</td>";
echo "<td>" . $row['request'] . "</td>";
echo "<td>" . $row['date_time'] . "</td>";
echo "</tr>";
}
echo "</table>";

mysqli_close($con);
?>