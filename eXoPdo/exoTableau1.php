<?php
$nombreJours = array(
    "Janvier" => 31,
    "Février" => 28, // où 29 
    "Mars" => 31,
    "Avril" => 30,
    "Mai" => 31,
    "Juin" => 30,
    "Juillet" => 31,
    "Août" => 31,
    "Septembre" => 30,
    "Octobre" => 31,
    "Novembre" => 30,
    "Décembre" => 31
);

echo '<table>';
echo '<tr>';
echo '<th>Mois</th>';
echo '<th>Nombre de jours</th>';
echo '</tr>';

foreach ($nombreJours as $mois => $nbJours) {
    echo '<tr>';
    echo '<td>' . $mois . '</td>';
    echo '<td>' . $nbJours . '</td>';
    echo '</tr>';
}

echo '</table>';

asort($nombreJours);

echo '<table>';
echo '<tr>';
echo '<th>Mois</th>';
echo '<th>Nombre de jours (trier)</th>';
echo '</tr>';

foreach ($nombreJours as $mois => $nbJours) {
    echo '<tr>';
    echo '<td>' . $mois . '</td>';
    echo '<td>' . $nbJours . '</td>';
    echo '</tr>';
}

echo '</table>';
