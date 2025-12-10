package main

import (
	tk "modernc.org/tk9.0"
)

func mainPanelsFrame() *tk.TFrameWidget {
	frame := tk.TFrame()

	makeTreesView(frame.Window)

	return frame
}

func makeTreesView(parent *tk.Window) {
	pw := parent.Panedwindow(tk.Orient("vertical"))
	tk.Pack(
		pw,
		tk.Side("top"),
		tk.Fill("both"),
		tk.Padx(10),
		tk.Pady(10),
		// tk.Expand(true),
		tk.Anchor("center"),
	)

	// tree -------------------------------------------------------------------
	tv := pw.TTreeview()
	tv.Heading("#0", tk.Txt("Directory listing"), tk.Anchor("w"))

	tv.Insert("", 1, tk.Id("id_computer"), tk.Txt("Computer"), tk.Open(true), tk.Tags("computer"))

	tv.Insert("id_computer", 1, tk.Id("id_documents"), tk.Txt("Documents"), tk.Open(true), tk.Tags("folder"))

	tv.Insert("id_documents", 1, tk.Txt("Important notes.txt"), tk.Tags("file"))
	tv.Insert("id_documents", 2, tk.Txt("The D Programming Language.pdf"), tk.Tags("pdf"))

	tv.Insert("id_computer", 2, tk.Id("id_pictures"), tk.Txt("Pictures"), tk.Open(true), tk.Tags("folder"))
	tv.Insert("id_pictures", 1, tk.Txt("Gary and Tessa.jpg"), tk.Tags("image"))

	tv.Insert("id_computer", 3, tk.Id("id_videos"), tk.Txt("Videos"), tk.Open(true), tk.Tags("folder"))
	tv.Insert("id_videos", 1, tk.Txt("Carlito's Way (1993).mpg"), tk.Tags("video"))
	tv.Insert("id_videos", 2, tk.Txt("Aliens (1986).mpg"), tk.Tags("video"))

	tv.TagConfigure("computer", tk.Image(tk.NewPhoto(tk.File("./media/computer.png"))))
	tv.TagConfigure("folder", tk.Image(tk.NewPhoto(tk.File("./media/folder.png"))))
	tv.TagConfigure("file", tk.Image(tk.NewPhoto(tk.File("./media/page.png"))))
	tv.TagConfigure("pdf", tk.Image(tk.NewPhoto(tk.File("./media/page_white_acrobat.png"))))
	tv.TagConfigure("image", tk.Image(tk.NewPhoto(tk.File("./media/images.png"))))
	tv.TagConfigure("video", tk.Image(tk.NewPhoto(tk.File("./media/film.png"))))

	pw.Add(tv.Window)

	// table ------------------------------------------------------------------
	tt := pw.TTreeview(tk.Show("headings"), tk.Columns("a b c"))
	tt.Heading("#1", tk.Txt("Film"), tk.Anchor("w"))
	tt.Heading("#2", tk.Txt("Year"))
	tt.Heading("#3", tk.Txt("IMDB ranking"))

	tt.Column("#2", tk.Width(20))
	tt.Column("#3", tk.Width(50))

	tt.Insert("", 1, tk.Value("{The Shawshank Redemption} 1994 1"))
	tt.Insert("", 2, tk.Value("{The Godfather} 1972 2"))
	tt.Insert("", 3, tk.Value("{The Godfather: Part II} 1974 3"))
	tt.Insert("", 4, tk.Value("{The Dark Knight} 2008 4"))
	tt.Insert("", 5, tk.Value("{Pulp Fiction} 1994 5"))
	tt.Insert("", 6, tk.Value("{The Good, the Bad and the Ugly} 1966 6"))
	tt.Insert("", 7, tk.Value("{Schindler's List} 1993 7"))
	tt.Insert("", 8, tk.Value("{Angry Men} 1957 8"))
	tt.Insert("", 9, tk.Value("{The Lord of the Rings: The Return of the King} 2003 9"))
	tt.Insert("", 10, tk.Value("{Fight Club} 1999 10"))

	pw.Add(tt.Window)
}
