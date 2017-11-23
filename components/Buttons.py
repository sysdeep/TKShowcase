#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import tkinter
from tkinter import ttk




class Buttons(ttk.Frame):
	def __init__(self, master, *args, **kwargs):
		super(Buttons, self).__init__(master, *args, **kwargs)

		# self.configure(ipadx=20)
		self.img = tkinter.PhotoImage(file="img/smile_16.png")

		row = 0
		ttk.Button(self, text="Button", underline=2).grid(row=row, column=0)


		# row += 1
		# ttk.Label(self, text="background", background="green").grid(row=row, column=0)
		# ttk.Label(self, text="foreground", foreground="green").grid(row=row, column=1)

		# row += 1
		# ttk.Label(self, text="borderwidth = 10", borderwidth=10, background="green").grid(row=row, column=0)

		# row += 1
		# ttk.Label(self, text="w", anchor="w", width="20").grid(row=row, column=0)
		# ttk.Label(self, text="center", anchor="center", width="20").grid(row=row, column=1)
		# ttk.Label(self, text="e", anchor="e", width="20").grid(row=row, column=2)


		# row += 1
		# ttk.Label(self, text="flat", relief="flat", width="10").grid(row=row, column=0)
		# ttk.Label(self, text="raised", relief="raised", width="10").grid(row=row, column=1)
		# ttk.Label(self, text="sunken", relief="sunken", width="10").grid(row=row, column=2)
		# ttk.Label(self, text="groove", relief="groove", width="10").grid(row=row, column=3)
		# ttk.Label(self, text="ridge", relief="ridge", width="10").grid(row=row, column=4)
		# ttk.Label(self, text="center", anchor="center", width="20").grid(row=row, column=1)
		# ttk.Label(self, text="e", anchor="e", width="20").grid(row=row, column=2)
		# 
		# 
		row += 1
		ttk.Button(self, text="flat", image=self.img).grid(row=row, column=0)
		ttk.Button(self, text="bottom", image=self.img, compound="bottom").grid(row=row, column=1)
		ttk.Button(self, text="left", image=self.img, compound="left").grid(row=row, column=2)
		ttk.Button(self, text="right", image=self.img, compound="right").grid(row=row, column=3)
		ttk.Button(self, text="top", image=self.img, compound="top").grid(row=row, column=4)


		# row += 1
		# ttk.Label(self, text="heart", cursor="heart").grid(row=row, column=0)