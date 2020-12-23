# singularity pull fs7_latest_new.sif docker://bud42/fs7

#singularity run \
#-B  \
#-B $HOME/freesurfer_license.txt:/usr/local/freesurfer/.license \
#/data/h_taylor/Imaging/SINGULARITY_IMAGES/FS7_latest\@7c1972c83a79004b12051734de2bb32b9c5c25cd.sif 

# singularity run \
# -B $HOME/freesurfer_license.txt:/usr/local/freesurfer/.license \
# -B /scratch/boydb1/test-FS7/INPUTS:/INPUTS \
# -B /scratch/boydb1/test-FS7/OUTPUTS:/OUTPUTS \
# fs7_latest.sif 

singularity shell \
-B $HOME/freesurfer_license.txt:/usr/local/freesurfer/.license \
-B /scratch/boydb1/test-FS7/INPUTS:/INPUTS \
-B /scratch/boydb1/test-FS7/OUTPUTS:/OUTPUTS \
fs7_latest.sif

cd /scratch/boydb1/ACOBA-FS7/

segmentHA_T1.sh 4400 /scratch/boydb1/ACOBA-FS7

