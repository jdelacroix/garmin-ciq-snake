using Toybox.WatchUi as Ui;

class GameDelegate extends Ui.BehaviorDelegate {

	var game;

    function initialize(game) {
        BehaviorDelegate.initialize();
        self.game = game;
    }
    
    function onNextPage() {
    	game.snake.turnRight();
    	return true;
    }
    
    function onPreviousPage() {
    	game.snake.turnLeft();
    	return true;
    }

}