class Game {

	var snake;
	var fruit;
	var map;
	
	var speed;
	
	var timer;
	var tick, overclock;
	
	var is_game_over;
	
	var score;
	
	function initialize(options) {
		snake = null;
		speed = options.speed;
		tick = 11-speed;
		is_game_over = false;
		score = 0;
		map = new GameMap();
	}
	
	
	
	function onStateUpdate() {
		if (tick < 0) {
			is_game_over = !snake.moveForward(map);	
			if (is_game_over) {
				Attention.playTone(Attention.TONE_FAILURE);
				return;
			}
			if (snake.isEatingFruit(fruit)) {
				Attention.playTone(Attention.TONE_LAP);
				fruit.relocate(map);
				snake.grow();
				
				score += speed*snake.body_length; 
			}
			tick = 11-speed;
		}
		tick -= 1;
	}
	
	function onStart() {
		snake = new Snake(map);
		fruit = new Fruit(map);
	}
	
	function onStop() {
	}


}