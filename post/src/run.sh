# Create QA PDFs
cd /OUTPUTS/SUBJECT

make_pdf.sh

# Create stats file
#export SUBJECTS_DIR=/OUTPUTS/subjects && \
#python -c "\
#from recon_stats import Subject;\
#s = Subject('SUBJECT');\
#s.get_measures();\
#s.write('/OUTPUTS/stats.txt')"
