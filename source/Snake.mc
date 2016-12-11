class Snake {

	var compass_direction, compass_direction_offsets;
	
	var body_length;
	
	var pixel_offsets = [ [0, 0, 0, 2], [2, 0, 2, 0], [0, 2, 0, 2], [0, 0, 2, 0] ];
	
	class BodySegment {
		var x, y;
		var pixel_x, pixel_y;
		//var prev;
		var next;
		var offset;
		function initialize(x, y) {
			self.x = x;
			self.y = y;
			//self.prev = null;
			self.next = null;
		}
	}
	var head, tail;
	
	var growth;
	
	function initialize(map) {
		compass_direction = 1;
		compass_direction_offsets = [0, 1, 0, -1];
	
		body_length = 8;
		head = new BodySegment(body_length-1, 10);
		map.occupy(head.x, head.y);
		var current = head;
		var pxy = map.fromGridToPixels(head.x, head.y);
		current.pixel_x = pxy[0];
		current.pixel_y = pxy[1];
		
		for (var i=body_length-2; i>=0; i-=1) {
			current.offset = pixel_offsets[compass_direction];
			current.next = new BodySegment(i, 10);
			current = current.next;
			map.occupy(current.x, current.y);
			pxy = map.fromGridToPixels(current.x, current.y);
			current.pixel_x = pxy[0];
			current.pixel_y = pxy[1];
		}
		tail = current;
		
		growth = false;
	}
	
	function isOutOfBounds() {
		return (head.x < 0 || head.x >= 20 || head.y < 0 || head.y >= 11);
	}
	
	function isEatingFruit(fruit) {	
		return (head.x == fruit.x && head.y == fruit.y);
	}
	
	function turnRight() {
		compass_direction = (compass_direction+1)%4;
	}
	
	function turnLeft() {
		compass_direction = (compass_direction+3)%4;
	}
	
	function grow() { 
		growth = true;
	}
	
	function moveForward(map) {
		var new_head = new BodySegment(head.x+self.compass_direction_offsets[compass_direction], head.y+self.compass_direction_offsets[3-compass_direction]);
		new_head.next = head;
		head = new_head;
		head.offset = pixel_offsets[compass_direction];
		
		if (isOutOfBounds() || map.state(head.x, head.y)) {
			return false;
		}
		
		var pxy = map.fromGridToPixels(head.x, head.y);
		head.pixel_x = pxy[0];
		head.pixel_y = pxy[1];
		
		map.occupy(head.x, head.y);
		
		if (!growth) { 
			var current = head;
			while (current.next != tail) {
				current = current.next;
			}
			current.next = null;
			map.free(tail.x, tail.y);
			tail = current;
			map.occupy(tail.x, tail.y);
		} else {
			growth = false;
			body_length += 1;
		}
		
		return true;
	}

}