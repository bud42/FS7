FROM freesurfer/freesurfer:7.2.0

# Install matlab mcr as needed for thalamus, hippo/amyg, brainstem
RUN yum install -y unzip wget java-1.8.0-openjdk
RUN source $FREESURFER_HOME/SetUpFreeSurfer.sh && fs_install_mcr R2014b

# Install packages needed make screenshots
RUN yum install -y imagemagick ghostscript

# Make directories for IO to bind
RUN mkdir /INPUTS /OUTPUTS

# Copy in our scripts
COPY src /opt/src/
RUN chmod a+x /opt/src/*.sh
ENV PATH=/opt/src:$PATH

# Configure default script to run
ENTRYPOINT ["/bin/bash", "/opt/src/run.sh"]
