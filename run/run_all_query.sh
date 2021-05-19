#########################################################################################################
    # query and des
../indri-5.18/runquery/IndriRunQuery params/none/ret_LMFB.param query/query_and_des.txt > res_n_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_okapi.param query/query_and_des.txt > res_okapi_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_lm.param query/query_and_des.txt > res_lm_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_lm_jm.param query/query_and_des.txt > res_lm_jm_n_des.txt

../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_LMFB.param query/query_and_des.txt > res_stop_n_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_okapi.param query/query_and_des.txt > res_stop_okapi_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_lm.param query/query_and_des.txt > res_stop_lm_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_lm_jm.param query/query_and_des.txt > res_stop_lm_jm_n_des.txt

../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_stemmer_LMFB.param query/query_and_des.txt > res_stemmer_n_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_okapi_stemmer.param query/query_and_des.txt > res_okapi_stemmer_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_lm_stemmer.param query/query_and_des.txt > res_lm_stemmer_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_lm_jm_stemmer.param query/query_and_des.txt > res_lm_jm_stemmer_n_des.txt

../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_stemmer_LMFB.param query/query_and_des.txt > res_stop_stemmer_n_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_okapi_stemmer.param query/query_and_des.txt > res_stop_okapi_stemmer_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_lm_stemmer.param query/query_and_des.txt > res_stop_lm_stemmer_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_lm_jm_stemmer.param query/query_and_des.txt > res_stop_lm_jm_stemmer_n_des.txt


echo "none none Okapi Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_okapi.txt

echo "  ----------------------------------------------------------------"
echo "none none LM Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_lm.txt

echo "  ----------------------------------------------------------------"
echo "none none LMJM Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_jm.txt

echo "  ----------------------------------------------------------------"
echo "none none LMFB Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_LMFB.txt

echo "  ----------------------------------------------------------------"
echo "none Stop Okapi Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_okapi.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LM Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LMJM Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_jm.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LMFB Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_LMFB.txt


echo "  ----------------------------------------------------------------"
echo "Stem none Okapi Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_okapi_stemmer.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LM Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_stemmer.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LMJM Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_jm_stemmer.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LMFB Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stemmer_LMFB.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop Okapi Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_okapi_stemmer.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LM Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_stemmer.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LMJM Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_jm_stemmer.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LMFB Normal"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_stemmer_LMFB.txt
################################################################


echo "  ----------------------------------------------------------------"
echo "none none Okapi des"
perl eval/trec_eval eval/qrels.401-450.txt res_okapi_des.txt

echo "  ----------------------------------------------------------------"
echo "none none LM des"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_des.txt

echo "  ----------------------------------------------------------------"
echo "none none LMJM des"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_jm_des.txt

echo "  ----------------------------------------------------------------"
echo "none none LMFB des"
perl eval/trec_eval eval/qrels.401-450.txt res_des_LMFB.txt

echo "  ----------------------------------------------------------------"
echo "none Stop Okapi des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_okapi_des.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LM des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_des.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LMJM des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_jm_des.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LMFB des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_des_LMFB.txt


echo "  ----------------------------------------------------------------"
echo "Stem none Okapi des"
perl eval/trec_eval eval/qrels.401-450.txt res_okapi_stemmer_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LM des"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_stemmer_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LMJM des"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_jm_stemmer_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LMFB des"
perl eval/trec_eval eval/qrels.401-450.txt res_stemmer_des_LMFB.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop Okapi des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_okapi_stemmer_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LM des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_stemmer_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LMJM des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_jm_stemmer_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LMFB des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_stemmer_des_LMFB.txt
################################################################


echo "  ----------------------------------------------------------------"
echo "none none Okapi q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_okapi_n_des.txt

echo "  ----------------------------------------------------------------"
echo "none none LM q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_n_des.txt

echo "  ----------------------------------------------------------------"
echo "none none LMJM q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_jm_n_des.txt

echo "  ----------------------------------------------------------------"
echo "none none LMFB q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_n_des_LMFB.txt

echo "  ----------------------------------------------------------------"
echo "none Stop Okapi q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_okapi_n_des.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LM q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_n_des.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LMJM q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_jm_n_des.txt

echo "  ----------------------------------------------------------------"
echo "none Stop LMFB q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_n_des_LMFB.txt


echo "  ----------------------------------------------------------------"
echo "Stem none Okapi q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_okapi_stemmer_n_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LM q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_stemmer_n_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LMJM q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_lm_jm_stemmer_n_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem none LMFB q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stemmer_n_des_LMFB.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop Okapi q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_okapi_stemmer_n_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LM q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_stemmer_n_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LMJM q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_lm_jm_stemmer_n_des.txt

echo "  ----------------------------------------------------------------"
echo "Stem Stop LMFB q+des"
perl eval/trec_eval eval/qrels.401-450.txt res_stop_stemmer_n_des_LMFB.txt
