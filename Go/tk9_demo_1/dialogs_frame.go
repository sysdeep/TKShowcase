package main

import (
	"strings"

	tk "modernc.org/tk9.0"
)

func makaeDialogsFrame() *tk.TFrameWidget {
	frame := tk.TFrame()

	tk.Pack(
		frame,
		tk.Fill("both"),
		tk.Expand(true),
	)

	makeModalsFrame(frame.Window)
	makeNonModalsFrame(frame.Window)

	return frame
}

func makeModalsFrame(parent *tk.Window) {
	mb := parent.Labelframe(tk.Txt("Modal"))
	tk.Pack(
		mb,
		tk.Side("top"),
		tk.Fill("both"),
		tk.Padx(10),
		tk.Pady(10),
		tk.Anchor("center"),
	)

	tk.GridColumnConfigure(mb, 0, tk.Weight(0))
	tk.GridColumnConfigure(mb, 1, tk.Weight(1))

	// color
	var colorEntry = mb.Entry()
	tk.Grid(
		mb.Button(tk.Txt("Color"), tk.Image(tk.NewPhoto(tk.File("./media/color_swatch.png"))), tk.Compound("left"), tk.Command(func() {
			color := tk.ChooseColor(tk.Initialcolor("beige"), tk.Title("Choose a color"))
			colorEntry.Configure(tk.Textvariable(color))
		})),
		tk.Column(0),
		tk.Row(0),
		tk.Padx(10),
		tk.Pady(10),
		tk.Sticky("ew"),
	)
	tk.Grid(
		colorEntry,
		tk.Column(1),
		tk.Row(0),
		tk.Padx(10),
		tk.Sticky("ew"),
	)

	// directory
	var dirEntry = mb.Entry()
	tk.Grid(
		mb.Button(tk.Txt("Directory"), tk.Image(tk.NewPhoto(tk.File("./media/chart_organisation.png"))), tk.Compound("left"), tk.Command(func() {
			color := tk.ChooseDirectory(tk.Initialdir("~"), tk.Title("Choose a directory"))
			dirEntry.Configure(tk.Textvariable(color))
		})),
		tk.Column(0),
		tk.Row(1),
		tk.Padx(10),
		tk.Pady(10),
		tk.Sticky("ew"),
	)
	tk.Grid(
		dirEntry,
		tk.Column(1),
		tk.Row(1),
		tk.Padx(10),
		tk.Sticky("ew"),
	)

	// open_file
	var openDirEntry = mb.Entry()
	tk.Grid(
		mb.Button(tk.Txt("Open File"), tk.Image(tk.NewPhoto(tk.File("./media/folder_page.png"))), tk.Compound("left"), tk.Command(func() {
			color := tk.GetOpenFile(tk.Initialdir("~"), tk.Multiple(true), tk.Title("Choose a file to opening"))
			openDirEntry.Configure(tk.Textvariable(strings.Join(color, " ")))
		})),
		tk.Column(0),
		tk.Row(2),
		tk.Padx(10),
		tk.Pady(10),
		tk.Sticky("ew"),
	)
	tk.Grid(
		openDirEntry,
		tk.Column(1),
		tk.Row(2),
		tk.Padx(10),
		tk.Sticky("ew"),
	)

	// save_file
	var saveFileEntry = mb.Entry()
	tk.Grid(
		mb.Button(tk.Txt("Save File"), tk.Image(tk.NewPhoto(tk.File("./media/disk.png"))), tk.Compound("left"), tk.Command(func() {
			color := tk.GetSaveFile(tk.Initialdir("~"), tk.Title("Choose a file to saving"))
			saveFileEntry.Configure(tk.Textvariable(color))
		})),
		tk.Column(0),
		tk.Row(3),
		tk.Padx(10),
		tk.Pady(10),
		tk.Sticky("ew"),
	)
	tk.Grid(
		saveFileEntry,
		tk.Column(1),
		tk.Row(3),
		tk.Padx(10),
		tk.Sticky("ew"),
	)

	// message
	var messageEntry = mb.Entry()
	tk.Grid(
		mb.Button(tk.Txt("Message"), tk.Image(tk.NewPhoto(tk.File("./media/comment.png"))), tk.Compound("left"), tk.Command(func() {
			color := tk.MessageBox(
				tk.Detail("Nunc at aliquam arcu. Sed eget tellus ligula.\nSed egestas est et tempus cursus."),
				tk.Msg("Lorem ipsum dolor sit amet."),
				tk.Type("okcancel"),
				tk.Title("Choose a file to saving"))
			messageEntry.Configure(tk.Textvariable(color))
		})),
		tk.Column(0),
		tk.Row(4),
		tk.Padx(10),
		tk.Pady(10),
		tk.Sticky("ew"),
	)
	tk.Grid(
		messageEntry,
		tk.Column(1),
		tk.Row(4),
		tk.Padx(10),
		tk.Sticky("ew"),
	)

}

func makeNonModalsFrame(parent *tk.Window) {
	mb := parent.Labelframe(tk.Txt("Non Modal"))
	tk.Pack(
		mb,
		tk.Side("top"),
		tk.Fill("both"),
		tk.Padx(10),
		tk.Pady(10),
		tk.Expand(1),
		tk.Anchor("center"),
	)

	tk.GridColumnConfigure(mb, 0, tk.Weight(0))
	tk.GridColumnConfigure(mb, 1, tk.Weight(1))

	// color
	var fontEntry = mb.Entry()
	tk.Grid(
		mb.Button(tk.Txt("Font"), tk.Image(tk.NewPhoto(tk.File("./media/style.png"))), tk.Compound("left"), tk.Command(func() {
			tk.Fontchooser(tk.Command(func() {
				f := tk.FontchooserFont()
				fontEntry.Configure(tk.Textvariable(strings.Join(f, " ")))
			}))
			tk.FontchooserShow()
		})),
		tk.Column(0),
		tk.Row(0),
		tk.Padx(10),
		tk.Pady(10),
		tk.Sticky("ew"),
	)
	tk.Grid(
		fontEntry,
		tk.Column(1),
		tk.Row(0),
		tk.Padx(10),
		tk.Sticky("ew"),
	)

}
