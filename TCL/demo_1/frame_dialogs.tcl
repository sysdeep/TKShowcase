# https://www.tcl.tk/man/tcl8.6/TkCmd/contents.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/getOpenFile.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/messageBox.htm
# https://www.tcl.tk/man/tcl8.6/TkCmd/fontchooser.htm

frame .n.dialogsPane

labelframe .n.dialogsPane.modals_frame -text "Modal"
pack .n.dialogsPane.modals_frame -side top -fill both -padx 10 -pady 10 -anchor "center"

grid columnconfigure .n.dialogsPane.modals_frame 0 -weight 0
grid columnconfigure .n.dialogsPane.modals_frame 1 -weight 1

#--- color
grid [button .n.dialogsPane.modals_frame.b_color -text "Color" -image [image create photo -file "./media/color_swatch.png"] -compound left -command openColorDialog] \
	-column 0 -row 0 -padx 10 -pady 10 -sticky "ew"
grid [entry .n.dialogsPane.modals_frame.e_color] \
	-column 1 -row 0 -sticky "ew" -padx 10

#--- directory
grid [button .n.dialogsPane.modals_frame.b_directory -text "Directory" -image [image create photo -file "./media/chart_organisation.png"] -compound left -command openDirectoryDialog] \
	-column 0 -row 1 -padx 10 -pady 10 -sticky "ew"
grid [entry .n.dialogsPane.modals_frame.e_directory] \
	-column 1 -row 1 -sticky "ew" -padx 10 

#--- open_file
grid [button .n.dialogsPane.modals_frame.b_open_file -text "Open File" -image [image create photo -file "./media/folder_page.png"] -compound left -command openOpenFileDialog] \
	-column 0 -row 2 -padx 10 -pady 10 -sticky "ew"
grid [entry .n.dialogsPane.modals_frame.e_open_file] \
	-column 1 -row 2 -sticky "ew" -padx 10 

#--- save_file
grid [button .n.dialogsPane.modals_frame.b_save_file -text "Save File" -image [image create photo -file "./media/disk.png"] -compound left -command openSaveFileDialog] \
	-column 0 -row 3 -padx 10 -pady 10 -sticky "ew"
grid [entry .n.dialogsPane.modals_frame.e_save_file] \
	-column 1 -row 3 -sticky "ew" -padx 10 

#--- message
grid [button .n.dialogsPane.modals_frame.b_message -text "Message" -image [image create photo -file "./media/comment.png"] -compound left -command openMessageDialog] \
	-column 0 -row 4 -padx 10 -pady 10 -sticky "ew"
grid [entry .n.dialogsPane.modals_frame.e_message] \
	-column 1 -row 4 -sticky "ew" -padx 10 





#--- non modal ----------------------------------------------------------------
labelframe .n.dialogsPane.non_modals_frame -text "Non Modal"
pack .n.dialogsPane.non_modals_frame -side top -fill both -padx 10 -pady 10 -expand 1 -anchor "center"

grid columnconfigure .n.dialogsPane.non_modals_frame 0 -weight 0
grid columnconfigure .n.dialogsPane.non_modals_frame 1 -weight 1

#--- color
grid [button .n.dialogsPane.non_modals_frame.b_font -text "Font" -image [image create photo -file "./media/style.png"] -compound left -command openFontDialog] \
	-column 0 -row 0 -padx 10 -pady 10
grid [entry .n.dialogsPane.non_modals_frame.e_font] \
	-column 1 -row 0 -sticky "ew" -padx 10














proc openColorDialog {} {
	set color [tk_chooseColor -initialcolor beige -title "Choose a color"]
	.n.dialogsPane.modals_frame.e_color delete 0 end
	.n.dialogsPane.modals_frame.e_color insert 0 $color
}

proc openDirectoryDialog {}	{
	set dir [tk_chooseDirectory -initialdir ~ -title "Choose a directory"]
	.n.dialogsPane.modals_frame.e_directory delete 0 end
	.n.dialogsPane.modals_frame.e_directory insert 0 $dir
}

proc openOpenFileDialog {} {
	set file [tk_getOpenFile -initialdir ~ -multiple true -title "Choose a file to opening"]
	.n.dialogsPane.modals_frame.e_open_file delete 0 end
	.n.dialogsPane.modals_frame.e_open_file insert 0 $file
}

proc openSaveFileDialog {} {
	set file [tk_getSaveFile -initialdir ~ -title "Choose a file to saving"]
	.n.dialogsPane.modals_frame.e_save_file delete 0 end
	.n.dialogsPane.modals_frame.e_save_file insert 0 $file
}

proc openMessageDialog {} {
	set file [tk_messageBox \
		-detail "Nunc at aliquam arcu. Sed eget tellus ligula.\nSed egestas est et tempus cursus." \
		-message "Lorem ipsum dolor sit amet." \
		-type okcancel \
		-title "Choose a file to saving"]
	.n.dialogsPane.modals_frame.e_message delete 0 end
	.n.dialogsPane.modals_frame.e_message insert 0 $file
}





proc openFontDialog {} {

	proc __set_font_input {value} {
		.n.dialogsPane.non_modals_frame.e_font delete 0 end
		.n.dialogsPane.non_modals_frame.e_font insert 0 $value
	}

	tk fontchooser configure -command __set_font_input
	tk fontchooser show

}



# auto dialogPane = new Frame();

# 			auto modalLabelFrame = new LabelFrame(dialogPane, "Modal")
# 				.configureGeometryColumn(1, 1)
# 				.pack(10, 0, GeometrySide.top, GeometryFill.both, AnchorPosition.center, true);

# 				auto colorButton = new Button(modalLabelFrame, new EmbeddedPng!("color_swatch.png"), "Color", ImagePosition.left)
# 					.setCommand(&this.openColorDialog)
# 					.grid(0, 0, 10);

# 				this._colorEntry = new Entry(modalLabelFrame)
# 					.grid(1, 0, 10, 0, 1, 1, "ew");

# 				auto directoryButton = new Button(modalLabelFrame, new EmbeddedPng!("chart_organisation.png"), "Directory", ImagePosition.left)
# 					.setCommand(&this.openDirectoryDialog)
# 					.grid(0, 1, 10);

# 				this._directoryEntry = new Entry(modalLabelFrame)
# 					.setWidth(40)
# 					.grid(1, 1, 10, 0, 1, 1, "ew");

# 				auto fileOpenButton = new Button(modalLabelFrame, new EmbeddedPng!("folder_page.png"), "Open File", ImagePosition.left)
# 					.setCommand(&this.openOpenFileDialog)
# 					.grid(0, 2, 10);

# 				this._openFileEntry = new Entry(modalLabelFrame)
# 					.setWidth(40)
# 					.grid(1, 2, 10, 0, 1, 1, "ew");

# 				auto fileSaveButton = new Button(modalLabelFrame, new EmbeddedPng!("disk.png"), "Save File", ImagePosition.left)
# 					.setCommand(&this.openSaveFileDialog)
# 					.grid(0, 3, 10);

# 				this._saveFileEntry = new Entry(modalLabelFrame)
# 					.setWidth(40)
# 					.grid(1, 3, 10, 0, 1, 1, "ew");

# 				auto messageButton = new Button(modalLabelFrame, new EmbeddedPng!("comment.png"), "Message", ImagePosition.left)
# 					.setCommand(&this.openMessageDialog)
# 					.grid(0, 4, 10);

# 				this._messageEntry = new Entry(modalLabelFrame)
# 					.setWidth(40)
# 					.grid(1, 4, 10, 0, 1, 1, "ew");

# 			auto nonModalLabelFrame = new LabelFrame(dialogPane, "Non Modal")
# 				.configureGeometryColumn(1, 1)
# 				.pack(10, 0, GeometrySide.top, GeometryFill.both, AnchorPosition.center, true);

# 				auto fontButton = new Button(nonModalLabelFrame, new EmbeddedPng!("style.png"), "Font", ImagePosition.left)
# 					.setCommand(&this.openFontDialog)
# 					.grid(0, 0, 10);

# 				this._fontEntry = new Entry(nonModalLabelFrame)
# 					.setWidth(40)
# 					.grid(1, 0, 10, 0, 1, 1, "ew");

# 		return dialogPane; 







