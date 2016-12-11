using Toybox.WatchUi as Ui;

class SnakeDelegate extends Ui.BehaviorDelegate {

	var options;

    function initialize(options) {
        BehaviorDelegate.initialize();
        self.options = options;
    }
    
    function onSelect() {
    	var view = new GameView(options);
    	var delegate = new GameDelegate(view.game);
    	Ui.pushView(view, delegate, Ui.SLIDE_UP);
    	return true;
    }
    

    //function onMenu() {
    //    //Ui.pushView(new Rez.Menus.MainMenu(), new SnakeMenuDelegate(), Ui.SLIDE_UP);
    //    var view = new GameSpeedView(options);
    //    Ui.pushView(view, new GameSpeedDelegate(view), Ui.SLIDE_UP);
    //    return true;
    //}
}