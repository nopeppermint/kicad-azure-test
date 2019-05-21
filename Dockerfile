FROM mcr.microsoft.com/powershell:nanoserver-1809
RUN cd
RUN dir


RUN pwsh -Command Write-Host "Fisk"

RUN dir



COPY cmake.zip .
RUN pwsh -Command  $ProgressPreference = 'SilentlyContinue' ; Expand-Archive -Path cmake.zip -DestinationPath _tools -Force
RUN dir _tools

RUN pwsh -Command Write-Host "Cmake install passsed"
RUN dir _tools\cmake-3.14.4-win64-x64\bin
RUN C:\_tools\cmake-3.14.4-win64-x64\bin\cmake.exe --version

#RUN pwsh -Command \
#  $ErrorActionPreference = 'Stop'; \
#  (New-Object System.Net.WebClient).DownloadFile('https://github.com/dahlbyk/posh-git/zipball/master','c:\posh-git.zip') ; \
#  Expand-Archive -Path c:\posh-git.zip -DestinationPath c:\

# Install Chocolatey
#RUN pwsh -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

# New Powershell, so choco is available 
#SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]


# Choco disable upload progress 
#RUN choco feature disable --name showDownloadProgress

#RUN choco -?
#RUN choco --help

ADD kicad-winbuilder kicad-winbuilder
#RUN git clone https://github.com/KiCad/kicad-winbuilder.git
RUN cd kicad-winbuilder && dir
RUN cd kicad-winbuilder && C:\_tools\cmake-3.14.4-win64-x64\bin\cmake.exe -P KiCad-Winbuilder.cmake
