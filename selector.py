#!/usr/bin/env python
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

pins = [8,10,16]

for pin in pins:
	GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)

output = ''
for pin in pins:

	if not GPIO.input(pin):
		output+= '1'
	else:
		output += '0'

output = output[::-1]
print(output)
