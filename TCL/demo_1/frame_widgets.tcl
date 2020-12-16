# https://www.tcl.tk/man/tcl8.6/TkCmd/contents.htm
frame .n.widgetPane


#--- text entries -------------------------------------------------------------
pack [labelframe .n.widgetPane.lf -text "Text Entry"] -side top -fill both -padx 10 -pady 10
# button .widgetPane.button -text "wp"
# grid .widgetPane.button



text .n.widgetPane.lf.text -width 0 -height 6
.n.widgetPane.lf.text insert 1.0 "import std.stdio;\n\nvoid main(string[] args)\n{\n\twriteln(\"Hello World!\");\n}"
pack .n.widgetPane.lf.text -side bottom -fill both -anchor nw -padx 5
# -width 0 -height 3 -text "import std.stdio;\n\nvoid main(string[] args)\n{\n\twriteln(\"Hello World!\");\n}"
# button .n.widgetPane.exit_button -text Exit -command {exit} -width 10
# 
pack [entry .n.widgetPane.lf.entry ] -side left -fill x -anchor nw -padx 5 -expand true
# this._entry = new Entry(entryLabelFrame)
			# 	.pack(5, 0, GeometrySide.left, GeometryFill.x, AnchorPosition.northWest, true);


# TODO - mouse wheel
spinbox .n.widgetPane.lf.spinbox -width 5 -wrap true -values "foo bar baz qux"
pack .n.widgetPane.lf.spinbox -side left -padx 5
			# auto entry3 = new SpinBox(entryLabelFrame)
			# 	.setData(["$foo", "[bar]", "\"baz\"", "{qux}"])
			# 	.setWrap(true)
			# 	.setWidth(5)
			# 	.pack(5, 0, GeometrySide.left);



pack [ttk::combobox .n.widgetPane.lf.combobox -values "Option_1 Option_2 Option_3"] -side left -fill x -anchor nw -padx 5
.n.widgetPane.lf.combobox current 0
			
#--- text entries -------------------------------------------------------------





#--- rangeLabelFrame ----------------------------------------------------------
pack [labelframe .n.widgetPane.rangeLabelFrame -text "Progress & Scale"] \
	-side bottom -fill both -anchor center -padx 10 -pady 10

#--- progress
pack [ttk::progressbar .n.widgetPane.rangeLabelFrame.progress\
	-value 4 -maximum 10
] -padx 5 -pady 5 -side top -fill x -anchor center

#--- scale
proc do_scale {w_progress value} {
	$w_progress configure -value $value
}
ttk::scale .n.widgetPane.rangeLabelFrame.scale -from 10 -to 0 -value 4 -command "do_scale .n.widgetPane.rangeLabelFrame.progress"
pack .n.widgetPane.rangeLabelFrame.scale -padx 5 -pady 5 -side top -fill x -anchor center
#--- rangeLabelFrame ----------------------------------------------------------



#--- Buttons ------------------------------------------------------------------
labelframe .n.widgetPane.buttonsFrame -text "Buttons"
pack .n.widgetPane.buttonsFrame -padx 10 -pady 10 -side left -fill both -expand true -anchor center

pack [button .n.widgetPane.buttonsFrame.b1 -text "Text button"] -padx 5 -pady 5

pack [button .n.widgetPane.buttonsFrame.b2 -text "Image button" -image [image create photo -file "./media/thumbnail.png"] -compound left ] -padx 5 -pady 5

menubutton .n.widgetPane.buttonsFrame.b3 -text "Menu button" -menu .n.widgetPane.buttonsFrame.b3.menu
pack .n.widgetPane.buttonsFrame.b3 -padx 5 -pady 5

menu .n.widgetPane.buttonsFrame.b3.menu -tearoff false
.n.widgetPane.buttonsFrame.b3.menu add command -label "Option 1"
.n.widgetPane.buttonsFrame.b3.menu add command -label "Option 2"
.n.widgetPane.buttonsFrame.b3.menu add command -label "Option 3"



labelframe .n.widgetPane.checkButtonsFrame -text "Check buttons"
pack .n.widgetPane.checkButtonsFrame -padx 10 -pady 10 -side left -fill both -expand true -anchor center

pack [checkbutton .n.widgetPane.checkButtonsFrame.b1 -text "Option 1"] -padx 5 -pady 5
pack [checkbutton .n.widgetPane.checkButtonsFrame.b2 -text "Option 2"] -padx 5 -pady 5
pack [checkbutton .n.widgetPane.checkButtonsFrame.b3 -text "Option 3"] -padx 5 -pady 5
.n.widgetPane.checkButtonsFrame.b1 select


labelframe .n.widgetPane.radioButtonsFrame -text "Radio buttons"
pack .n.widgetPane.radioButtonsFrame -padx 10 -pady 10 -side left -fill both -expand true -anchor center

pack [radiobutton .n.widgetPane.radioButtonsFrame.b1 -text "Option 1" -value 1] -padx 5 -pady 5
pack [radiobutton .n.widgetPane.radioButtonsFrame.b2 -text "Option 2" -value 2] -padx 5 -pady 5
pack [radiobutton .n.widgetPane.radioButtonsFrame.b3 -text "Option 3" -value 3] -padx 5 -pady 5
.n.widgetPane.radioButtonsFrame.b1 select
#--- Buttons ------------------------------------------------------------------

# pack .n.widgetPane.exit_button -padx 5 -pady 5