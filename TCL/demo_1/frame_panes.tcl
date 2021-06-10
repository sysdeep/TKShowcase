# https://www.tcl.tk/man/tcl8.6/TkCmd/contents.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/panedwindow.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/ttk_treeview.htm

frame .n.panedPane 


#--- paned window -------------------------------------------------------------
panedwindow .n.panedPane.panedWindow -orient vertical
pack .n.panedPane.panedWindow -side top -fill both -anchor center -padx 10 -pady 10



#--- tree 1 -------------------------------------------------------------------
ttk::treeview .n.panedPane.panedWindow.tree1

#--- heading
.n.panedPane.panedWindow.tree1 heading #0 -text "Directory listing" -anchor w

#--- insert items
.n.panedPane.panedWindow.tree1 insert {} 1 -id "id_computer" -text "Computer" -open true -tags "computer"
	.n.panedPane.panedWindow.tree1 insert "id_computer" 1 -id "id_documents" -text "Documents" -open true -tags "folder"
		.n.panedPane.panedWindow.tree1 insert "id_documents" 1 -text "Important notes.txt" -tags "file"
		.n.panedPane.panedWindow.tree1 insert "id_documents" 2 -text "The D Programming Language.pdf" -tags "pdf"
	.n.panedPane.panedWindow.tree1 insert "id_computer" 2 -id "id_pictures" -text "Pictures" -open true -tags "folder"
		.n.panedPane.panedWindow.tree1 insert "id_pictures" 1 -text "Gary and Tessa.jpg" -tags "image"
	.n.panedPane.panedWindow.tree1 insert "id_computer" 3 -id "id_videos" -text "Videos" -open true -tags "folder"
		.n.panedPane.panedWindow.tree1 insert "id_videos" 1 -text "Carlito's Way (1993).mpg" -tags "video"
		.n.panedPane.panedWindow.tree1 insert "id_videos" 2 -text "Aliens (1986).mpg" -tags "video"

#--- setup tags
.n.panedPane.panedWindow.tree1 tag configure "computer" -image [image create photo -file "./media/computer.png"]
.n.panedPane.panedWindow.tree1 tag configure "folder" -image [image create photo -file "./media/folder.png"]
.n.panedPane.panedWindow.tree1 tag configure "file" -image [image create photo -file "./media/page.png"]
.n.panedPane.panedWindow.tree1 tag configure "pdf" -image [image create photo -file "./media/page_white_acrobat.png"]
.n.panedPane.panedWindow.tree1 tag configure "image" -image [image create photo -file "./media/images.png"]
.n.panedPane.panedWindow.tree1 tag configure "video" -image [image create photo -file "./media/film.png"]

#--- add to paned window
.n.panedPane.panedWindow add .n.panedPane.panedWindow.tree1








#--- tree 2 -------------------------------------------------------------------
ttk::treeview .n.panedPane.panedWindow.tree2 -show "headings" -columns "a b c" 

#--- heading
.n.panedPane.panedWindow.tree2 heading 0 -text "Film" -anchor w
.n.panedPane.panedWindow.tree2 heading 1 -text "Year"
.n.panedPane.panedWindow.tree2 heading 2 -text "IMDB ranking"

.n.panedPane.panedWindow.tree2 column 1 -width 20
.n.panedPane.panedWindow.tree2 column 2 -width 50


#--- add items
.n.panedPane.panedWindow.tree2 insert {} 1 -values "{The Shawshank Redemption} 1994 1"
.n.panedPane.panedWindow.tree2 insert {} 2 -values "{The Godfather} 1972 2"
.n.panedPane.panedWindow.tree2 insert {} 3 -values "{The Godfather: Part II} 1974 3"
.n.panedPane.panedWindow.tree2 insert {} 4 -values "{The Dark Knight} 2008 4"
.n.panedPane.panedWindow.tree2 insert {} 5 -values "{Pulp Fiction} 1994 5"
.n.panedPane.panedWindow.tree2 insert {} 6 -values "{The Good, the Bad and the Ugly} 1966 6"
.n.panedPane.panedWindow.tree2 insert {} 7 -values "{Schindler's List} 1993 7"
.n.panedPane.panedWindow.tree2 insert {} 8 -values "{Angry Men} 1957 8"
.n.panedPane.panedWindow.tree2 insert {} 9 -values "{The Lord of the Rings: The Return of the King} 2003 9"
.n.panedPane.panedWindow.tree2 insert {} 10 -values "{Fight Club} 1999 10"


#--- add to paned window
.n.panedPane.panedWindow add .n.panedPane.panedWindow.tree2













