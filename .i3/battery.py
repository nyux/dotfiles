#!/usr/bin/python

with open('/sys/class/power_supply/BAT1/capacity') as batfile:
    percentage = int(batfile.read().strip())

    if percentage > 10:
        print(r"#9933CC", end='')
    else:
        print(r"#66CC33", end='')
