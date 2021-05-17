    #!/bin/sh
    #######################################################################
    # THIS IS THE TEST SCRIPT FOR THE INDRI QUERY LANGUAGE                #
    #######################################################################
    # First erase any existing files 
./clean.sh
mkdir index
    # Then prepare parameters
    #######################################################################
    # The following command builds a position index of the CACM database  #
    #  directly from a simple SGML format source                          #
    # Note that the version of database.sgml used has been modified to    #
    # include <TEXT> tags around the body of each document.               #
    # Uses the stopword list provided in smallstop_param.                 #
    #######################################################################

../indri-5.18/buildindex/IndriBuildIndex params/index/index.param
../indri-5.18/buildindex/IndriBuildIndex params/index/index_stop.param
../indri-5.18/buildindex/IndriBuildIndex params/index/index_stemmer.param
../indri-5.18/buildindex/IndriBuildIndex params/index/index_stemmer_stop.param
    # Build index with some stopwords
    #IndriBuildIndex index_indri_with_stop.param

    #######################################################################
    # The following shows how to run simple retrieval                     #
    # experiments with indri query language queries.                      #
    #######################################################################

    # simple query retrieval example
    # origin query
../indri-5.18/runquery/IndriRunQuery params/none/ret_LMFB.param query/query.txt > res_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_okapi.param query/query.txt > res_okapi.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_lm.param query/query.txt > res_lm.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_lm_jm.param query/query.txt > res_lm_jm.txt

../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_LMFB.param query/query.txt > res_stop_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_okapi.param query/query.txt > res_stop_okapi.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_lm.param query/query.txt > res_stop_lm.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_lm_jm.param query/query.txt > res_stop_lm_jm.txt

../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_stemmer_LMFB.param query/query.txt > res_stemmer_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_okapi_stemmer.param query/query.txt > res_okapi_stemmer.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_lm_stemmer.param query/query.txt > res_lm_stemmer.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_lm_jm_stemmer.param query/query.txt > res_lm_jm_stemmer.txt

../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_stemmer_LMFB.param query/query.txt > res_stop_stemmer_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_okapi_stemmer.param query/query.txt > res_stop_okapi_stemmer.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_lm_stemmer.param query/query.txt > res_stop_lm_stemmer.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_lm_jm_stemmer.param query/query.txt > res_stop_lm_jm_stemmer.txt
#########################################################################################################
    # query des stop
../indri-5.18/runquery/IndriRunQuery params/none/ret_LMFB.param query/query_des.txt > res_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_okapi.param query/query_des.txt > res_okapi_des.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_lm.param query/query_des.txt > res_lm_des.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_lm_jm.param query/query_des.txt > res_lm_jm_des.txt

../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_LMFB.param query/query_des.txt > res_stop_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_okapi.param query/query_des.txt > res_stop_okapi_des.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_lm.param query/query_des.txt > res_stop_lm_des.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_lm_jm.param query/query_des.txt > res_stop_lm_jm_des.txt

../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_stemmer_LMFB.param query/query_des.txt > res_stemmer_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_okapi_stemmer.param query/query_des.txt > res_okapi_stemmer_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_lm_stemmer.param query/query_des.txt > res_lm_stemmer_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_lm_jm_stemmer.param query/query_des.txt > res_lm_jm_stemmer_des.txt

../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_stemmer_LMFB.param query/query_des.txt > res_stop_stemmer_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_okapi_stemmer.param query/query_des.txt > res_stop_okapi_stemmer_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_lm_stemmer.param query/query_des.txt > res_stop_lm_stemmer_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_lm_jm_stemmer.param query/query_des.txt > res_stop_lm_jm_stemmer_des.txt
#########################################################################################################
    # query and des
../indri-5.18/runquery/IndriRunQuery params/none/ret_LMFB.param query/query_des.txt > res_n_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_okapi.param query/query_des.txt > res_okapi_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_lm.param query/query_des.txt > res_lm_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/none/ret_lm_jm.param query/query_des.txt > res_lm_jm_n_des.txt

../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_LMFB.param query/query_des.txt > res_stop_n_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_okapi.param query/query_des.txt > res_stop_okapi_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_lm.param query/query_des.txt > res_stop_lm_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/none_stop/ret_stop_lm_jm.param query/query_des.txt > res_stop_lm_jm_n_des.txt

../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_stemmer_LMFB.param query/query_des.txt > res_stemmer_n_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_okapi_stemmer.param query/query_des.txt > res_okapi_stemmer_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_lm_stemmer.param query/query_des.txt > res_lm_stemmer_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer/ret_lm_jm_stemmer.param query/query_des.txt > res_lm_jm_stemmer_n_des.txt

../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_stemmer_LMFB.param query/query_des.txt > res_stop_stemmer_n_des_LMFB.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_okapi_stemmer.param query/query_des.txt > res_stop_okapi_stemmer_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_lm_stemmer.param query/query_des.txt > res_stop_lm_stemmer_n_des.txt
../indri-5.18/runquery/IndriRunQuery params/stemmer_stop/ret_stop_lm_jm_stemmer.param query/query_des.txt > res_stop_lm_jm_stemmer_n_des.txt

./run_all_query.sh > final_res.txt