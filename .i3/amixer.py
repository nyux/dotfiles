#!/usr/bin/env python

# This is a rewrite of a two-line bash script found in
# the archlinux forums. The original didn't differentiate
# between when the card is muted or not. Thought that was
# a pretty important feature. Link to original:
# https://bbs.archlinux.org/viewtopic.php?pid=944037#p944037

import re
import subprocess
from subprocess import Popen, PIPE

command = Popen(["amixer", "get", "'Master',0"], stdout=PIPE)
output = command.communicate()[0].decode('utf-8')

volume = re.search("[0-9]{1,3}%", output).group()

# tests if the pattern (on|off) has occured right before
# an opening brace
mute = re.search(r"(?<=\[)(on|off)", output).group()

if mute == "on":
	print(volume)
else:
	print('muted')
