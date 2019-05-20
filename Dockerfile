FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN dir
RUN type License.txt
RUN git clone https://github.com/KiCad/kicad-winbuilder.git
RUN cd kicad-winbuilder
RUN dir
