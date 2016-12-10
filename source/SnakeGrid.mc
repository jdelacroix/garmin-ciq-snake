class SnakeGrid {

	const GRID_HEIGHT = 11;
	const GRID_WIDTH = 20;


	const GRID_PIXEL_HEIGHT = 96;
	const GRID_PIXEL_WIDTH = 168;
	const GRID_PIXEL_OFFSET = 4;
	
	var x_0;
	var y_0;
	
	function initialize() {
	
	}
	
	function setOrigin(dc) {
		x_0 = (dc.getWidth()-GRID_PIXEL_WIDTH)/2;
		y_0 = (dc.getHeight()-GRID_PIXEL_HEIGHT)/2;
	}
	
	function draw(dc) {
		dc.setPenWidth(1);
		dc.drawRectangle(x_0, y_0, GRID_PIXEL_WIDTH, GRID_PIXEL_HEIGHT);
	}
	
	function drawDebugGrid(dc) {
		dc.setPenWidth(1);
		dc.setColor(Graphics.COLOR_PINK, Graphics.COLOR_BLACK);
		var xy;
		for (var i=0; i<GRID_WIDTH; i+=1) {
			for (var j=0; j<GRID_HEIGHT; j+=1) {
				xy = self.fromGridCellToPixels(i,j);
				dc.drawRectangle(xy[0],xy[1],8,8);
			}
		}
	}
	
	function fromGridCellToPixels(c_x, c_y) {
		return [ x_0+GRID_PIXEL_OFFSET+8*c_x , y_0+GRID_PIXEL_OFFSET+8*c_y ];
	}
	
	function drawFruit(dc, c_x, c_y) {
		var xy = self.fromGridCellToPixels(c_x, c_y);
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
		
		dc.drawRectangle(xy[0]+3, xy[1]+1, 2, 2);
    	dc.drawRectangle(xy[0]+5, xy[1]+3, 2, 2);
    	dc.drawRectangle(xy[0]+1, xy[1]+3, 2, 2);
    	dc.drawRectangle(xy[0]+3, xy[1]+5, 2, 2);
	}
	
	function offsetGap(c_x, c_y, c_x_1, c_y_1) {
		if (c_x == c_x_1) {
			if (c_y < c_y_1) {
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
			pxy = fromGridCellToPixels(current.x, current.y);
			offsets = offsetGap(current.x, current.y, current.next.x, current.next.y);
			dc.fillRectangle(pxy[0]+1-offsets[0], pxy[1]+1-offsets[1], 6+offsets[2], 6+offsets[3]);
			current = current.next;
		}
		
	    pxy = self.fromGridCellToPixels(snake.tail.x, snake.tail.y); 
		dc.fillRectangle(pxy[0]+1, pxy[1]+1, 6, 6);
	}
}