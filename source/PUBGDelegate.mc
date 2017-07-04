using Toybox.WatchUi as Ui;

class PUBGDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.GameTypeMenu(), new PUBGMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

}