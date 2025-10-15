package main

import tk "modernc.org/tk9.0"

/*
proc show_about {} {

	tk_messageBox -message "Tkd Showcase" \
		-icon info \
		-detail "A showcase Tkd application demonstrating menus, widgets and dialogs.\n\nThe possiblities are endless."
	}
*/
func showAboutModal() {
	tk.MessageBox(tk.Msg("Tkd Showcase"), tk.Icon("info"), tk.Detail("A showcase Tkd application demonstrating menus, widgets and dialogs.\n\nThe possiblities are endless."))
}
