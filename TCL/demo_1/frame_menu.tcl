# https://www.tcl.tk/man/tcl8.6/TkCmd/menu.htm
# http://zetcode.com/gui/tcltktutorial/menustoolbars/
#--- Menu
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

.main_menu.file add command -label Exit -image img_close -compound left -accelerator "Ctrl-q" -command { exit }



#--- themes menu
menu .main_menu.themes -tearoff 0
.main_menu add cascade -menu .main_menu.themes -label "Themes" -underline 0

#--- проблемы с lambda... непонятно как использовать...
foreach theme_name [ttk::style theme names] {
	.main_menu.themes add command -label $theme_name -command "ttk::style theme use $theme_name"
}


#--- help menu
menu .main_menu.help -tearoff 0
.main_menu add cascade -menu .main_menu.help -label "Help" -underline 0
.main_menu.help add command -label About -image img_help -compound left -accelerator "F1" -command { show_about }




#--- other
# .main_menu add command -label QQQ -command {set myvariable "QQQ"}