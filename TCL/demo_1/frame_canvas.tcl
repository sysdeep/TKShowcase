# https://www.tcl.tk/man/tcl8.6/TkCmd/contents.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/canvas.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/scrollbar.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/ttk_scrollbar.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/grid.htm
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






# auto canvasPane = new Frame();

# 			auto container = new Frame(canvasPane)
# 				.pack(10, 0, GeometrySide.top, GeometryFill.both, AnchorPosition.center, true);

# 			container.configureGeometryColumn(0, 1);
# 			container.configureGeometryRow(0, 1);

# 				this._canvas = new Canvas(container, Color.bisque)
# 					.setCursor(Cursor.hand1)
# 					.setScrollRegion(-300, -250, 610, 500)
# 					.addItem(new CanvasRectangle([10, 10, 200, 100]).addTag("tagged"))
# 					.addItem(new CanvasArc([10, 110, 110, 210], CanvasArcStyle.pie, Color.paleGreen))
# 					.addItem(new CanvasImage([210, 10], new EmbeddedPng!("thumbnail.png")))
# 					.addItem(new CanvasImage([260, 10], new EmbeddedGif!("thumbnail.gif")))
# 					.addItem(new CanvasLine([120, 110, 200, 110, 200, 160]).setArrowPosition(CanvasLineArrow.last))
# 					.addItem(new CanvasOval([10, 170, 200, 245], Color.rosyBrown3))
# 					.addItem(new CanvasPolygon([220, 80, 320, 80, 300, 120, 240, 120], Color.mediumPurple))
# 					.addItem(new CanvasText([30, 192], "Tkd Canvas", Color.white).setFont("{Times New Roman} 22 bold"))
# 					.addItem(new CanvasWidget([220, 140], new Button("Embedded\nWidget", new EmbeddedPng!("error.png"))).setWidth(100).setHeight(100))
# 					.addTagConfig(new CanvasTagConfig("tagged").setFillColor(Color.salmon))
# 					.setXView(0.25)
# 					.setYView(0.24)
# 					.bind("<ButtonPress-1>", &this.mark)
# 					.bind("<B1-Motion>", &this.drag);

# 				auto xscroll = new XScrollBar(container)
# 					.attachWidget(this._canvas)
# 					.grid(0, 1, 0, 0, 1, 1, "esw");

# 				auto yscroll = new YScrollBar(container)
# 					.attachWidget(this._canvas)
# 					.grid(1, 0, 0, 0, 1, 1, "nes");

# 				this._canvas
# 					.attachXScrollBar(xscroll)
# 					.attachYScrollBar(yscroll)
# 					.grid(0, 0, 0, 0, 1, 1, "nesw");

# 		return canvasPane; 
# 		
# 		
# 		
# 		
# 		
# 		
# 		
# # 		/**
# 	 * Mark a point in the canvas to drag from.
# 	 *
# 	 * Params:
# 	 *     args = The callback args.
# 	 */
# 	private void mark(CommandArgs args)
# 	{
# 		this._canvas.setScanMark(args.event.x, args.event.y);
# 	}

# 	/**
# 	 * Drag the canvas to reposition the contents.
# 	 *
# 	 * Params:
# 	 *     args = The callback args.
# 	 */
# 	private void drag(CommandArgs args)
# 	{
# 		this._canvas.scanDragTo(args.event.x, args.event.y);
# 	}

