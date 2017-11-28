#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import pkgutil

RUNMODE = "live"

if getattr( sys, 'frozen', False ) :
	RUNMODE = "bundle"
	print("bundle ---------------------------------------")
else :
	RUNMODE = "live"
	print("live =========================================")


DIR_SELF 		= os.path.dirname(os.path.abspath(__file__))
print("self dir: ", DIR_SELF)


def get_img(name):
	global RUNMODE
	return os.path.join(DIR_SELF, "img", name)
	#if RUNMODE == "live":
	#	return os.path.join(DIR_SELF, "img", name)
	#else:
	#	return pkgutil.get_data( 'img', name )
		
	
	# help_bin = pkgutil.get_data( 'helpmod', 'help_data.txt' )
