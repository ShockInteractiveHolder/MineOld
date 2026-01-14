@echo off
set DIR=%~dp0

if not exist "%DIR%natives" (
  echo Extracting LWJGL natives...
  tar -xf lwjgl-natives-windows.zip -C "%DIR%"
)

set JAVA_OPTS=-Djava.library.path=%DIR%natives

java %JAVA_OPTS% ^
  -cp "%DIR%rubydung.jar;%DIR%libs\lwjgl-2.9.3.jar;%DIR%libs\lwjgl_util-2.9.3.jar" ^
  com.mojang.rubydung.RubyDung

pause
