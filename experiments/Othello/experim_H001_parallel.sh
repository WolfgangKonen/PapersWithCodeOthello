#!/bin/sh
# This script trains five Othello TCL4 agents with (eligibility) horizon cut 0.01 and five agents with horizon cut 0.10.
# After training, the agents are evaluated in a competition against Edax at different Edax levels 1,2,...,9.
#
# Difference to experim_H001.sh: the 10 training runs are done in 10 parallel jobs.
# Store trained agents and accompanying CSV in $train_out_dir_H001,H010. These directories should be initially empty or non-existing.
# Computation time: 
#	 - training   takes about  3h (time for slowest agent), if 10 parallel CPUs are fully available.
#	 - evaluation takes about  2h on a standalone standard CPU.
#
# Results are in directory agents/Othello: 
#    - trained agents and training CSV in $train_out_dir_H001, $train_out_dir_H010,
#    - evaluation results (solved rates) in csv/$csv_out_file_H001, csv/$csv_out_file_H010.
# Results of competition can be visualized with resources/R_plotTools/multiTrainOthello-H001.R.

csv_out_file_H001=multiOthello-H001.csv
csv_out_file_H010=multiOthello-H010.csv
train_out_dir_H001=multiTrain-H001
train_out_dir_H010=multiTrain-H010
echo $cd
echo $csv_out_file_H001
echo $csv_out_file_H010
echo $train_out_dir_H001
echo $train_out_dir_H010

# --- train the agents from stubs (parallel runs if multiple cores are there) ---
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 1 250000 $train_out_dir_H010 &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 1 250000 $train_out_dir_H010 &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 1 250000 $train_out_dir_H010 &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 1 250000 $train_out_dir_H010 &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 1 250000 $train_out_dir_H010 &

nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H001-FAm-stub.agt.zip 1 250000 $train_out_dir_H001 &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H001-FAm-stub.agt.zip 1 250000 $train_out_dir_H001 &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H001-FAm-stub.agt.zip 1 250000 $train_out_dir_H001 &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H001-FAm-stub.agt.zip 1 250000 $train_out_dir_H001 &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H001-FAm-stub.agt.zip 1 250000 $train_out_dir_H001 &


# --- evaluate the trained agents (only on Windows, needs edax.exe) ---
#java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 6 $train_out_dir_H001 10000 1 $csv_out_file_H001 
#java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 6 $train_out_dir_H010 10000 1 $csv_out_file_H010 