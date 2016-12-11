class GameMap {

	const GRID_HEIGHT = 11;
	const GRID_WIDTH = 20;

	const GRID_PIXEL_HEIGHT = 96;
	const GRID_PIXEL_WIDTH = 168;
	const GRID_PIXEL_OFFSET = 4;
	
	var top_left_x;
	var top_left_y;
	
	var grid;
	
	function initialize() {
		grid = new [220];
		for (var i=0; i<220; i+=1) {
			grid[i] = false;
		}
	}
	
	function occupy(x, y) {
		grid[20*y+x] = true;
	}
	
	function free(x, y) {
		grid[20*y+x] = false;
	}
	
	function state(x, y) {
		return grid[20*y+x];
	}
	
	function isOutOfBounds (x,y) {
		var i = x+20*y;
		return (i < 0 || i > 219);
	}
	
	function align(dc) {
		top_left_x = (dc.getWidth()-GRID_PIXEL_WIDTH)/2;
		top_left_y = (dc.getHeight()-GRID_PIXEL_HEIGHT)/2;
	}
	
	function fromGridToPixels(c_x, c_y) {
		return [ top_left_x+GRID_PIXEL_OFFSET+8*c_x , top_left_y+GRID_PIXEL_OFFSET+8*c_y ];
	}
	
	function drawBorder(dc) {
		dc.drawRectangle(top_left_x, top_left_y, GRID_PIXEL_WIDTH, GRID_PIXEL_HEIGHT);
		dc.drawRectangle(top_left_x+1, top_left_y+1, GRID_PIXEL_WIDTH-2, GRID_PIXEL_HEIGHT-2);
	}
	
	function drawGrid(dc) {
		dc.setColor(Graphics.COLOR_PINK, Graphics.COLOR_BLACK);
		var xy;
		for (var i=0; i<GRID_WIDTH; i+=1) {
			for (var j=0; j<GRID_HEIGHT; j+=1) {
				xy = fromGridToPixels(i,j);
				dc.drawRectangle(xy[0],xy[1],8,8);
			}
		}
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
	}
	
	function drawFruit(dc, fruit) {
		var xy = self.fromGridToPixels(fruit.x, fruit.y);
		
		dc.drawRectangle(xy[0]+3, xy[1]+1, 2, 2);
    	dc.drawRectangle(xy[0]+5, xy[1]+3, 2, 2);
    	dc.drawRectangle(xy[0]+1, xy[1]+3, 2, 2);
    	dc.drawRectangle(xy[0]+3, xy[1]+5, 2, 2);
	}
	
	function offsetToFillGap(c_x, c_y, c_x_1, c_y_1) {
		if (c_x == c_x_1) { // N or S
			if (c_y < c_y_1) {  // S
				return [ 0, 0, 0, 2];
			} else { // c_y > c_y_1
				return [ 0, 2, 0, 2];
			}
		} else { // c_y == c_y_1
			if (c_x < c_x_1) {
				return [ 0, 0, 2, 0];
			} else { // c_x < c_x_1
				return [ 2, 0, 2, 0];
			}
		}
	}
	
	function drawSnake(dc, snake) {
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
		
		var current = snake.head;
		var pxy;
		var offsets;
		while (current != snake.tail) {
			//pxy = fromGridToPixels(current.x, current.y);
			//offsets = offsetToFillGap(current.x, current.y, current.next.x, current.next.y);
			dc.fillRectangle(current.pixel_x+1-current.offset[0], current.pixel_y+1-current.offset[1], 6+current.offset[2], 6+current.offset[3]);
			current = current.next;
		}
		
	    // pxy = self.fromGridToPixels(snake.tail.x, snake.tail.y); 
		dc.fillRectangle(snake.tail.pixel_x+1, snake.tail.pixel_y+1, 6, 6);
	}
}