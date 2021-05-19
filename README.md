# WSM-indri-report

## Download Indri

## Download Datasets and Datasets location

## Run
```
./run/run.sh
```
This command will help you build index based on given parameters, the retrieved result will be generated at `./run/res_*.txt`

## Evaluation
The file `trec_eval` which is including in `./run/run.sh` will evaluate the retrieving methods based on each retrieved results in `res_*.txt`, and all of the `trec_eval` output will be printed into `./run/final_res.txt`

## Graphs
The program `get_result.py` draws 
