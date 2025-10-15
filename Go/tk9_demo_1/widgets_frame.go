package main

import (
	"time"

	tk "modernc.org/tk9.0"
)

func mainWidgetsFrame() *tk.TFrameWidget {
	frame := tk.TFrame()

	// text entries -----------------------------------------------------------

	textEntryFrame := frame.Labelframe(tk.Txt("Text Entry"))

	tk.Pack(
		textEntryFrame,
		tk.Side("top"),
		tk.Fill("both"),
		tk.Padx(10),
		tk.Pady(10),
	)

	// text
	textEntryText := textEntryFrame.Text(tk.Width(0), tk.Height(6))
	textEntryText.Insert("1.0", "import std.stdio;\n\nvoid main(string[] args)\n{\n\twriteln(\"Hello World!\");\n}")
	tk.Pack(
		textEntryText,
		tk.Side("bottom"),
		tk.Fill("both"),
		tk.Anchor("nw"),
		tk.Padx(5),
	)

	// entry
	textEntryEntry := textEntryFrame.TEntry(tk.Textvariable("init"))
	tk.Pack(
		textEntryEntry,
		tk.Side("left"),
		tk.Fill("x"),
		tk.Anchor("nw"),
		tk.Padx(5),
		tk.Expand(true),
	)

	tk.NewTicker(100*time.Millisecond, func() {
		textEntryEntry.Configure(tk.Textvariable(time.Now().Format(time.DateTime)))
	})

	// spin box
	// 	ttk::spinbox .n.widgetPane.lf.spinbox -width 5 -wrap true -values "foo bar baz qux"
	// .n.widgetPane.lf.spinbox set foo
	// pack .n.widgetPane.lf.spinbox -side left -padx 5
	textEntrySpinbox := textEntryFrame.TSpinbox(
		tk.Width(5), tk.Wrap(true), tk.Values("foo bar baz qux"),
		tk.Textvariable("foo"),
	)
	tk.Pack(
		textEntrySpinbox,
		tk.Side("left"),
		tk.Padx(5),
	)

	// combo box
	// pack [ttk::combobox .n.widgetPane.lf.combobox -values "Option_1 Option_2 Option_3"] -side left -fill x -anchor nw -padx 5
	// .n.widgetPane.lf.combobox current 0
	tk.Pack(
		textEntryFrame.TCombobox(
			tk.Values("Option_1 Option_2 Option_3"),
			tk.Textvariable("Option_3"),
		),
		tk.Side("left"),
		tk.Padx(5),
		tk.Anchor("nw"),
	)

	return frame
}
