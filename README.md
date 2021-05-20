# WSM-indri-report
This experiment use Indri-5.18 to run the 50 TREC queries against WT2G collection, and evaluate the returned ranked list. The implemented ranking functions containing vector space model(Okapi TF-IDF), language model and some smoothing functions. Besides tuning ranking functions, I also modify the queries according to the TREC queries description and the indexing methods. This report shows the findings after experimenting these metioned parameters combinations.
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
