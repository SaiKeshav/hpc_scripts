## Sample command
qsub -I -P cse -lselect=3:ncpus=1:mem=20G:ngpus=1 -lwalltime=24:00:00 -v JOB_FILE=$HOME/imojie/jobs/sample_input.txt,DIR=$HOME/imojie,INITS='source ~/.zshrc; conda activate imojie_test_1' -- $HOME/imojie/jobs/job_launcher.sh
