FROM mcr.microsoft.com/powershell:nanoserver-1809
RUN cd
RUN dir


RUN pwsh -Command Write-Host "Fisk"

RUN dir

COPY 7zip.exe .
COPY 7zip.msi .

RUN dir
RUN mkdir "C:\_tools"
RUN start /wait 7zip.exe /SD /D="C:\_tools\sss"

RUN start /wait 7zip.msi /q INSTALLDIR="C:\_tools"

#RUN pwsh -Command Start-Process msiexec.exe -Wait -ArgumentList '/I 7zip.msi /quiet INSTALLDIR="C:\_tools"'


RUN dir _tools
#RUN 7za.exe
RUN dir "C:\Program Files"
RUN C:\_tools\7za.exe --help

COPY cmake.zip .
RUN pwsh -Command  $ProgressPreference = 'SilentlyContinue' ; Expand-Archive -Path cmake.zip -DestinationPath _tools -Force
RUN dir _tools
RUN pwsh -Command Write-Host "Cmake install passsed"
RUN dir _tools\cmake-3.14.4-win64-x64\bin
RUN C:\_tools\cmake-3.14.4-win64-x64\bin\cmake.exe --version

ADD kicad-winbuilder kicad-winbuilder
#RUN git clone https://github.com/KiCad/kicad-winbuilder.git
RUN cd kicad-winbuilder && dir
#RUN cd kicad-winbuilder && C:\_tools\cmake-3.14.4-win64-x64\bin\cmake.exe --debug --trace -P KiCad-Winbuilder.cmake
RUN C:\_tools\cmake-3.14.4-win64-x64\bin\cmake.exe --debug --trace -P KiCad-Winbuilder.cmake
