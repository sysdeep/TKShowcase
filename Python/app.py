#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import tkinter
from tkinter import ttk


from components.Labels import Labels
from components.Buttons import Buttons
from components.LabelFrames import LabelFrames

from demoapp.DemoApp import DemoApp

DIR_SELF 		= os.path.dirname(os.path.abspath(__file__))
print("self dir: ", DIR_SELF)



class MainWindow(tkinter.Tk):
	def __init__(self):
		super(MainWindow, self).__init__()

		self.name = "TKShowcase"
		self.title(self.name)
		self.minsize(800, 400)

		self.main_layout = ttk.Frame(self)
		self.main_layout.pack(fill="both", expand=True)





		self.tabs = ttk.Notebook(self.main_layout)
		self.tabs.pack(fill="both", expand=True)





		#--- pages		
		labels_frame = Labels(self.tabs)
		self.tabs.add(labels_frame, text="Labels")

		label_frames = LabelFrames(self.tabs)
		self.tabs.add(label_frames, text="LabelFrames")

		buttons_frame = Buttons(self.tabs)
		self.tabs.add(buttons_frame, text="Buttons")







		self.controls = ttk.Frame(self)
		self.controls.pack(fill="x", side="bottom")


		ttk.Button(self.controls, text="Close", command=self.quit).pack(side="right")
		ttk.Button(self.controls, text="Demo", command=self.show_demo).pack(side="right")


		style = ttk.Style()
		# self.tk.eval("source themes/pkgIndex.tcl")
		# self.tk.call("package", "require", "ttkthemes")
		# print(style.theme_names())
		# print(style.theme_use())
		style.theme_use("clam")
		style.configure('TButton', foreground='green')
		
		styles = style.theme_names()
		current_style = style.theme_use()
		self.style_box = ttk.Combobox(self.controls, values=styles, state='readonly')
		self.style_box.pack(side="left")
		self.style_box.bind('<<ComboboxSelected>>', self.__update_style)
		self.style_box.set(current_style)

		# self.tk.eval("source themes/pkgIndex.tcl")
		# self.tk.call("package", "require", "ttkthemes")
		# self.tk.call("ttk::setTheme", "plastik")
		# self.tk.call("ttk::setTheme", "aquativo")
		# self.tk.call("ttk::setTheme", "arc")
		# self.tk.call("ttk::setTheme", "elegance")
		# self.tk.call("ttk::setTheme", "blue")
		# self.tk.call("ttk::setTheme", "clearlooks")
		# self.tk.call("ttk::setTheme", "radiance")
		# self.tk.call("ttk::setTheme", "winxpblue")



	def __update_style(self, e):
		new_style = self.style_box.get()


		style = ttk.Style()
		style.theme_use(new_style)


	def show_demo(self):
		DemoApp(self)


if __name__ == "__main__":

	app = MainWindow()
	app.mainloop()
