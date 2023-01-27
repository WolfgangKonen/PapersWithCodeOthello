#!/bin/sh
# This script repeats the experiment leading to Figure 04 (Sec. IV.A) in [ScheiermannKonen2022] "AlphaZero-Inspired Game Learning: Faster Training
# by Using MCTS Only at Test Time". Results might slightly differ due to random fluctuations, but should be statistically similar to Figure 04.

# This script trains 20 Othello TCL4 agents with (eligibility) horizon cut 0.10 and saves them in $train_out_dir.
# Difference to experim_Fig04.sh: the 20 training runs are done in 5 parallel jobs.
# After training, the agents (with and without MCTS wrapper) are evaluated in a competition against Edax at different Edax levels 1,2,...,9.
# Additionally, a plain MCTS with 10000 iterations per move is evaluated over 20 repeated runs in an equivalent competition against Edax.
#
# Store trained agents and accompanying CSV in $train_out_dir. This directory should be initially empty or non-existing.
# Computation times: 
#	 - training   takes about 8h, if run on 5 parallel cores (2h for each H010 agent, 4 agents per core). 
#	 - evaluation takes about 5h on a standalone standard CPU (4h for TCL4 agents, for 1h MCTS agents).
#
# Results are in directory agents/Othello: 
#    - trained agents and training CSV in $train_out_dir,
#    - evaluation results (solved rates) in csv/$csv_out_file, csv/$csv_out_file_MCTS.
# Results of competition can be visualized with resources/R_plotTools/multiTrainOthello-20batch.R.

csv_out_file=multiOthello-Fig04.csv
csv_out_file_MCTS=multiOthello-Fig04-MCTS.csv
train_out_dir=multiTrain-Fig04
echo $cd
echo $csv_out_file
echo $csv_out_file_MCTS
echo $train_out_dir

# --- train the agents from stubs ---
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 4 250000 $train_out_dir &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 4 250000 $train_out_dir &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 4 250000 $train_out_dir &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 4 250000 $train_out_dir &
nohup java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-stub.agt.zip 4 250000 $train_out_dir &

# --- evaluate the trained agents (only on Windows, needs edax.exe) ---
#     execute the following commands only after training is finished
#java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 6 $train_out_dir 1 10000 $csv_out_file 
#java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 7 MCTS-10000.agt.zip 20 0 $csv_out_file_MCTS 