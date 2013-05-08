#!/usr/bin/env python

import argparse
from subprocess import Popen, PIPE

brightness_control = '/sys/devices/platform/samsung/'\
					'leds/samsung::kbd_backlight/brightness'
max_brightness = 8
min_brightness = 0

parser = argparse.ArgumentParser(description="Manipulate keyboard brightness.", prog="kbd_brightness")
group = parser.add_mutually_exclusive_group()

parser.add_argument('-k', '--keyboard', action='store_true')
group.add_argument('-i', '--increment', action='store_true')
group.add_argument('-d', '--decrement', action='store_true')
parser.add_argument('-m', '--monitor', action='store_true')

args = parser.parse_args()

with open(brightness_control, 'r+') as brightness:

	value = brightness.read()
	value = int(value)

	if args.keyboard:
		print(value)

	if args.increment and value < max_brightness:
		value += 1
		value = str(value)
		brightness.write(value)
	elif args.decrement and value > min_brightness:
		value -= 1
		value = str(value)
		brightness.write(value)

if args.monitor:
	command = Popen(["xbacklight"], stdout=PIPE)
	output = command.communicate()[0].decode('utf-8')
	output = float(output)

	print('{0:.2f}'.format(output))