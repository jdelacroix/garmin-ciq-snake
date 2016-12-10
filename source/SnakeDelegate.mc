using Toybox.WatchUi as Ui;

class SnakeDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new SnakeMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

}