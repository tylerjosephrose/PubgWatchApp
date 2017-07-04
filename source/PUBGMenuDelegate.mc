using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class PUBGMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :Solo) {
            Sys.println("Solo Selected");
        } else if (item == :Duo) {
            Sys.println("Duo Selected");
        } else if (item == :Squad) {
            Sys.println("Squad Selected");
        }
    }

}