import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

def saveImg(x, y, title, xlabel, ylabel):
    plt.figure(figsize=(8,4),dpi=100,linewidth = 2)
    plt.plot(x,y,'s-',color = 'r', label=title)
    plt.title(title, x=0.5, y=1.03)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
    plt.xlabel(xlabel, fontsize=10)
    plt.ylabel(ylabel, fontsize=10)
    plt.legend(loc = "best", fontsize=10)
    plt.savefig(f'result_img/{title}.png')

columns=['index', 'stop', 'rank_fn', 'query', 'interpolated_pcurve_data', 'p_at_k', 'f1', 'precision', 'recall', 'AP', 'RP']
recall_lv = [0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00]
p_at_doc_x = [5, 10, 15, 20, 30, 100, 200, 500, 1000]
all_data = []
with open('./run/final_res.txt', 'r') as f:
    results = f.read()
    for result in results.split('  ----------------------------------------------------------------\n'):
        result_lines = result.split('\n')
        title = result_lines[0]
        query_num = result_lines[2]
        corpus_infos = result_lines[4:7]
        interpolated_recall_ap = result_lines[8:19]
        ap_4all = float(result_lines[20])
        precisions = result_lines[22:31]
        r_precision = float(result_lines[32].split(':')[-1].lstrip())

        # corpus informations
        retrieved = float(corpus_infos[0].split(':')[-1].lstrip())
        relevant = float(corpus_infos[1].split(':')[-1].lstrip())   # TP+FN
        rel_ret = float(corpus_infos[2].split(':')[-1].lstrip())    # TP
        # P = TP/(TP + FP)
        precision = round(rel_ret/retrieved, 4)
        recall = round(rel_ret/relevant, 4)
        f1 = float(round(2/(1/precision+1/recall), 4))

        # visualize interpolated precision curve
        interpolated_pcurve_data = []
        for each in interpolated_recall_ap:
            each_data = each.split('       ')
            interpolated_pcurve_data.append(float(each_data[1]))
        # saveImg(recall_lv, interpolated_pcurve_data, f'{title} - Interpolated Precision Curve', 'Recall', 'interpolated precision')

        # Precisions 
        p_at_doc_y = []
        for p_lines in precisions:
            p = float(p_lines.split(':')[-1].lstrip())
            p_at_doc_y.append(p)
        # saveImg(p_at_doc_x, p_at_doc_y, f'{title} - Precision at K', 'At n docs', 'Precision')
        plt.close('all')

        
        # ['index', 'stop', 'rank_fn', 'query', 'interpolated_pcurve_data', 'p_at_k', 'f1', 'precision', 'recall']
        # save infos to dataframe
        titles = title.split(' ')
        all_data.append([titles[0], titles[1], titles[2], titles[3], interpolated_pcurve_data, p_at_doc_y, f1, precision, recall, ap_4all, r_precision])


all_data = pd.DataFrame(all_data, columns=columns)

def drawCombine(label, x, y, xlabel, ylabel):
    print(y)
    plt.plot(x, y, label=label)
    plt.xlabel(xlabel, fontsize=10)
    plt.ylabel(ylabel, fontsize=10)
    plt.legend(loc = "best")
def df2save_ipd(df):
    flg = plt.figure()
    df.apply(lambda row : drawCombine(row['rank_fn'], recall_lv, row['interpolated_pcurve_data'], 'Recall', 'interpolated precision'), axis=1)
    title = str(' '.join(df.loc[0,['index','stop','query']]))
    print(title)
    plt.title(title)
    plt.savefig(f'result_img/ipd/{title}-ipd.png')
    plt.close('all')
def df2save_pak(df):
    flg = plt.figure()
    df.apply(lambda row : drawCombine(row['rank_fn'], p_at_doc_x, row['p_at_k'], 'At n docs', 'Precision'), axis=1)
    title = str(' '.join(df.loc[0,['index','stop','query']]))
    print(title)
    plt.title(title)
    plt.savefig(f'result_img/pak/{title}-pak.png')
    plt.close('all')
# for ipd
nnn = all_data[(all_data['query']=='Normal') & (all_data['index']=='none') & (all_data['stop']=='none')].reset_index()
nns = all_data[(all_data['query']=='Normal') & (all_data['index']=='none') & (all_data['stop']=='Stop')].reset_index()
nsn = all_data[(all_data['query']=='Normal') & (all_data['index']=='Stem') & (all_data['stop']=='none')].reset_index()
nss = all_data[(all_data['query']=='Normal') & (all_data['index']=='Stem') & (all_data['stop']=='Stop')].reset_index()
dnn = all_data[(all_data['query']=='des') & (all_data['index']=='none') & (all_data['stop']=='none')].reset_index()
dns = all_data[(all_data['query']=='des') & (all_data['index']=='none') & (all_data['stop']=='Stop')].reset_index()
dsn = all_data[(all_data['query']=='des') & (all_data['index']=='Stem') & (all_data['stop']=='none')].reset_index()
dss = all_data[(all_data['query']=='des') & (all_data['index']=='Stem') & (all_data['stop']=='Stop')].reset_index()
qnn = all_data[(all_data['query']=='q+des') & (all_data['index']=='none') & (all_data['stop']=='none')].reset_index()
qns = all_data[(all_data['query']=='q+des') & (all_data['index']=='none') & (all_data['stop']=='Stop')].reset_index()
qsn = all_data[(all_data['query']=='q+des') & (all_data['index']=='Stem') & (all_data['stop']=='none')].reset_index()
qss = all_data[(all_data['query']=='q+des') & (all_data['index']=='Stem') & (all_data['stop']=='Stop')].reset_index()

'''
Generate All Interpolated Precision Curve and Precision@K curve
'''
all_cases = [nnn, nns, nsn, nss, dnn, dns, dsn, dss, qnn, qns, qsn, qss]
for case in all_cases:
    print(case)
    df2save_ipd(case)
    df2save_pak(case)


'''
Generate Grouped Data Graphs
'''
# print(all_data)

a = all_data.iloc[40]  
b = all_data.iloc[41]  
c = all_data.iloc[42]  
d = all_data.iloc[43]  
e = all_data.iloc[25]  
f = all_data.iloc[26]  

'''
Generate F1 Score Barchart(under different ranking function)
'''
X = ['Okapi', 'LM', 'LMJM', 'LMFB']
flg = plt.figure()
X_axis = np.arange(len(X))
plt.bar(X_axis, [a['f1'], b['f1'], c['f1'], d['f1']], color='blue', alpha=0.5)
# plt.bar(X_axis + 0.15, [d['f1'], e['f1'], f['f1']], 0.3, label='Description', color='teal', alpha=0.5)
plt.xticks(X_axis, X)
plt.legend(loc = "best")
title = 'Comparing Ranking Functions(add LMFB) F1 Score'
plt.title(title)
plt.savefig(f'result_img/add LMFB/{title}.png')
plt.show()

X = ['Okapi', 'LM', 'LMJM']
print(a, b, sep='\n')
flg = plt.figure()
X_axis = np.arange(len(X))
plt.bar(X_axis - 0.2,a['f1'], 0.2, label='Normal', color='teal', alpha=0.5)
plt.bar(X_axis,b['f1'], 0.2, label='Description', color='blue', alpha=0.5)
plt.bar(X_axis + 0.2,c['f1'], 0.2, label='Description with title', color='lightgreen', alpha=0.5)
plt.xticks(X_axis, X)
plt.legend(loc = "best")
title = 'Comparing Query Type F1 Score'
plt.title(title)
plt.savefig(f'result_img/compare query/{title}.png')
plt.show()

'''
Generate Interpolated Precision Curve and Precision@K curve
Under different ranking functions and different setting parameters
'''
#ipd
flg = plt.figure()
drawCombine('Okapi', recall_lv, a['interpolated_pcurve_data'], 'Recall', 'interpolated precision')
drawCombine('LM', recall_lv, b['interpolated_pcurve_data'], 'Recall', 'interpolated precision')
drawCombine('LMJM', recall_lv, c['interpolated_pcurve_data'], 'Recall', 'interpolated precision')
drawCombine('LMFB', recall_lv, d['interpolated_pcurve_data'], 'Recall', 'interpolated precision')
title = 'Comparing Ranking Functions(add LMFB) - interpolated_pcurve'
print(title)
plt.title(title)
plt.savefig(f'result_img/add LMFB/{title}-ipd.png')
plt.close('all')
#pak
flg = plt.figure()
drawCombine('Okapi', p_at_doc_x, a['p_at_k'], 'At n docs', 'Precision')
drawCombine('LM', p_at_doc_x, b['p_at_k'], 'At n docs', 'Precision')
drawCombine('LMJM', p_at_doc_x, c['p_at_k'], 'At n docs', 'Precision')
drawCombine('LMFB', p_at_doc_x, d['p_at_k'], 'At n docs', 'Precision')
title = 'Comparing Ranking Functions(add LMFB) - precision_at_K'
print(title)
plt.title(title)
plt.savefig(f'result_img/add LMFB/{title}-pak.png')
plt.close('all')


'''
Examine all retrieved results 
'''

sort_by_ipd = all_data.sort_values(by=['interpolated_pcurve_data'], ascending=False).reset_index()
print('interpolated_pcurve_data')
print(sort_by_ipd.iloc[:10])
sort_by_pak = all_data.sort_values(by=['p_at_k'], ascending=False).reset_index()
print('p_at_k')
print(sort_by_pak.iloc[:10])
sort_by_f1 = all_data.sort_values(by=['f1'], ascending=False).reset_index()
print('f1')
print(sort_by_f1.iloc[:10])
sort_by_precision = all_data.sort_values(by=['precision'], ascending=False).reset_index()
print('precision')
print(sort_by_precision.iloc[:10])
sort_by_recall = all_data.sort_values(by=['recall'], ascending=False).reset_index()
print('recall')
print(sort_by_recall.iloc[:10])
sort_by_ap = all_data.sort_values(by=['AP'], ascending=False).reset_index()
print('AP')
print(sort_by_ap.iloc[:10])
sort_by_rp = all_data.sort_values(by=['RP'], ascending=False).reset_index()
print('RP')
print(sort_by_rp.iloc[:10])
li = [sort_by_f1, sort_by_precision, sort_by_recall, sort_by_ap, sort_by_rp]
li_s = ['f1', 'precision', 'recall', 'AP', 'RP']
for each,s in zip(li, li_s):
    print(s)
    print(each.loc[:9, ['level_0','index','stop', 'rank_fn', 'query', 'f1', 'precision', 'recall', 'AP', 'RP']])