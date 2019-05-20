FROM mcr.microsoft.com/powershell:nanoserver-1809
RUN dir
RUN pwsh -Command Write-Host "Fisk"


# Install Chocolatey
RUN pwsh -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

# New Powershell, so choco is available 
SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Choco disable upload progress 
RUN choco feature disable --name showDownloadProgress

RUN choco -?
RUN choco --help
#RUN git clone https://github.com/KiCad/kicad-winbuilder.git
#RUN cd kicad-winbuilder
#RUN dir
