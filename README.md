# WSM-indri-report

## Download Indri-5.18
Link: https://sourceforge.net/projects/lemur/files/lemur/

Choose the `Indri-5.18` to download the right version

## Download Datasets and Datasets location
The file trees should look as the following shows
```
./WT2G
./Indri-5.18
./run
./result_imgs
./<other files>
```

## Run
```
./run/run.sh
```
This command will help you build index based on given parameters, the retrieved result will be generated at `./run/res_*.txt`

## Evaluation
The file `trec_eval` which is including in `./run/run.sh` will evaluate the retrieving methods based on each retrieved results in `res_*.txt`, and all of the `trec_eval` output will be printed into `./run/final_res.txt`

## Graphs
The program `get_result.py` draws interpolated precision curve and precision at k curve for each chosen retrieving method, it also calculates each method's F1, precision, recall, average precision and R-precision scores.
