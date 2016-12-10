using Toybox.WatchUi as Ui;

class SnakeView extends Ui.View {

	var grid;	
	var snake;

    function initialize() {
        View.initialize();
        grid = new SnakeGrid();
        snake = new Snake();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        
        for (var i=0; i<5; i+=1) {
	        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
	        dc.clear();
	               
	        grid.setOrigin(dc);
	        grid.draw(dc);
	        grid.drawDebugGrid(dc);
	        grid.drawFruit(dc,4,9);
	        grid.drawSnake(dc, snake);
	        snake.moveForward();
	    }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}
