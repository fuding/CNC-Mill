#!/usr/bin/python

import sys
import os.path
import subprocess


argv = sys.argv
isfile=os.path.isfile


if len(argv) == 2:
	if isfile(argv[1]) == True:
		rv=subprocess.call(["./slic3r.pl", argv[1]])
		exit(rv)
	else:
		print "'%s' is not a valid input stl file path" %(argv[1])
		exit(1)

elif len(argv) == 3:
	if isfile(argv[1]) == True:
		if isfile(argv[2]) == False:
			rv=subprocess.call(["./slic3r.pl", argv[1], "-o", argv[2]])
			exit(rv)
		else:
			print "'%s' is already used" %(argv[2])
			exit(1)
	else:
		print "'%s' is not a valid input file name" %(argv[1])
		exit(1)
else:
	print "Usage: stl2g [INPUT FILE PATH] [OUTPUT FILE PATH]"
	exit(2)
