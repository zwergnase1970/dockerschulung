# Funktion zum Starten des Docker-Containers
function Start-DockerContainer {
    param (
        [string] $containername,
        [int]$port
    )
    
    Write-Host "Starte $containername auf Port $port" -ForegroundColor Green
    docker run -d --name "$($containername)" -p "$($port):3000" lscr.io/linuxserver/webtop:ubuntu-xfce-version-38152da9
}

# Benutzereingabe für Portbereich
$fromPort = Read-Host "Gib die Start-Portnummer ein (Default: 3000):"
$toPort = Read-Host "Gib die End-Portnummer ein (Default: 3010):"

# Überprüfung der Eingabe oder Verwendung der Default-Werte
if ([string]::IsNullOrEmpty($fromPort)) {
    $fromPort = 3000
}
if ([string]::IsNullOrEmpty($toPort)) {
    $toPort = 3010
}

# Schleife zum Starten der Container
for ($i = [int]$fromPort; $i -le [int]$toPort; $i++) {
    Start-DockerContainer "linux$i" $i
}

Read-Host "Return zum Stoppen der Container"

for ($i = [int]$fromPort; $i -le [int]$toPort; $i++) {
    Write-Host "Stoppe Linux$i auf Port $i" -ForegroundColor Red
    docker stop "linux$i"
    docker rm "linux$i"
}

