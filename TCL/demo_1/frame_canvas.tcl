# https://www.tcl.tk/man/tcl8.6/TkCmd/contents.htm
frame .n.canvasPane



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

