
##################################
# COMPROBAR SI EXISTE RUTA DPTOINFJMPP
##################################
$existe= Test-Path "C:\DPTOINFJMPP"

 
if ($existe -eq $True)
{
	#PUNTO DE CONTROL
	 Write-Output "La ruta ya existe"
}
Else 
{
	cd c:/
    mkdir DPTOINFJMPP
    cd DPTOINFJMPP
    mkdir Logs
    git clone https://github.com/nayugon/ProyectoFondo.git
    Rename-Item -Path "ProyectoFondo" -NewName "Wallpaper"
    cd Wallpaper
    npm install
    mv "C:\DPTOINFJMPP\Wallpaper\Fondo.vbs" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\fondo.vbs"
    #echo "C:\DPTOINFJMPP\Wallpaper\Fondo.vbs" >> inicio.ps1
    #echo "Cscript.exe C:\DPTOINFJMPP\Wallpaper\Fondo.vbs" >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\inicio.ps1"
	Write-Output "Se ha generado"
}


