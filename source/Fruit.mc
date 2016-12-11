class Fruit {

	var x, y;
	
	function initialize(map) {
		relocate(map);
	}
	
	function relocate(map) {
		x = Math.rand() % 20;
		y = Math.rand() % 11;
		
		while(map.state(x,y)) {
			x = Math.rand() % 20;
			y = Math.rand() % 11;
		}
		//System.println("Fruit relocated: (" + x + "," + y + ")");
	}

}