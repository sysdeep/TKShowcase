# https://www.tcl.tk/man/tcl8.6/TkCmd/contents.htm
frame .n.widgetPane



pack [labelframe .n.widgetPane.lf -text "Text Entry"] -side top -fill both -padx 10 -pady 10
# button .widgetPane.button -text "wp"
# grid .widgetPane.button



text .n.widgetPane.lf.text -width 0 -height 6
.n.widgetPane.lf.text insert 1.0 "import std.stdio;\n\nvoid main(string[] args)\n{\n\twriteln(\"Hello World!\");\n}"
pack .n.widgetPane.lf.text -side bottom -fill both -anchor nw -padx 5
# -width 0 -height 3 -text "import std.stdio;\n\nvoid main(string[] args)\n{\n\twriteln(\"Hello World!\");\n}"
# button .n.widgetPane.exit_button -text Exit -command {exit} -width 10
# 
pack [entry .n.widgetPane.lf.entry ] -side left -fill x -anchor nw -padx 5
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



pack [ttk::combobox .n.widgetPane.lf.combobox ] -side left -fill x -anchor nw -padx 5
			# auto entry4 = new ComboBox(entryLabelFrame)
			# 	.setData(["Option 1", "Option 2", "Option 3"])
			# 	.setValue("Option 1")
			# 	.pack(5, 0, GeometrySide.left, GeometryFill.x, AnchorPosition.northWest, true);



#--- rangeLabelFrame
pack [labelframe .n.widgetPane.rangeLabelFrame -text "Progress & Scale"] \
	-side bottom -fill both -anchor center -padx 10 -pady 10

pack [ttk::progressbar .n.widgetPane.rangeLabelFrame.progress\
	-value 4 -maximum 10
] -padx 5 -pady 5 -side top -fill x -anchor center

pack [ttk::scale .n.widgetPane.rangeLabelFrame.scale -from 10 -to 0 -value 4] \
	-padx 5 -pady 5 -side top -fill x -anchor center

# auto rangeLabelFrame = new LabelFrame(widgetPane, "Progress & Scale")
# 			.pack(10, 0, GeometrySide.bottom, GeometryFill.both, AnchorPosition.center);
# 			this._progressBar = new ProgressBar(rangeLabelFrame)
# 				.setMaxValue(10)
# 				.setValue(4)
# 				.pack(5, 0, GeometrySide.top, GeometryFill.x, AnchorPosition.center, true);
# 			auto scale = new Scale(rangeLabelFrame)
# 				.setFromValue(10)
# 				.setToValue(0)
# 				.setCommand(delegate(CommandArgs args){
# 					auto scale = cast(Scale)args.element;
# 					this._progressBar.setValue(scale.getValue());
# 				})
# 				.setValue(4)
# 				.pack(5, 0, GeometrySide.top, GeometryFill.x, AnchorPosition.center, true);





# 		auto buttonLabelFrame = new LabelFrame(widgetPane, "Buttons")
# 			.pack(10, 0, GeometrySide.left, GeometryFill.both, AnchorPosition.center, true);
# 			auto button1 = new Button(buttonLabelFrame, "Text button")
# 				.pack(5);
# 			auto button2 = new Button(buttonLabelFrame, new EmbeddedPng!("thumbnail.png"), "Image button", ImagePosition.left)
# 				.pack(5);
# 			auto buttonMenu = new Menu()
# 				.addEntry("Option 1", delegate(CommandArgs args){})
# 				.addEntry("Option 2", delegate(CommandArgs args){})
# 				.addEntry("Option 3", delegate(CommandArgs args){});
# 			auto button3 = new MenuButton(buttonLabelFrame, "Menu button", buttonMenu)
# 				.pack(5);

# 		auto checkBoxLabelFrame = new LabelFrame(widgetPane, "Check buttons")
# 			.pack(10, 0, GeometrySide.left, GeometryFill.both, AnchorPosition.center, true);
# 			auto checkButton1 = new CheckButton(checkBoxLabelFrame, "Option 1")
# 				.check()
# 				.pack(5);
# 			auto checkButton2 = new CheckButton(checkBoxLabelFrame, "Option 2")
# 				.pack(5);
# 			auto checkButton3 = new CheckButton(checkBoxLabelFrame, "Option 3")
# 				.pack(5);

# 		auto radioLabelFrame = new LabelFrame(widgetPane, "Radio buttons")
# 			.pack(10, 0, GeometrySide.left, GeometryFill.both, AnchorPosition.center, true);
# 			auto radioButton1 = new RadioButton(radioLabelFrame, "Option 1")
# 				.setSelectedValue("1")
# 				.select()
# 				.pack(5);
# 			auto radioButton2 = new RadioButton(radioLabelFrame, "Option 2")
# 				.setSelectedValue("2")
# 				.pack(5);
# 			auto radioButton3 = new RadioButton(radioLabelFrame, "Option 3")
# 				.setSelectedValue("3")
# 				.pack(5);



# pack .n.widgetPane.exit_button -padx 5 -pady 5