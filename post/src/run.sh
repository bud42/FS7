# Run post processing for FreeSurfer 7 recon-all to make stats and PDF for DAX

# Make stats text file
cd /OUTPUTS/SUBJ/stats
/opt/src/make_stats.sh
mv /OUTPUTS/SUBJ/stats/stats.txt /OUTPUTS/

# Create QA PDF
cd /OUTPUTS/SUBJ
xvfb-run -a --server-args "-screen 0 1920x1080x24" /opt/src/make_pdf.sh
mv /OUTPUTS/SUBJ/report.pdf /OUTPUTS/

echo "run DONE!"
