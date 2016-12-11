using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class SnakeApp extends App.AppBase {

	var options;

    function initialize() {
        AppBase.initialize();
        options = new GameOptions();
        options.speed = 11;      
    }
    
    function onLoop() {
    	
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new SnakeView(), new SnakeDelegate(options) ];
    }

}
