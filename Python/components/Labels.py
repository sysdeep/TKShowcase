#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import tkinter
from tkinter import ttk
from rc import get_img



class Labels(ttk.Frame):
	def __init__(self, master, *args, **kwargs):
		super(Labels, self).__init__(master, *args, **kwargs)

		# self.configure(ipadx=20)
		self.img = tkinter.PhotoImage(file=get_img("smile.png"))

		row = 0
		ttk.Label(self, text="regular label").grid(row=row, column=0)

		row += 1
		ttk.Label(self, text="background=green", background="green").grid(row=row, column=0)
		ttk.Label(self, text="foreground=green", foreground="green").grid(row=row, column=1)
		# ttk.Label(self, text="activeforeground", activeforeground="green").grid(row=row, column=2)

		row += 1
		ttk.Label(self, text="borderwidth = 10", borderwidth=10, background="green").grid(row=row, column=0)

		row += 1
		ttk.Label(self, text="anchor=w", anchor="w", width="20").grid(row=row, column=0)
		ttk.Label(self, text="anchor=center", anchor="center", width="20").grid(row=row, column=1)
		ttk.Label(self, text="anchor=e", anchor="e", width="20").grid(row=row, column=2)


		row += 1
		ttk.Label(self, text="relief=flat", relief="flat", width="10").grid(row=row, column=0)
		ttk.Label(self, text="relief=raised", relief="raised", width="10").grid(row=row, column=1)
		ttk.Label(self, text="relief=sunken", relief="sunken", width="10").grid(row=row, column=2)
		ttk.Label(self, text="relief=groove", relief="groove", width="10").grid(row=row, column=3)
		ttk.Label(self, text="relief=ridge", relief="ridge", width="10").grid(row=row, column=4)



		row += 1
		ttk.Label(self, text="flat", image=self.img).grid(row=row, column=0)
		ttk.Label(self, text="compound=bottom", image=self.img, compound="bottom").grid(row=row, column=1)
		ttk.Label(self, text="compound=left", image=self.img, compound="left").grid(row=row, column=2)
		ttk.Label(self, text="compound=right", image=self.img, compound="right").grid(row=row, column=3)
		ttk.Label(self, text="compound=top", image=self.img, compound="top").grid(row=row, column=4)


		row += 1
		ttk.Label(self, text="cursor=heart", cursor="heart").grid(row=row, column=0)