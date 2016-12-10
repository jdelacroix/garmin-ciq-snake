class Snake {

	enum {
		NORTH,
		EAST,
		SOUTH,
		WEST
	}
	var compass_direction;
	
	var body_length;
	
	class BodySegment {
		var x, y;
		//var prev;
		var next;
		function initialize(x, y) {
			self.x = x;
			self.y = y;
			//self.prev = null;
			self.next = null;
		}
	}
	var head, tail;
	
	function initialize() {
		body_length = 8;
		head = new BodySegment(body_length-1, 10);
		var current = head;
		for (var i=body_length-2; i>=0; i-=1) {
			current.next = new BodySegment(i, 10);
			//current.next.prev = current.weak();
			current = current.next;
		}
		tail = current;
		compass_direction = EAST;
	}
	
	function changeDirection() {
	
	}
	
	function moveForward() {
		var new_head = null;
		if (compass_direction == EAST) {
			new_head = new BodySegment(head.x+1, head.y);
			System.println("Snake is moving EAST!");
		}	
		new_head.next = head;
		head = new_head;
		//head.next.prev = head.weak();
		
		var current = head;
		while (current.next != tail) {
			current = current.next;
		}
		current.next = null;
		tail = current;
		System.println("tail @ (" + tail.x + "," + tail.y + ")");
	}

}