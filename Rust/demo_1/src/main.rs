use tk::cmd::*;
use tk::*;

mod menu;

fn main() -> TkResult<()> {
    println!("Hello, world!");

    let tk = make_tk!()?;
    let root = tk.root();

    // menu::make_menu(root);

    let main_frame = root.add_frame(())?.pack(-fill("both") - expand(true))?;

    main_frame
        .add_button(-text("Exit") - command("destroy ."))?
        .pack(-side("bottom"))?;

    let nb = main_frame
        .add_ttk_notebook(())?
        .pack(-side("top") - expand(true) - fill("both") - padx(10) - pady(10))?;
    let p1 = nb.add_ttk_frame(())?;
    let p2 = nb.add_ttk_frame(())?;
    let p3 = nb.add_ttk_frame(())?;
    let p4 = nb.add_ttk_frame(())?;
    nb.add(&p1, -text("Widgets"))?;
    nb.add(&p2, -text("Panels"))?;
    nb.add(&p3, -text("Canvas"))?;
    nb.add(&p4, -text("Dialogs"))?;

    // bind Ctrl+q
    root.bind(event::control().key_press(TkKey::q), "destroy .")?;

    Ok(main_loop())
}
