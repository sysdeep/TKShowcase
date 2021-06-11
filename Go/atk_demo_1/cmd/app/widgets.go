package main

import (
	"log"

	"github.com/visualfc/atk/tk"
)

/*

#--- text
text .n.widgetPane.lf.text -width 0 -height 6
.n.widgetPane.lf.text insert 1.0 "import std.stdio;\n\nvoid main(string[] args)\n{\n\twriteln(\"Hello World!\");\n}"
pack .n.widgetPane.lf.text -side bottom -fill both -anchor nw -padx 5

#--- entry
entry .n.widgetPane.lf.entry -textvariable myclock
pack .n.widgetPane.lf.entry -side left -fill x -anchor nw -padx 5 -expand true

#--- entry time ticker
proc clock:set var {
    global $var
    set $var [clock format [clock seconds] -format %H:%M:%S]
    after 1000 [list clock:set $var]
}

clock:set myclock          ;# call once, keeps ticking ;-) RS







#--- spinbox
ttk::spinbox .n.widgetPane.lf.spinbox -width 5 -wrap true -values "foo bar baz qux"
.n.widgetPane.lf.spinbox set foo
pack .n.widgetPane.lf.spinbox -side left -padx 5
			# auto entry3 = new SpinBox(entryLabelFrame)
			# 	.setData(["$foo", "[bar]", "\"baz\"", "{qux}"])
			# 	.setWrap(true)
			# 	.setWidth(5)
			# 	.pack(5, 0, GeometrySide.left);


#--- combobox
pack [ttk::combobox .n.widgetPane.lf.combobox -values "Option_1 Option_2 Option_3"] -side left -fill x -anchor nw -padx 5
.n.widgetPane.lf.combobox current 0

*/

func newWidgets(parent tk.Widget) *tk.Frame {
	f := tk.NewFrame(parent)
	f.SetReliefStyle(tk.ReliefStyleGroove)

	lf := tk.NewLabelFrame(f)
	lf.SetLabelText("Text Entry")

	tk.NewVPackLayout(f).AddWidgets(lf)

	//--- text
	text := tk.NewText(lf, tk.WidgetAttrHeight(6))
	text.InsertText(0, "import std.stdio;\n\nvoid main(string[] args)\n{\n\twriteln(\"Hello World!\");\n}")

	// 	 .n.widgetPane.lf.text -width 0 -height 6
	// .n.widgetPane.lf.text insert 1.0 "import std.stdio;\n\nvoid main(string[] args)\n{\n\twriteln(\"Hello World!\");\n}"
	// pack .n.widgetPane.lf.text -side bottom -fill both -anchor nw -padx 5

	entry := tk.NewEntry(lf)

	// 	#--- entry
	// entry .n.widgetPane.lf.entry -textvariable myclock
	// pack .n.widgetPane.lf.entry -side left -fill x -anchor nw -padx 5 -expand true

	// #--- entry time ticker
	// proc clock:set var {
	//     global $var
	//     set $var [clock format [clock seconds] -format %H:%M:%S]
	//     after 1000 [list clock:set $var]
	// }

	// clock:set myclock          ;# call once, keeps ticking ;-) RS

	spin := tk.NewSpinBox(lf)
	spinValues := []string{"foo", "bar", "baz", "qux"}
	log.Println(spinValues)
	spin.SetTextValues(spinValues)
	spin.Entry().SetWidth(5)

	// #--- spinbox
	// ttk::spinbox .n.widgetPane.lf.spinbox -width 5 -wrap true -values "foo bar baz qux"
	// .n.widgetPane.lf.spinbox set foo
	// pack .n.widgetPane.lf.spinbox -side left -padx 5
	// 			# auto entry3 = new SpinBox(entryLabelFrame)
	// 			# 	.setData(["$foo", "[bar]", "\"baz\"", "{qux}"])
	// 			# 	.setWrap(true)
	// 			# 	.setWidth(5)
	// 			# 	.pack(5, 0, GeometrySide.left);

	// tk.NewComboBox(lf, tk.WidgetAttrInitUseTheme(true))
	combo := tk.NewComboBox(lf, tk.WidgetAttrInitUseTheme(true))
	comboValues := []string{"option 1", "option 2", "option 3", "option 4"}
	combo.SetValues(comboValues)
	// #--- combobox
	// pack [ttk::combobox .n.widgetPane.lf.combobox -values "Option_1 Option_2 Option_3"] -side left -fill x -anchor nw -padx 5
	// .n.widgetPane.lf.combobox current 0

	lll := tk.NewVPackLayout(lf)

	lll.AddWidgets(text, entry, spin, combo)

	// pack [labelframe .n.widgetPane.lf -text "Text Entry"] -side top -fill both -padx 10 -pady 10

	return f
}
