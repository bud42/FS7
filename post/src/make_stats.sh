# Make stats file

#ETIV
echo -n fs7_etiv=>stats.txt
grep EstimatedTotalIntraCranialVol aseg.stats|cut -d ',' -f 4|xargs>>stats.txt

echo -n fs7_stnv=>>stats.txt
grep SupraTentorialNotVent aseg.stats|cut -d ',' -f 4|xargs>>stats.txt

# HPC
echo -n fs7_hpc_lh=>>stats.txt
grep Right-Hip aseg.stats|tr -s ' '|cut -d' ' -f 5|xargs>>stats.txt

echo -n fs7_hpc_rh=>>stats.txt
grep Left-Hip aseg.stats|tr -s ' '|cut -d' ' -f 5 |xargs>>stats.txt

# Lat Vents
echo -n fs7_latvent_lh=>>stats.txt
grep Left-Lateral-V aseg.stats|tr -s ' '|cut -d' ' -f 5|xargs>>stats.txt

echo -n fs7_latvent_rh=>>stats.txt
grep Right-Lateral-V aseg.stats|tr -s ' ' |cut -d' ' -f 5|xargs>>stats.txt

# Superior Frontal Thickness
echo -n fs7_supflobe_lh=>>stats.txt
grep -i superiorfront lh.aparc.stats|tr -s ' '|cut -d' ' -f 5|xargs>>stats.txt

echo -n fs7_supflobe_rh=>>stats.txt
grep -i superiorfront rh.aparc.stats|tr -s ' '|cut -d' ' -f 5|xargs>>stats.txt

# Create stats file
#export SUBJECTS_DIR=/OUTPUTS/subjects && \
#python -c "\
#from recon_stats import Subject;\
#s = Subject('SUBJECT');\
#s.get_measures();\
#s.write('/OUTPUTS/stats.txt')"
