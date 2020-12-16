# https://www.tcl.tk/man/tcl8.6/TkCmd/contents.htm
frame .n.panedPane 

# auto panedPane = new Frame();

# 			auto panedWindow = new PanedWindow(panedPane);

# 				auto rows = new TreeViewRow(["Computer"], true, ["computer"]);
# 				rows.children ~= new TreeViewRow(["Documents"], true, ["folder"]);
# 					rows.children[0].children ~= new TreeViewRow(["Important notes.txt"], true, ["file"]);
# 					rows.children[0].children ~= new TreeViewRow(["The D Programming Language.pdf"], true, ["pdf"]);
# 				rows.children ~= new TreeViewRow(["Pictures"], true, ["folder"]);
# 					rows.children[1].children ~= new TreeViewRow(["Gary and Tessa.jpg"], true, ["image"]);
# 				rows.children ~= new TreeViewRow(["Videos"], true, ["folder"]);
# 					rows.children[2].children ~= new TreeViewRow(["Carlito's Way (1993).mpg"], true, ["video"]);
# 					rows.children[2].children ~= new TreeViewRow(["Aliens (1986).mpg"], true, ["video"]);

# 				auto tree1 = new TreeView(panedWindow)
# 					.setHeading("Directory listing")
# 					.setTag("computer", new EmbeddedPng!("computer.png"))
# 					.setTag("folder", new EmbeddedPng!("folder.png"))
# 					.setTag("file", new EmbeddedPng!("page.png"))
# 					.setTag("pdf", new EmbeddedPng!("page_white_acrobat.png"))
# 					.setTag("video", new EmbeddedPng!("film.png"))
# 					.setTag("image", new EmbeddedPng!("images.png"))
# 					.addRow(rows);

# 				auto tree2 = new TreeView(panedWindow)
# 					.setHeading("Film")
# 					.setWidth(250)
# 					.addColumn(new TreeViewColumn("Year").setWidth(20))
# 					.addColumn(new TreeViewColumn("IMDB ranking").setWidth(50))
# 					.addRow(new TreeViewRow(["The Shawshank Redemption", "1994", "1"]))
# 					.addRow(new TreeViewRow(["The Godfather", "1972", "2"]))
# 					.addRow(new TreeViewRow(["The Godfather: Part II", "1974", "3"]))
# 					.addRow(new TreeViewRow(["The Dark Knight", "2008", "4"]))
# 					.addRow(new TreeViewRow(["Pulp Fiction", "1994", "5"]))
# 					.addRow(new TreeViewRow(["The Good, the Bad and the Ugly", "1966", "6"]))
# 					.addRow(new TreeViewRow(["Schindler's List", "1993", "7"]))
# 					.addRow(new TreeViewRow(["Angry Men", "1957", "8"]))
# 					.addRow(new TreeViewRow(["The Lord of the Rings: The Return of the King", "2003", "9"]))
# 					.addRow(new TreeViewRow(["Fight Club", "1999", "10"]));

# 		panedWindow
# 			.addPane(tree1).setPaneWeight(0, 1)
# 			.addPane(tree2).setPaneWeight(1, 1)
# 			.pack(10, 0, GeometrySide.top, GeometryFill.both, AnchorPosition.center, true);

# 		return panedPane;