package main

import (
	"fmt"

	tk "modernc.org/tk9.0"
)

func main() {
	fmt.Println("start")

	tk.App.WmTitle("tk9 demo 1")

	// menu
	menubar := makeMenu()
	tk.App.Configure(tk.Mnu(menubar), tk.Width("8c"), tk.Height("6c"))

	// binds
	tk.Bind(tk.App, "<F1>", tk.Command(showAboutModal))
	tk.Bind(tk.App, "<Control-q>", tk.ExitHandler())

	// tabs
	nbk := tk.TNotebook()

	// TODO: images
	nbk.Add(mainWidgetsFrame(), tk.Txt("Widgets"))
	nbk.Add(tk.TLabel(tk.Txt("TODO")), tk.Txt("Panes"))
	nbk.Add(tk.TLabel(tk.Txt("TODO")), tk.Txt("Canvas"))
	nbk.Add(tk.TLabel(tk.Txt("TODO")), tk.Txt("Dialogs"))

	tk.Pack(
		nbk,
		tk.Side("top"),
		tk.Fill("both"),
		// tk.Padx(2),
		// tk.Pady(2),
		tk.Anchor("center"),
		tk.Expand(true),
	)

	// exit
	tk.Pack(
		tk.TButton(tk.Txt("Exit"), tk.Command(func() { tk.Destroy(tk.App) }), tk.Width(10)),
		tk.Padx(5), tk.Pady(5),
		tk.Side("bottom"),
	)

	// start
	tk.App.Wait()
}
