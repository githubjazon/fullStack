<?php
echo "<table>";
for ($i = 1; $i <= 12; $i++) {
    echo "<tr>";
    for ($jason = 1; $jason <= 12; $jason++) {
        echo "<td>" . $i * $jason . "</td>";
    }
    echo "</tr>";
}
echo "</table>";
?>
