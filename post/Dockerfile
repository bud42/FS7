FROM python:3.8-slim-buster

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    bc libglu1 libgomp1 libxmu6 libxt6 tar curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && chmod 777 /opt && chmod a+s /opt

# Install freeview from FreeSurfer v7.2.0
RUN curl -sSL --retry 5 \
    https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.2.0/freesurfer-linux-ubuntu18_amd64-7.2.0.tar.gz \
    | tar xz -C /opt \
    freesurfer/bin/freeview \
    freesurfer/bin/qt.conf \
    freesurfer/lib/qt \
    freesurfer/lib/vtk

# Install packages needed make screenshots
RUN apt-get update -qq && apt-get install -yq \
    imagemagick ghostscript libgs-dev xvfb xauth qt5-default \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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

# Install python packages to run recon-stats
#RUN yum install -y python-setuptools

# Install recon-stats for FS stats
#COPY src /opt/src/
#WORKDIR /opt/src/recon-stats
#RUN python setup.py install

# Configure default script to run
ENTRYPOINT ["/bin/bash", "/opt/src/run.sh"]
