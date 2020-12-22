#!/bin/bash

# Make directories
mkdir /OUTPUT/subjects

# Run FreeSurfer init
recon-all \
-sd /OUTPUTS/subjects \
-s SUBJECT \
-i /INPUTS/T1.nii.gz

# Run the recon
recon-all \
-sd /OUTPUTS/subjects \
-s SUBJECT \
-all

# Additional Sub-Structures
segmentHA_T1.sh SUBJECT /OUTPUTS/subjects
segmentThalamicNuclei.sh SUBJECT /OUTPUTS/subjects
segmentBS.sh SUBJECT /OUTPUTS/subjects

# Unlink average brains so they don't get uploaded
#if [ -e /OUTPUTS/Subjects/fsaverage ]; then
#    unlink /OUTPUTS/Subjects/fsaverage
#fi
#if [ -e /OUTPUTS/Subjects/lh.EC_average ]; then
#    unlink /OUTPUTS/Subjects/lh.EC_average
#fi
#if [ -e /OUTPUTS/Subjects/rh.EC_average ]; then
#    unlink /OUTPUTS/Subjects/rh.EC_average
#fi

# Create QA PDFs
cd /OUTPUTS/subjects/SUBJECT && \
xvfb-run -e xvfb.err -f xvfb.auth --wait=5 -a \
--server-args "-screen 0 1920x1080x24" \
make_screenshots.sh SUBJECT && mv all.pdf /OUTPUTS/report.pdf

# Create stats file
export SUBJECTS_DIR=/OUTPUTS/subjects && \
python -c "from recon_stats import Subject;\
s = Subject('SUBJECT');s.get_measures();s.write('/OUTPUTS/stats.txt')"
