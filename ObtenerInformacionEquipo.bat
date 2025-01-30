
@echo off
Title Comando Obteniendo información del equipo
@echo off
@echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo ::::::::                                                ::::::::
@echo :::::::: Comando para Obteniendo información del equipo ::::::::
@echo ::::::::                                                ::::::::
@echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo ::                                                            ::
@echo ::                   Apasionado de las TICs                   ::
@echo ::      Comando para Obteniendo información del equipo        ::
@echo ::                                                            ::
@echo ::             $author Ing._Cesar_Paulino.dll                 ::
@echo ::                                                            ::
@echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
echo Obteniendo información del equipo...

:: Definir la ruta de la carpeta
set "carpeta=C:\Informes"

:: Verificar si la carpeta existe, si no, crearla
if not exist "%carpeta%" (
    echo Creando la carpeta "%carpeta%"...
    mkdir "%carpeta%"
)

:: Preguntar al usuario el nombre del archivo
set /p "nombreArchivo=Por favor, ingresa el nombre del archivo (sin extensión): "
set "archivo=%carpeta%\%nombreArchivo%.txt"

:: Verificar si el archivo ya existe
if exist "%archivo%" (
    echo El archivo "%archivo%" ya existe. Por favor, elige otro nombre.
    pause
    exit /b 1
)

:: Crear el archivo de salida
echo Información del equipo > "%archivo%"
echo ===================== >> "%archivo%"
echo. >> "%archivo%"

:: 1. Información del sistema
echo Información del sistema: >> "%archivo%"
systeminfo | findstr /B /C:"Nombre del equipo" /C:"Sistema operativo" /C:"Fabricante del sistema" /C:"Modelo del sistema" >> "%archivo%"
echo. >> "%archivo%"

:: 2. Información de la CPU
echo Información de la CPU: >> "%archivo%"
wmic cpu get Name,NumberOfCores,MaxClockSpeed /value | findstr /V "^$" >> "%archivo%"
echo. >> "%archivo%"

:: 3. Información de la memoria RAM
echo Información de la memoria RAM: >> "%archivo%"
wmic memorychip get Capacity /value | findstr /V "^$" >> "%archivo%"
echo. >> "%archivo%"

:: 4. Información del disco duro
echo Información del disco duro: >> "%archivo%"
wmic logicaldisk get Size,FreeSpace /value | findstr /V "^$" >> "%archivo%"
echo. >> "%archivo%"

:: 5. Información de red
echo Información de red: >> "%archivo%"
ipconfig | findstr /B /C:"IPv4" /C:"Dirección física" >> "%archivo%"
echo. >> "%archivo%"

:: 6. Información de la GPU
echo Información de la GPU: >> "%archivo%"
wmic path win32_videocontroller get name /value | findstr /V "^$" >> "%archivo%"
echo. >> "%archivo%"

echo La información del equipo se ha guardado en "%archivo%".
pause
