# HPC Scripts
## Job Launcher
job_launcher.sh is a script which helps in submission of multi-node jobs where we wish to run one command in one node of the job
```
qsub -I -P cse -lselect=3:ncpus=1:mem=20G:ngpus=1 -lwalltime=24:00:00 -v JOB_FILE=$HOME/sample_input.txt,DIR=$HOME/imojie,INITS='source ~/.zshrc; conda activate imojie_test_1' -- $HOME/imojie/jobs/job_launcher.sh
```
Parameters:\
JOB_FILE: The file containing the commands to be executed in each of the node. One command per line. sample_input.txt is an example file.\
DIR: The directory where the command should be executed\
INITS: Starting commands to execute before the main command\

The argument to lselect must match the number of lines in $JOB_FILE
