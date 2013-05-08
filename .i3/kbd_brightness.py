#!/usr/bin/env python

import argparse

brightness_control = '/sys/devices/platform/samsung/'\
					'leds/samsung::kbd_backlight/brightness'

parser = argparse.ArgumentParser(description="Manipulate keyboard brightness.", prog="kbd_brightness")
group = parser.add_mutually_exclusive_group()

parser.add_argument('-p', '--print', action='store_true')
group.add_argument('-i', '--increment', action='store_true')
group.add_argument('-d', '--decrement', action='store_true')

args = parser.parse_args()

with open(brightness_control, 'r+') as brightness:

	value = brightness.read()
	value = int(value)

	if args.print:
		print(value)

	if args.increment:
		value += 1
		value = str(value)
		brightness.write(value)
	elif args.decrement:
		value -= 1
		value = str(value)
		brightness.write(value)
