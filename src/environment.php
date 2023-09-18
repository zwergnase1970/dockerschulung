<?php

echo"<h1>Umgebungs Variablen</h1>";
echo "<h2>Hallo ".$_ENV["NAME"]."</h2><hr>";

// Alle Umgebungsvariablen ausgeben
foreach ($_ENV as $key => $value) {
    echo $key . ': ' . $value . '<br>';
}
?>
