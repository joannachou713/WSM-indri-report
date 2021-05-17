stopwords=[]
#English stopwords from ftp://ftp.cs.cornell.edu/pub/smart/english.stop
stopwords = open('english.stop', 'r').read().split()

def clean(string):
    string = string.replace(".","")
    string = string.replace(",","")
    string = string.replace(":","")
    string = string.replace(":","")
    string = string.replace("[","")
    string = string.replace("]","")
    string = string.replace(")","")
    string = string.replace("(","")
    string = string.replace("{","")
    string = string.replace("}","")
    string = string.replace("/","")
    string = string.replace("?","")
    string = string.replace("!","")
    string = string.replace("’","")
    string = string.replace("'","")
    string = string.replace('"',"")
    string = string.replace('”',"")
    string = string.lower()
    return string


def removeStopWords(list):
    return [word for word in list if word not in stopwords ]

query_des_txt = open('proj2_sample_run/query_des.txt', 'r').read().split('\n')
query_des_clean = []
for query in query_des_txt:
    query = query.split()
    query = [clean(q) for q in query]
    query_des_clean.append(' '.join(removeStopWords(query)))
print('\n'.join(query_des_clean))
f = open('proj2_sample_run/query_des.txt', 'w')
f.write('\n'.join(query_des_clean))
f.close()