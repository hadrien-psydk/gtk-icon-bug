#include <gtk/gtk.h>

int main(int argc, char** argv) {
	gtk_init(&argc, &argv);

	auto window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
	gtk_window_set_title(GTK_WINDOW(window), "tinygtkcpp");

	g_signal_connect(G_OBJECT(window),
		"destroy", G_CALLBACK(gtk_main_quit), nullptr);

	gtk_widget_show_all(window);
	gtk_main();
	return 0;
}
