## Sample command
qsub -I -P cse -lselect=1:ncpus=1:mem=20G:ngpus=1 -lwalltime=00:10:00 -v JOB_FILE=$HOME/imojie/jobs/imojie_repl_orig.txt,DIR=$HOME/imojie,INITS='source ~/.zshrc; conda activate imojie_test_1' -- $HOME/imojie/jobs/job_launcher.sh
