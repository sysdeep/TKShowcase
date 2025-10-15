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

	makeButtonsBox(frame.Window)
	makeCheckButtonsBox(frame.Window)
	makeRadioButtonsBox(frame.Window)

	return frame
}

func makeButtonsBox(parent *tk.Window) {

	frame := parent.Labelframe(tk.Txt("Buttons"))

	tk.Pack(
		frame,
		tk.Side("left"),
		tk.Fill("both"),
		tk.Padx(10),
		tk.Pady(10),
		tk.Expand(true),
		tk.Anchor("center"),
	)

	// text button
	tk.Pack(
		frame.TButton(tk.Txt("Text button")),
		tk.Padx(5),
		tk.Pady(5),
	)

	// TODO: image
	// image button
	tk.Pack(
		frame.TButton(tk.Txt("Image button")),
		tk.Padx(5),
		tk.Pady(5),
	)

	// menu button
	mbMenu := frame.Menu(tk.Tearoff(false))
	mbMenu.AddCommand(tk.Lbl("Option 1"))
	mbMenu.AddCommand(tk.Lbl("Option 2"))
	mbMenu.AddCommand(tk.Lbl("Option 3"))

	mb := frame.TMenubutton(tk.Txt("Menu button"), tk.Mnu(mbMenu))
	tk.Pack(
		mb,
		tk.Padx(5),
		tk.Pady(5),
	)

}

func makeCheckButtonsBox(parent *tk.Window) {

	frame := parent.Labelframe(tk.Txt("Check buttons"))

	tk.Pack(
		frame,
		tk.Side("left"),
		tk.Fill("both"),
		tk.Padx(10),
		tk.Pady(10),
		tk.Expand(true),
		tk.Anchor("center"),
	)

	tk.Pack(
		frame.TCheckbutton(tk.Txt("Option 1"), tk.Variable("off")),
		tk.Padx(5),
		tk.Pady(5),
	)

	cb2 := frame.TCheckbutton(tk.Txt("Option 2"), tk.Variable("off"))
	cb2.Invoke()
	tk.Pack(
		cb2,
		tk.Padx(5),
		tk.Pady(5),
	)

	tk.Pack(
		frame.TCheckbutton(tk.Txt("Option 3"), tk.Variable("off")),
		tk.Padx(5),
		tk.Pady(5),
	)

}

func makeRadioButtonsBox(parent *tk.Window) {

	frame := parent.Labelframe(tk.Txt("Radio buttons"))

	tk.Pack(
		frame,
		tk.Side("left"),
		tk.Fill("both"),
		tk.Padx(10),
		tk.Pady(10),
		tk.Expand(true),
		tk.Anchor("center"),
	)

	current := tk.Variable("2")

	tk.Pack(
		frame.TRadiobutton(tk.Txt("Option 1"), tk.Value("1"), current),
		tk.Padx(5),
		tk.Pady(5),
	)

	tk.Pack(
		frame.TRadiobutton(tk.Txt("Option 2"), tk.Value("2"), current),
		tk.Padx(5),
		tk.Pady(5),
	)

	tk.Pack(
		frame.TRadiobutton(tk.Txt("Option 3"), tk.Value("3"), current),
		tk.Padx(5),
		tk.Pady(5),
	)

}
