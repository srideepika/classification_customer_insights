from monkeylearn import MonkeyLearn
import sys
 
ml = MonkeyLearn('e4faa14831a054ca984d68d03217abb362a3d1f3')
text_list = sys.argv[1:]
module_id = 'cl_hh4fnrLR'
res = ml.classifiers.classify(module_id, text_list, sandbox=True)
print res.result
