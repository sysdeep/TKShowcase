package main

import (
	"github.com/visualfc/atk/tk"
)

type Window struct {
	*tk.Window
}

func NewWindow() *Window {
	mw := &Window{tk.RootWindow()}

	tabs := tk.NewNotebook(mw)

	tabWidgets := newWidgets(tabs)
	tabPanels := newPanels(tabs)
	qlbl := tk.NewLabel(tabs, "Hello ATK")

	tabs.AddTab(tabWidgets, "Widgets")
	tabs.AddTab(tabPanels, "Panels")
	tabs.AddTab(qlbl, "qlbl")

	lbl := tk.NewLabel(mw, "Hello ATK")
	btn := tk.NewButton(mw, "Quit")
	btn.OnCommand(func() {
		tk.Quit()
	})
	tk.NewVPackLayout(mw).AddWidgets(tabs, lbl, tk.NewLayoutSpacer(mw, 0, true), btn)
	// mw.ResizeN(300, 200)
	return mw
}

func newFrame(parent tk.Widget) *tk.Frame {
	f := tk.NewFrame(parent)

	return f
}

func main() {
	tk.MainLoop(func() {
		mw := NewWindow()
		mw.SetTitle("ATK Sample")
		mw.Center(nil)
		mw.ShowNormal()
	})
}
