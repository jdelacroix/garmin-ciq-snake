using Toybox.WatchUi as Ui;

class GameSpeedDelegate extends Ui.BehaviorDelegate {

	var view;
	
	function initialize(view) {
		BehaviorDelegate.initialize();
		self.view = view;
	}
	
	function onPreviousPage() {
		if (view.options.speed < 11) {
			view.options.speed += 1;
			view.requestUpdate();
		}
	}
	
	function onNextPage() {
		if (view.options.speed > 1) {
			view.options.speed -= 1;
			view.requestUpdate();
		}
	}
	
}