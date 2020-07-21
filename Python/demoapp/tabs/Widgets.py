#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import tkinter
from tkinter import ttk

class Widgets(ttk.Frame):
    def __init__(self, master, *args, **kwargs):
        super(Widgets, self).__init__(master, *args, **kwargs)


        
        #--- entry ------------------------------------------------------------
        self.frame_entry = ttk.LabelFrame(self, text="Entry")
        self.frame_entry.pack(side="top", fill="x")


        entry = ttk.Entry(self.frame_entry)
        entry.grid(column=0, row=0)
        entry.insert(tkinter.END, "entry")

        tkinter.Spinbox(self.frame_entry, values=[x for x in range(10)]).grid(column=1, row=0)
        ttk.Combobox(self.frame_entry, values=[x*100 for x in range(10)]).grid(column=2, row=0)

        tkinter.Text(self.frame_entry, height=10).grid(column=0, row=1, columnspan=3)




        self.frame_buttons = ttk.Frame(self)
        self.frame_buttons.pack(fill="x")

        frame_buttons_std = ttk.LabelFrame(self.frame_buttons, text="Buttons")
        # frame_buttons_std.grid(column=0, row=0)
        frame_buttons_std.pack(side="left")

        ttk.Button(frame_buttons_std, text="Button").pack()
        ttk.Button(frame_buttons_std, text="Image button").pack()
        ttk.Menubutton(frame_buttons_std, text="Menubutton").pack()


        frame_buttons_check = ttk.LabelFrame(self.frame_buttons, text="Check buttons")
        # frame_buttons_check.grid(column=1, row=0)
        frame_buttons_check.pack(side="left")

        ttk.Checkbutton(frame_buttons_check, text="Option 1").pack()
        ttk.Checkbutton(frame_buttons_check, text="Option 2").pack()
        ttk.Checkbutton(frame_buttons_check, text="Option 3").pack()


        frame_buttons_radio = ttk.LabelFrame(self.frame_buttons, text="Radio buttons")
        # frame_buttons_radio.grid(column=2, row=0)
        frame_buttons_radio.pack(side="left")

        ttk.Radiobutton(frame_buttons_radio, text="Option 1").pack()
        ttk.Radiobutton(frame_buttons_radio, text="Option 2").pack()
        ttk.Radiobutton(frame_buttons_radio, text="Option 3").pack()






        self.frame_progress = ttk.LabelFrame(self, text="Progress and scale")
        self.frame_progress.pack(fill="x")

        ttk.Progressbar(self.frame_progress).pack(fill="x")
        ttk.Scale(self.frame_progress).pack(fill="x")