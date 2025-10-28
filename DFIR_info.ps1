# 1. Definir el nombre del directorio de logs
$logDirectory = "info"

# 2. Comprobar si el directorio existe; si no, crearlo
if (-not (Test-Path -Path $logDirectory)) {
    New-Item -ItemType Directory -Path $logDirectory
    Write-Host "Directorio '$logDirectory' creado."
}

# 3. Entrar al directorio de logs (guardando la ubicación anterior)
Push-Location -Path $logDirectory
Write-Host "Cambiando al directorio $logDirectory..."

# 4. Generar una marca de tiempo única para esta ejecución
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
Write-Host "Usando timestamp: $timestamp"

# 5. Ejecutar los comandos y guardar la salida en archivos con timestamp
Write-Host "Ejecutando systeminfo..."
systeminfo | Out-File -FilePath "systeminfo_$timestamp.txt"

Write-Host "Ejecutando netstat -a..."
netstat -a | Out-File -FilePath "netstat_$timestamp.txt"

Write-Host "Ejecutando ipconfig..."
ipconfig | Out-File -FilePath "ipconfig_$timestamp.txt"

Write-Host "Ejecutando tasklist /V..."
tasklist /V | Out-File -FilePath "tasklist_completo_$timestamp.txt"

Write-Host "Ejecutando netstat -an (puertos abiertos)..."
netstat -an | Select-String -Pattern "listening" -CaseInsensitive | Out-File -FilePath "open_ports_$timestamp.txt"

Write-Host "Ejecutando net user..."
net user | Out-File -FilePath "usuarios_$timestamp.txt"

Write-Host "Ejecutando gpresult /r..."
gpresult /r | Out-File -FilePath "gpo_usuarios_$timestamp.txt"

Write-Host "Ejecutando query user..."
query user | Out-File -FilePath "usuarios_conectados_$timestamp.txt"

Write-Host "Ejecutando tracert a www.google.com..."
tracert www.google.com | Out-File -FilePath "tracert_$timestamp.txt"

# 6. Regresar al directorio original
Pop-Location

Write-Host "¡Proceso completado! Los archivos de log están en la carpeta '$logDirectory'."
