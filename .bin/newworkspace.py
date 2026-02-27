#!/usr/bin/env python
import json
import subprocess
import pandas as pd

data = pd.DataFrame(json.loads(subprocess.check_output(['i3-msg', '-t', 'get_workspaces'])))
nums = data.sort_values('num').reset_index(drop=True)
data.num.sort_values()
# LEFT IT HERE

nums['expect'] = range(1, nums.shape[0]+1)
missing = nums.expect.sub(nums.num)

returnval = 0
if missing.any():
    returnval = missing[missing != 0].index.values[0] + 1
else:
    returnval = nums.num.max() + 1

subprocess.run(['i3-msg', 'workspace', str(returnval)])
