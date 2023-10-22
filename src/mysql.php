<?php
// Datenbankverbindung herstellen
$servername = "localhost";
$username = "user";
$password = "geheim";
$dbname = "verkauf";

// Verbindung zur Datenbank herstellen
$conn = new mysqli($servername, $username, $password, $dbname);

// Überprüfen, ob die Verbindung erfolgreich hergestellt wurde
if ($conn->connect_error) {
    die("Verbindungsfehler: " . $conn->connect_error);
}

// Überprüfen, ob das Formular gesendet wurde
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Daten aus dem Formular abrufen
    $name = $_POST["name"];
    $adresse = $_POST["adresse"];
    
    // SQL-Abfrage zum Einfügen der Daten in die Tabelle "Kunden"
    $sql = "INSERT INTO kunden (name, adresse) VALUES ('$name', '$adresse')";
    
    if ($conn->query($sql) === TRUE) {
        echo "Eintrag erfolgreich hinzugefügt.";
    } else {
        echo "Fehler beim Hinzufügen des Eintrags: " . $conn->error;
    }
    echo "<br>";
}

// SQL-Abfrage zum Abrufen aller Einträge aus der Tabelle "Kunden"
$sql = "SELECT * FROM kunden";
$result = $conn->query($sql);

// Überprüfen, ob Ergebnisse vorhanden sind, und diese anzeigen
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID: " . $row["id"] . " - Name: " . $row["name"] . " - Adresse: " . $row["adresse"] . "<br>";
    }
} else {
    echo "Keine Einträge gefunden.";
}

// Verbindung schließen
$conn->close();
?>

<form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name"><br>
    <label for="adresse">Adresse:</label>
    <input type="text" id="adresse" name="adresse"><br>
    <input type="submit" value="Submit">
</form>

