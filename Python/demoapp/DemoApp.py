#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import tkinter
from tkinter import ttk


from .tabs import Widgets, Panels, Canvas, Dialogs

class DemoApp(tkinter.Toplevel):
	def __init__(self, master, *args, **kwargs):
		super(DemoApp, self).__init__(master, *args, **kwargs)

		self.title("DemoApp")

		self.main_layout = tkinter.Frame(self)
		self.main_layout.pack(fill="both", expand=True)


		self.tabs = ttk.Notebook(self.main_layout)
		self.tabs.pack(fill="both", expand=True)


		tab_widgets = Widgets(self.tabs)
		tab_panels = Panels(self.tabs)
		tab_canvas = Canvas(self.tabs)
		tab_dialogs = Dialogs(self.tabs)
		
		self.tabs.add(tab_widgets, text="Widgets")
		self.tabs.add(tab_panels, text="Panels")
		self.tabs.add(tab_canvas, text="Canvas")
		self.tabs.add(tab_dialogs, text="Dialogs")



		self.controls = ttk.Frame(self)
		self.controls.pack(fill="x", side="bottom")


		ttk.Button(self.controls, text="Close", command=self.quit).pack(side="right")


		style = ttk.Style()
		styles = style.theme_names()
		current_style = style.theme_use()
		self.style_box = ttk.Combobox(self.controls, values=styles, state='readonly')
		self.style_box.pack(side="left")
		self.style_box.bind('<<ComboboxSelected>>', self.__update_style)
		self.style_box.set(current_style)







	def __update_style(self, e):
		new_style = self.style_box.get()


		style = ttk.Style()
		style.theme_use(new_style)


if __name__ == "__main__":


	tk = tkinter.Tk()



	modal = DemoApp(tk)
	# modal.show()

	tk.mainloop()
