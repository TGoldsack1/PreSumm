'''
Convert my data into the expectd format:
.story file, a space between every sentence, summary sentences at the end with @highlight before them
'''

import json
import os

data_fps = [
  "./data/eLife/test.json", 
  "./data/PLOS/test.json",
  "./data/eLife/val.json",
  "./data/PLOS/val.json",
  "./data/eLife/train.json",
  "./data/PLOS/train.json"
  ]

for fp in data_fps:
  with open(fp, "r") as in_file:
    data = json.loads(in_file.read())

  out_path = "./raw_data/" + fp.split("/")[2] + "/" + fp.split("/")[3].split(".")[0]
  
  if not os.path.exists(out_path):
    os.makedirs(out_path)

  for inst_dict in data:
    doc = inst_dict['abstract'] +  [item for sublist in inst_dict['sections'] for item in sublist]
    summ = inst_dict['summary']


    with open(f"{out_path}/{inst_dict['id']}.story", "w") as out_file:
      for line in doc:
        out_file.write(f"{line}\n\n")
      
      for line in summ:
        out_file.write("@highlight\n\n")
        out_file.write(f"{line}\n\n")
