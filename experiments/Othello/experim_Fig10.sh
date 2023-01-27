#!/bin/sh
# This script repeats the experiment leading to Figure 10 (Sec. IV.E) in [ScheiermannKonen2022] "AlphaZero-Inspired Game Learning: Faster Training
# by Using MCTS Only at Test Time". Results might slightly differ due to random fluctuations, but should be statistically similar to Figure 04.

# This script trains 20 Othello TCL4 agents with 100 MCTS iterations during training with EX0 (exploration mode 0) and saves them in $train_out_dir.
# After training, the agents (with and without MCTS wrapper) are evaluated in a competition against Edax at different Edax levels 1,2,...,9.
#
# Store trained agents and accompanying CSV in $train_out_dir. This directory should be initially empty or non-existing.
# Computation times: 
#	 - training   takes about 90d (!!), if run on a standalone standard CPU. Too long, better use parallel training, see experim_Fig10_parallel.sh.
#	 - evaluation takes about  4h on a standalone standard CPU 
#
# Results are in directory agents/Othello: 
#    - trained agents and training CSV in $train_out_dir,
#    - evaluation results (solved rates) in csv/$csv_out_file, csv/$csv_out_file_MCTS.
# Results of competition can be visualized with resources/R_plotTools/multiTrainOthello-20batch.R.

csv_out_file=multiOthello-Fig10.csv
csv_out_file_W0=multiOthello-Fig04.csv
train_out_dir=multiTrain-Fig10
echo $cd
echo $csv_out_file
echo $csv_out_file_W0
echo $train_out_dir

# --- train the agents from stubs ---
java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 5 TCL4-100_7_250k-lam05_P4_H010-FAm-W100-EX0-stub.agt.zip 20 250000 $train_out_dir

# --- evaluate the trained agents (only on Windows, needs edax.exe) ---
java -ea -Xmx12096M -jar jartools/GBGBatch.jar Othello 6 $train_out_dir 1 10000 $csv_out_file 
