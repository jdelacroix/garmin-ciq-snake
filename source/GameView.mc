using Toybox.WatchUi as Ui;

class GameView extends Ui.View {

	var game;
	var timer;
	var options;

	function initialize(options) {
		View.initialize();
		game = new Game(options);
		timer = new Timer.Timer();
		self.options = options;
	}
	
	function onLayout(dc) {
		game.map.align(dc);
	}
	
	function onCallback() {
		game.onStateUpdate();
		requestUpdate();
	}
	
	function onShow() {
		game.onStart();
		timer.start(method(:onCallback), 50, true);
	}
	
	function onUpdate(dc) {
		View.onUpdate(dc);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2-68, Graphics.FONT_SMALL, options.top_score, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2+68, Graphics.FONT_SMALL, game.score,  Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        
        game.map.drawBorder(dc);
        if (!game.is_game_over) {
        	game.map.drawFruit(dc, game.fruit);
        	game.map.drawSnake(dc, game.snake);
        } else {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_MEDIUM, "GAME OVER", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        	timer.stop();
        }
	}
	
	function onHide() {
		timer.stop();
		game.onStop();
		if (game.score > options.top_score) {
			options.top_score = game.score;
		}
	}


}