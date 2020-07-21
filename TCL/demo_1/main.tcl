#!/usr/bin/wish


wm title . "Tcl/Tk Demo 1"
wm minsize . 550 560
# TODO
# this.mainWindow.setDefaultIcon([new EmbeddedPng!("tkicon.png")]);
. configure -menu .main_menu

#--- Menu(https://www.tcl.tk/man/tcl8.6/TkCmd/menu.htm)
menu .main_menu

#--- file
menu .main_menu.file -tearoff 0
.main_menu add cascade -menu .main_menu.file -label File -underline 0


#--- check button submenu
menu .main_menu.file.check_boxes -tearoff 0
.main_menu.file add cascade -menu .main_menu.file.check_boxes -label "Checkbutton submenu"

.main_menu.file.check_boxes add checkbutton -label "Check option 1"
.main_menu.file.check_boxes add checkbutton -label "Check option 2"
.main_menu.file.check_boxes add checkbutton -label "Check option 3"


#--- radio button submenu
menu .main_menu.file.radio -tearoff 0
.main_menu.file add cascade -menu .main_menu.file.radio -label "Radiobutton submenu"

.main_menu.file.radio add radiobutton -label "Radio option 1"
.main_menu.file.radio add radiobutton -label "Radio option 2"
.main_menu.file.radio add radiobutton -label "Radio option 3"




.main_menu.file add separator

.main_menu.file add command -label Exit -command { exit }


menu .main_menu.help -tearoff 0
.main_menu add cascade -menu .main_menu.help -label Help -underline 0
.main_menu.help add command -label About -command { exit }

#--- other
# .main_menu add command -label QQQ -command {set myvariable "QQQ"}









grid [label .myLabel -background red -text "Hello World" -relief ridge -borderwidth 3 -padx 100 -pady 100 -textvariable myvariable]
   

menubutton .myMenubutton -menu .myMenubutton.myMenu -text "ChangeText"
menu .myMenubutton.myMenu
.myMenubutton.myMenu add command -label Hello -command {set myvariable "Hello"}
.myMenubutton.myMenu add command -label World -command {set myvariable "World"}
grid .myMenubutton
# grid [label .myLabel  -text "Select An option"  -height 5 -width 15 -textvariable myvariable]