#editar la variable apps con las aplicaciones a instalar
$apps="python", "aaaaaasdfaaaaaaaaadf" 
#archivo log
$log= "C:\InstalaDesdeElServer.log"

if (Test-Path -Path $log -PathType Leaf) {
	rm $log
}

echo "------------------------------------
--------------------------------------" >> $log
echo "$(Get-Date -format "HH:mm:ss ddd dd/MM/yyyy"): Iniciando Script.
--------------------------------------" >> $log

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

echo "$(Get-Date -format "HH:mm:ss ddd dd/MM/yyyy"): Verificado chocolatey." >> $log

foreach ($element in $apps) {
	echo "--------------------------------------" >> $log
	echo "$(Get-Date -format "HH:mm:ss ddd dd/MM/yyyy"): Instalando $element
	--------------------------------------" >> $log
	
	choco install $element --confirm >> $log
}

echo "---------------------" >> $log
echo "script finalizado">> $log
Get-Date >> $log 
echo "------------------------------------" >> $log