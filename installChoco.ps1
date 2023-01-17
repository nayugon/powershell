#editar la variable apps con las aplicaciones a instalar
$apps="python", "aaaaaasdfaaaaaaaaadf" 

rm C:\InstalaDesdeServer.log

echo "------------------------------------
--------------------------------------" >> C:\InstalaDesdeServer.log
echo "$(Get-Date -format "HH:mm:ss ddd dd/MM/yyyy"): Iniciando Script.
--------------------------------------" >> C:\InstalaDesdeServer.log

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

echo "$(Get-Date -format "HH:mm:ss ddd dd/MM/yyyy"): Verificado chocolatey." >> C:\InstalaDesdeServer.log

foreach ($element in $apps) {
	echo "--------------------------------------" >> C:\InstalaDesdeServer.log
	echo "$(Get-Date -format "HH:mm:ss ddd dd/MM/yyyy"): Instalando $element
	--------------------------------------" >> C:\InstalaDesdeServer.log
	
	choco install $element --confirm >> C:\InstalaDesdeServer.log
}

echo "---------------------" >> C:\InstalaDesdeServer.log
echo "script finalizado">> C:\InstalaDesdeServer.log
Get-Date >> C:\InstalaDesdeServer.log 
echo "------------------------------------" >> C:\InstalaDesdeServer.log
