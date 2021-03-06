#!/usr/bin/wish
# https://www.tcl.tk/man/tcl8.6/TkCmd/contents.htm

puts "Hello!!!"




#--- themes list
#--- put themes dir here
# source themes/pkgIndex.tcl
# package require ttkthemes
# ttk::setTheme plastik



wm title . "Tcl/Tk Demo 1"
wm minsize . 550 560
# TODO
# this.mainWindow.setDefaultIcon([new EmbeddedPng!("tkicon.png")]);
. configure -menu .main_menu


#--- images -------------------------------------------------------------------
image create photo img_close -file "./media/cancel.png"
image create photo img_help -file "./media/help.png"
#--- images -------------------------------------------------------------------







#--- main menu ----------------------------------------------------------------
source "frame_menu.tcl"
#--- main menu ----------------------------------------------------------------




#--- bindings -----------------------------------------------------------------
bind . <Control-q> { exit }
bind . <F1> { show_about }
#--- bindings -----------------------------------------------------------------

#--- procs --------------------------------------------------------------------
#--- https://www.tcl.tk/man/tcl8.6/TkCmd/messageBox.htm
proc show_about {} {
tk_messageBox -message "Tkd Showcase" \
	-icon info \
	-detail "A showcase Tkd application demonstrating menus, widgets and dialogs.\n\nThe possiblities are endless."
}
#--- procs --------------------------------------------------------------------










#--- notebook -----------------------------------------------------------------
ttk::notebook .n


source "frame_widgets.tcl"
source "frame_panes.tcl"
source "frame_canvas.tcl"
source "frame_dialogs.tcl"



.n add .n.widgetPane -text "Widgets" \
	-image [image create photo -file "./media/layout_content.png"] -compound left
.n add .n.panedPane -text "Panes" \
	-image [image create photo -file "./media/application_tile_horizontal.png"] -compound left
.n add .n.canvasPane -text "Canvas" \
	-image [image create photo -file "./media/shape_ungroup.png"] -compound left
.n add .n.dialogsPane -text "Dialogs" \
	-image [image create photo -file "./media/application_double.png"] -compound left
pack .n -fill both -side top -padx 10 -pady 10 -anchor center -expand true
#--- notebook -----------------------------------------------------------------





#--- exit button --------------------------------------------------------------
#--- themes
# pack [ttk::combobox .select_theme -values [ttk::style theme names]] -side left -fill x -anchor nw -padx 5 -pady 5
# bind .select_theme <<ComboboxSelected>> { ttk::style theme use [.select_theme get] }


button .exit_button -text Exit -command {exit} -width 10
pack .exit_button -padx 5 -pady 5 
#--- exit button --------------------------------------------------------------

#--- size grip ----------------------------------------------------------------
pack [ttk::sizegrip .mygrip] -side right -anchor se

# pack [ttk::frame $top.statusbar] -side bottom -fill x
# pack [ttk::sizegrip $top.statusbar.grip] -side right -anchor se
#--- size grip ----------------------------------------------------------------



# auto exitButton = new Button("Exit")
# 			.setCommand(&this.exitApplication)
# 			.pack(5);

# 		auto sizeGrip = new SizeGrip(this.mainWindow)
# 			.pack(0, 0, GeometrySide.bottom, GeometryFill.none, AnchorPosition.southEast);





# grid [label .myLabel -background red -text "Hello World" -relief ridge -borderwidth 3 -padx 100 -pady 100 -textvariable myvariable]
   

# menubutton .myMenubutton -menu .myMenubutton.myMenu -text "ChangeText"
# menu .myMenubutton.myMenu
# .myMenubutton.myMenu add command -label Hello -command {set myvariable "Hello"}
# .myMenubutton.myMenu add command -label World -command {set myvariable "World"}
# grid .myMenubutton
# # grid [label .myLabel  -text "Select An option"  -height 5 -width 15 -textvariable myvariable]