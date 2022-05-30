FROM python:3.8-slim-buster

# Install freeview from FreeSurfer v7.2.0
RUN apt-get update -qq && apt-get install -yq \
    tar curl && \
    curl -sSL --retry 5 \
    https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.2.0/freesurfer-linux-ubuntu18_amd64-7.2.0.tar.gz \
    | tar xz -C /opt \
    freesurfer/bin/freeview \
    freesurfer/bin/qt.conf \
    freesurfer/lib/qt \
    freesurfer/lib/vtk

# Install packages needed make screenshots
RUN apt-get update -qq && \
    apt-get install -yq \
    bc libglu1 libgomp1 libxmu6 libxt6 \
    imagemagick ghostscript libgs-dev xvfb xauth qt5-default && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    chmod 777 /opt && chmod a+s /opt

# Set up environment
ENV FREESURFER_HOME /opt/freesurfer
ENV PATH=$PATH:/opt/freesurfer/bin:/usr/local/bin:/usr/bin:/bin

# Disable IM policy
RUN mv /etc/ImageMagick-6/policy.xml /etc/ImageMagick-6/policy.xml.off

# Make directories for IO to bind
RUN mkdir /INPUTS /OUTPUTS

# Copy in our scripts
COPY src /opt/src/
RUN chmod a+x /opt/src/*.sh
ENV PATH=/opt/src:$PATH

# Configure default script to run
ENTRYPOINT ["/bin/bash", "/opt/src/run.sh"]
