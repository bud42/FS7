#!/bin/bash

# Make directories
mkdir /OUTPUTS/subjects

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

# Create QA PDFs
cd /OUTPUTS/subjects/SUBJECT && \
make_screenshots.sh SUBJECT && \
mv all.pdf /OUTPUTS/report.pdf

# Create stats file
export SUBJECTS_DIR=/OUTPUTS/subjects && \
python -c "\
from recon_stats import Subject;\
s = Subject('SUBJECT');\
s.get_measures();\
s.write('/OUTPUTS/stats.txt')"
