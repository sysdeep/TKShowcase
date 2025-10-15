package main

import (
	"fmt"

	tk "modernc.org/tk9.0"
)

func makeMenu() *tk.MenuWidget {
	menubar := tk.Menu()

	// file
	fileMenu := makeFileMenu(menubar)
	menubar.AddCascade(tk.Lbl("File"), tk.Underline(0), tk.Mnu(fileMenu))

	// themes
	themesMenu := makeThemesMenu(menubar)
	menubar.AddCascade(tk.Lbl("Themes"), tk.Underline(0), tk.Mnu(themesMenu))

	// help
	helpMenu := makeHelpMenu(menubar)
	menubar.AddCascade(tk.Lbl("Help"), tk.Underline(0), tk.Mnu(helpMenu))

	return menubar

}

func makeFileMenu(menubar *tk.MenuWidget) *tk.MenuWidget {
	fileMenu := menubar.Menu()
	// fileMenu.AddCommand(tk.Lbl("New"), tk.Underline(0), tk.Accelerator("Ctrl+N"))
	// fileMenu.AddCommand(Lbl("Open..."), Underline(0), Accelerator("Ctrl+O"), Command(func() { GetOpenFile() }))
	// Bind(App, "<Control-o>", Command(func() { fileMenu.Invoke(1) }))
	// fileMenu.AddCommand(Lbl("Save"), Underline(0), Accelerator("Ctrl+S"))
	// fileMenu.AddCommand(Lbl("Save As..."), Underline(5))
	// fileMenu.AddCommand(Lbl("Close"), Underline(0), Accelerator("Crtl+W"))
	// fileMenu.AddSeparator()
	// fileMenu.AddCommand(Lbl("Exit"), Underline(1), Accelerator("Ctrl+Q"), ExitHandler())
	// Bind(App, "<Control-q>", Command(func() { fileMenu.Invoke(6) }))

	// file check boxes
	fileCheckBoxes := fileMenu.Menu()
	fileCheckBoxes.AddCheckbutton(tk.Lbl("Check option 1"))
	fileCheckBoxes.AddCheckbutton(tk.Lbl("Check option 2"))
	fileCheckBoxes.AddCheckbutton(tk.Lbl("Check option 3"))

	fileMenu.AddCascade(tk.Lbl("Checkbutton submenu"), tk.Underline(0), tk.Mnu(fileCheckBoxes))

	// file radio boxes
	fileRadioBoxes := fileMenu.Menu()
	fileRadioBoxes.AddRadiobutton(tk.Lbl("Radio option 1"))
	fileRadioBoxes.AddRadiobutton(tk.Lbl("Radio option 2"))
	fileRadioBoxes.AddRadiobutton(tk.Lbl("Radio option 3"))

	fileMenu.AddCascade(tk.Lbl("Radiobutton submenu"), tk.Underline(0), tk.Mnu(fileRadioBoxes))

	fileMenu.AddSeparator()

	// TODO: image
	// .main_menu.file add command -label Exit -image img_close -compound left -accelerator "Ctrl-q" -command { exit }
	fileMenu.AddCommand(tk.Lbl("Exit"), tk.Accelerator("Ctrl-q"), tk.Underline(1), tk.ExitHandler())

	return fileMenu
}

func makeThemesMenu(parent *tk.MenuWidget) *tk.MenuWidget {
	// 	menu .main_menu.themes -tearoff 0
	// .main_menu add cascade -menu .main_menu.themes -label "Themes" -underline 0

	// #--- проблемы с lambda... непонятно как использовать...
	// foreach theme_name [ttk::style theme names] {
	// 	.main_menu.themes add command -label $theme_name -command "ttk::style theme use $theme_name"
	// }

	menu := parent.Menu()

	for _, name := range tk.StyleThemeNames() {
		themeName := name
		menu.AddCommand(tk.Lbl(name), tk.Command(func() {
			fmt.Println(themeName)
			tk.StyleThemeUse(themeName)
		}))
	}

	return menu

}

/*
menu .main_menu.help -tearoff 0
.main_menu add cascade -menu .main_menu.help -label "Help" -underline 0
.main_menu.help add command -label About -image img_help -compound left -accelerator "F1" -command { show_about }
*/
func makeHelpMenu(parent *tk.MenuWidget) *tk.MenuWidget {
	menu := parent.Menu()

	// todo: image
	menu.AddCommand(tk.Lbl("About"), tk.Accelerator("F1"), tk.Command(showAboutModal))

	return menu
}
