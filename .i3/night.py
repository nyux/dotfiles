#!/usr/bin/env python

import os
import os.path
import subprocess
from subprocess import Popen, PIPE

night_file = "/tmp/night_file"

if os.path.exists(night_file):
    os.remove(night_file)
    Popen("xcalib -c".split())
else:
    open(night_file, "w").close()
    Popen("xcalib -co 50 -a".split())
