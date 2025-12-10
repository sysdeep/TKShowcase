package main

import (
	"fmt"

	tk "modernc.org/tk9.0"
)

// NOTE: see autoscroll example
func mainCanvasFrame() *tk.TFrameWidget {
	frame := tk.TFrame()

	tk.Pack(
		frame,
		tk.Fill("both"),
		tk.Expand(true),
	)

	var xscroll *tk.Window
	var yscroll *tk.Window

	cv := frame.Canvas(tk.Background("bisque"), tk.Cursor("hand1"), tk.Scrollregion("-300 -250 610 500"),
		tk.Xscrollcommand(func(e *tk.Event) {
			fmt.Println("canvas xscroll")
			e.ScrollSet(xscroll)
		}),
		tk.Yscrollcommand(func(e *tk.Event) {
			fmt.Println("canvas yscroll")
			e.ScrollSet(yscroll)
		}),
	)

	cv.CreateRectangle(10, 10, 200, 100, tk.Tags("tagged"))
	cv.CreateArc(10, 110, 110, 210, tk.Fill("paleGreen"), tk.Style("pie"))
	cv.CreateImage(240, 40, tk.Image(tk.NewPhoto(tk.File("./media/thumbnail.png"))))
	cv.CreateImage(290, 40, tk.Image(tk.NewPhoto(tk.File("./media/thumbnail.gif"))))
	// cv.CreateLine(120, 110, 200, 110, 200, 160, tk.Arrow("last"))
	cv.CreateLine(120, 110, 200, 110, 200, 160, tk.Linearrow("last"))
	cv.CreateOval(10, 170, 200, 245, tk.Fill("rosyBrown3"))

	cv.CreateText(90, 202, tk.Fill("white"), tk.Txt("Tk Canvas"), tk.Font("{Times New Roman} 22 bold"))
	cv.CreatePolygon(220, 80, 320, 80, 300, 120, 240, 120, tk.Fill("mediumPurple"))

	button := frame.Button(
		tk.Txt("Embedded\nWidget"),
		tk.Image(tk.NewPhoto(tk.File("./media/error.png"))), tk.Compound("top"),
		tk.Height(100),
		tk.Width(100),
	)
	cv.CreateWindow(280, 200, tk.Win(button))

	// TODO

	// 	.n.canvasPane.container.canvas itemconfigure "tagged" -fill "salmon"
	// cv.Configure(tk.Xview())
	// cv.Set
	// .n.canvasPane.container.canvas xview moveto 0.25
	// .n.canvasPane.container.canvas yview moveto 0.24

	// TODO
	// #--- [scan dragto %x %y 1] - 1 - скорость
	// bind .n.canvasPane.container.canvas <B1-Motion> { .n.canvasPane.container.canvas scan dragto %x %y 1 }
	// bind .n.canvasPane.container.canvas <ButtonPress-1> { .n.canvasPane.container.canvas scan mark %x %y }
	tk.Bind(cv, "<B1-Motion>", tk.Command(func(e *tk.Event) {
		fmt.Println("b1 motion")

	}))
	tk.Bind(cv, "<ButtonPress-1>", tk.Command(func() {
		fmt.Println("press")

	}))

	xscroll = frame.TScrollbar(tk.Orient("horizontal"), tk.Command(func(e *tk.Event) {
		fmt.Println("horizontal")
		e.Xview(cv)
	})).Window
	yscroll = frame.Scrollbar(tk.Orient("vertical"), tk.Command(func(e *tk.Event) {
		fmt.Println("vertical")
		e.Yview(cv)
	})).Window

	tk.Grid(
		cv,
		tk.Sticky("nsew"),
		tk.Column(0),
		tk.Row(0),
	)

	tk.Grid(
		xscroll,
		tk.Sticky("esw"),
		tk.Column(0),
		tk.Row(1),
	)

	tk.Grid(
		yscroll,
		tk.Sticky("nes"),
		tk.Column(1),
		tk.Row(0),
		tk.Rowspan(2),
	)

	tk.GridRowConfigure(
		frame, 0, tk.Weight(1),
	)

	tk.GridColumnConfigure(
		frame, 0, tk.Weight(1),
	)
	// tk.Pack(
	// 	frame,

	// )

	// makeCanvasView(frame.Window)

	return frame
}

/*
frame .n.canvasPane

frame .n.canvasPane.container -bg red
pack .n.canvasPane.container -side top -fill both -anchor center -padx 10 -pady 10 -expand true




canvas .n.canvasPane.container.canvas -bg "bisque" -cursor "hand1" -scrollregion "-300 -250 610 500" \
	-xscrollcommand {.n.canvasPane.container.xscroll set} -yscrollcommand {.n.canvasPane.container.yscroll set}


.n.canvasPane.container.canvas create rectangle 10 10 200 100 -tags "tagged"
.n.canvasPane.container.canvas create arc 10 110 110 210 -fill paleGreen -style pie
.n.canvasPane.container.canvas create image 240 40 -image [image create photo -file "./media/thumbnail.png"]
.n.canvasPane.container.canvas create image 290 40 -image [image create photo -file "./media/thumbnail.gif"]
.n.canvasPane.container.canvas create line 120 110 200 110 200 160 -arrow last
.n.canvasPane.container.canvas create oval 10 170 200 245 -fill rosyBrown3

# setFont("{Times New Roman} 22 bold"))
.n.canvasPane.container.canvas create text 90 202 -fill white -text "Tk Canvas" -font "{Times New Roman} 22 bold"
.n.canvasPane.container.canvas create polygon 220 80 320 80 300 120 240 120 -fill mediumPurple

button .n.canvasPane.container.button -text "Embedded\nWidget" -image [image create photo -file "./media/error.png"] -compound top \
	-height 100 -width 100
.n.canvasPane.container.canvas create window 280 200 -window .n.canvasPane.container.button

.n.canvasPane.container.canvas itemconfigure "tagged" -fill "salmon"
.n.canvasPane.container.canvas xview moveto 0.25
.n.canvasPane.container.canvas yview moveto 0.24


#--- [scan dragto %x %y 1] - 1 - скорость
bind .n.canvasPane.container.canvas <B1-Motion> { .n.canvasPane.container.canvas scan dragto %x %y 1 }
bind .n.canvasPane.container.canvas <ButtonPress-1> { .n.canvasPane.container.canvas scan mark %x %y }





ttk::scrollbar .n.canvasPane.container.xscroll -orien horizontal -command {.n.canvasPane.container.canvas xview}
scrollbar .n.canvasPane.container.yscroll -orien vertical -command {.n.canvasPane.container.canvas yview}



grid .n.canvasPane.container.canvas -sticky nsew -column 0 -row 0
grid .n.canvasPane.container.xscroll -sticky esw -column 0 -row 1
grid .n.canvasPane.container.yscroll -sticky nes -column 1 -row 0 -rowspan 2


#--- set fill all(0 - index of widget in grid)
grid rowconfigure .n.canvasPane.container 0 -weight 1
grid columnconfigure .n.canvasPane.container 0 -weight 1



*/
