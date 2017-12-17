#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import tkinter
from tkinter import ttk

class Panels(ttk.Frame):
    def __init__(self, master, *args, **kwargs):
        super(Panels, self).__init__(master, *args, **kwargs)



        frame_tree = ttk.LabelFrame(self, text="Tree")
        frame_tree.pack(fill="x")

        tree = ttk.Treeview(frame_tree)
        tree.pack(expand=True, fill="both")






        frame_table = ttk.LabelFrame(self, text="Table")
        frame_table.pack(fill="x")

        table = ttk.Treeview(frame_table)
        table.pack(expand=True, fill="both")

        

