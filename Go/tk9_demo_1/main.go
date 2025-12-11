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
	nbk.Add(
		mainWidgetsFrame(),
		tk.Txt("Widgets"),
		tk.Image(tk.NewPhoto(tk.File("./media/layout_content.png"))),
		tk.Compound("left"),
	)
	nbk.Add(
		mainPanelsFrame(),
		tk.Txt("Panes"),
		tk.Image(tk.NewPhoto(tk.File("./media/application_tile_horizontal.png"))),
		tk.Compound("left"),
	)
	nbk.Add(
		mainCanvasFrame(),
		tk.Txt("Canvas"),
		tk.Image(tk.NewPhoto(tk.File("./media/shape_ungroup.png"))),
		tk.Compound("left"),
	)
	nbk.Add(
		makaeDialogsFrame(),
		tk.Txt("Dialogs"),
		tk.Image(tk.NewPhoto(tk.File("./media/application_double.png"))),
		tk.Compound("left"),
	)

	// set default page
	nbk.Select(3)

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
