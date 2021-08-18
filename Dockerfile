FROM freesurfer/freesurfer:7.1.1

# Install matlab mcr as needed for new thalamus, hippo/amyg, brainstem
RUN yum install -y unzip wget java-1.8.0-openjdk
RUN mkdir /opt/mcr_install && \
    mkdir /opt/mcr && \
    wget -nv -P /opt/mcr_install \
    http://ssd.mathworks.com/supportfiles/downloads/R2014b/deployment_files/R2014b/installers/glnxa64/MCR_R2014b_glnxa64_installer.zip && \
    unzip -q /opt/mcr_install/MCR_R2014b_glnxa64_installer.zip -d /opt/mcr_install && \
    /opt/mcr_install/install -agreeToLicense yes -mode silent && \
    ln -s /usr/local/MATLAB/MATLAB_Compiler_Runtime/v84 /usr/local/freesurfer/MCRv84 && \
    rm -rf /opt/mcr_install

# Install packages needed to use freeview
RUN yum -y install libGLU mesa-dri-drivers

# Install packages needed to make screenshots in virtual frame buffer
RUN yum install -y xorg-x11-server-Xvfb xorg-x11-xauth which ImageMagick ghostscript

# Install python packages to run recon-stats
RUN yum install -y python-setuptools

# Install recon-stats for FS stats
COPY src /opt/src/
WORKDIR /opt/src/recon-stats
RUN python setup.py install

# Make sure other stuff is in path
RUN chmod a+x /opt/src/make_screenshots.sh
ENV PATH=/opt/src:$PATH

# Make directories for I/O to bind
RUN mkdir /INPUTS /OUTPUTS

# Configure default script to run
ENTRYPOINT ["/bin/bash", "/opt/src/run.sh"]
