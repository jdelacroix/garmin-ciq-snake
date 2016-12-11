using Toybox.WatchUi as Ui;

class GameSpeedView extends Ui.View {

	var options;

	function initialize(options) {
		View.initialize();
		self.options = options;		
	}
	
	function onUpdate(dc) {
		View.onUpdate(dc);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        
        var top_left_x = (dc.getWidth()-168)/2;
		var top_left_y = (dc.getHeight()-96)/2;
		
		for (var i=0; i<11; i+=1) {
			if (i<options.speed) {
				dc.fillRectangle(top_left_x+i*16, top_left_y+96-8*(i+1), 8, 8*(i+1));	
			} else {
				dc.drawRectangle(top_left_x+i*16, top_left_y+96-8*(i+1), 8, 8*(i+1));	
			}
		}
		
		dc.drawText(top_left_x+84, top_left_y+96+20, Graphics.FONT_SMALL, options.speed, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
		dc.drawText(top_left_x+84, top_left_y-10, Graphics.FONT_LARGE, "SPEED", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
	}

}