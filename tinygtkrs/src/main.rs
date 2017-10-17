extern crate gtk;
use gtk::prelude::*;
use gtk::{Window, WindowType};

fn main() {
	if gtk::init().is_err() {
		println!("Failed to initialize GTK.");
		return;
	}

	let window = Window::new(WindowType::Toplevel);
	window.set_title("tinygtkrs");

	window.connect_delete_event(|_, _| {
		gtk::main_quit();
		Inhibit(false)
	});
	window.show_all();
	gtk::main();
}

