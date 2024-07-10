ARG MONO_VERSION=6.12.0

FROM mono:${MONO_VERSION}

LABEL name="choco-au"

ADD configure.sh /tmp

RUN cd /tmp && chmod 777 configure.sh && ./configure.sh

RUN echo "alias powershell='/usr/bin/pwsh'" >> ~/.bashrc

ARG CHOCOVERSION=stable

# Download, extract, and move chocolatey installer
WORKDIR /usr/local/src
RUN wget "https://github.com/chocolatey/choco/archive/${CHOCOVERSION}.tar.gz" && \
    tar -xzf "${CHOCOVERSION}.tar.gz" && \
    rm "${CHOCOVERSION}.tar.gz" && \
    mv "choco-${CHOCOVERSION}" choco

# Build chocolatey
WORKDIR /usr/local/src/choco
RUN chmod +x build.sh zip.sh
RUN ./build.sh -v

# Symlink the build output to our install directory
RUN ln -s /usr/local/src/choco/code_drop/chocolatey /opt/chocolatey

# Copy in the choco helper script
COPY bin/choco /usr/bin/choco

ENV ChocolateyInstall /opt/chocolatey

# Add the au module and load into powershell
RUN choco install au -y 

RUN echo 'Install-Module -Name AU -RequiredVersion 2020.11.21 -Force' | pwsh



 











