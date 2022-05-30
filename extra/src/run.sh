# Process FreeSurfer 7 Additional Sub-Structures and make stats and PDF

echo "Hippocampus Amygdala"

# Run Hippocampus Amygdala
segmentHA_T1.sh SUBJ /OUTPUTS

echo "Thalamus"

# Run Thalamas
segmentThalamicNuclei.sh SUBJ /OUTPUTS

echo "Brainstem"

# Run Brainstem
segmentBS.sh SUBJ /OUTPUTS

echo "Make stats"

# Make stats text file
cd /OUTPUTS/SUBJ/stats
/opt/src/make_stats.sh
mv /OUTPUTS/SUBJ/stats/stats.txt /OUTPUTS/

echo "Make PDF"

# Create QA PDF
cd /OUTPUTS/SUBJ
xvfb-run -a --server-args "-screen 0 1920x1080x24" /opt/src/make_pdf.sh
mv /OUTPUTS/SUBJ/report.pdf /OUTPUTS/

echo "run DONE!"
