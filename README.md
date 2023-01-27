# PapersWithCodeOthello
 
This document describes how to exactly reproduce the experiments in [Scheier2022]

[Scheier2022] Scheiermann, Johannes; Konen, Wolfgang: „AlphaZero-Inspired Game Learning: Faster Training by Using MCTS Only at Test Time”, IEEE Transactions on Games, 2022,  [https://dx.doi.org/10.1109/TG.2022.3206733](doi:10.1109/TG.2022.3206733), preprint available at [https://arxiv.org/abs/2204.13307](https://arxiv.org/abs/2204.13307).

## Preliminaries
Download GBG from [https://github.com/WolfgangKonen/GBG](https://github.com/WolfgangKonen/GBG), start or compile it according to [https://github.com/WolfgangKonen/GBG/wiki/Install-and-Configure](https://github.com/WolfgangKonen/GBG/wiki/Install-and-Configure) 
If not present, build `jartools/GBGBatch.jar`.
Syntax:
   `GBGBatch gameName n agentFile [ nruns maxGameNum csvFile scaPar0 scaPar1 scaPar2 propsName ]`

`propsName` codes the properties file name. If not given, it defaults to `props_batch.txt`.
For more information on `GBGBatch`, see the extensive Javadoc in `GBGBatch.java`.

For more information on the shell scripts found in [experiments/](../tree/master/experiments/), see [Papers-with-Code-Othello.pdf](../tree/master/Papers-with-Code-Othello.pdf).

