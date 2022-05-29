
# Make stats text files
cd /OUTPUTS/SUBJ/stats
/opt/src/make_stats.sh

# Create QA PDF
cd /OUTPUTS/SUBJ
xvfb-run -a --server-args "-screen 0 1920x1080x24" /opt/src/make_pdf.sh

echo "run DONE!"
