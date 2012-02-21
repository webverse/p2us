package us.party2.controller
{
	import mx.controls.Alert;
	
	import us.party2.presentation.MainPresentationModel;

	public class MainController
	{
		[Bindable]
		[Inject(source="mainPresentationModel")]
		public var model:MainPresentationModel;
		
		public function MainController() {}
		
		[EventHandler(event="ChangeStateMainEvent.STATE_CHANGED", properties="data")]
		public function changeStateEventHandler(data:*):void {
			model.toggleSelected = data.toggle;
			model.storedQuery = data.stmt;
			model.checkToggle();
		}
	}
}