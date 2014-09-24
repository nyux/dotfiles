#!/usr/bin/env python

import argparse
from subprocess import Popen, PIPE

brightness_control = '/sys/class/leds/phy0-led/brightness'
max_brightness = 3
min_brightness = 0

parser = argparse.ArgumentParser(description="Manipulate keyboard brightness.", prog="brightness")
group = parser.add_mutually_exclusive_group()

parser.add_argument('-k', '--keyboard', action='store_true', help="get keyboard brightness")
parser.add_argument('-m', '--monitor', action='store_true', help="get monitor brightness")
group.add_argument('-i', '--increment', action='store_true', help="increment keyboard brightness; needs sudo")
group.add_argument('-d', '--decrement', action='store_true', help="decrement keyboard brightness; needs sudo")


args = parser.parse_args()

if args.monitor:
    command = Popen(["xbacklight"], stdout=PIPE)
    output = command.communicate()[0].decode('utf-8')
    output = float(output)

    print('{0:.2f}'.format(output))
elif args.keyboard:
    with open(brightness_control, 'r') as brightness:

        value = brightness.read().strip()
        print(value)
elif args.increment or args.decrement:
    with open(brightness_control, 'r+') as brightness:

        value = brightness.read()
        value = int(value)

        if args.increment and value < max_brightness:
            value += 1
            value = str(value)
            brightness.write(value)
        elif args.decrement and value > min_brightness:
            value -= 1
            value = str(value)
            brightness.write(value)
