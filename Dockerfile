FROM mcr.microsoft.com/powershell:nanoserver-1809
RUN cd
RUN dir
RUN pwsh -Command Write-Host "Fisk"

RUN pwsh -Command $PSVersionTable.PSVersion
RUN pwsh -Command Get-ExecutionPolicy

RUN pwsh -Command Invoke-WebRequest -Uri "https://github.com/dahlbyk/posh-git/archive/v0.7.3.1.zip" -OutFile "C:\Users\posh-git.zip"
RUN dir C:\Program Files\


#RUN pwsh -Command \
#  $ErrorActionPreference = 'Stop'; \
#  (New-Object System.Net.WebClient).DownloadFile('https://github.com/dahlbyk/posh-git/zipball/master','c:\posh-git.zip') ; \
#  Expand-Archive -Path c:\posh-git.zip -DestinationPath c:\

RUN dir
RUN pwsh -Command \
  $ErrorActionPreference = 'Stop'; \
  (New-Object System.Net.WebClient).DownloadFile('https://github.com/dahlbyk/posh-git/archive/v0.7.3.1.zip','c:\posh-git.zip') 
RUN dir


# Install Chocolatey
#RUN pwsh -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

# New Powershell, so choco is available 
#SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]


# Choco disable upload progress 
#RUN choco feature disable --name showDownloadProgress

#RUN choco -?
#RUN choco --help
RUN git clone https://github.com/KiCad/kicad-winbuilder.git
RUN cd kicad-winbuilder
RUN dir
RUN cmake -P KiCad-Winbuilder.cmake
