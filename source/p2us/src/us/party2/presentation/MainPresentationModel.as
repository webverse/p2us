package us.party2.presentation
{
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	
	import us.party2.event.ChangeStateMainEvent;
	
	[Bindable]
	public class MainPresentationModel
	{
		
		public static const MAIN_STATE:String = "MAIN";
		
		public static const RESULTS_STATE:String = "RESULTS";
		
		public var currentState:String = "MAIN";
		
		private var _toggleSelected:String = "toggleBtnCity";
		
		private var _citySelected:Boolean = true;
		
		private var _partySelected:Boolean = false;
		
		private var _storedQuery:String = "";
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public function MainPresentationModel() {}
		
		public function changeState(state:String):void {
			this.currentState = state;
			var data:Object = new Object();
			data.stmt = storedQuery;
			data.toggle = toggleSelected;
			dispatcher.dispatchEvent(new ChangeStateMainEvent(ChangeStateMainEvent.STATE_CHANGED, data));
		}
		
		public function checkToggle():void {
			
			if (toggleSelected == 'toggleBtnCity') {
				citySelected = true;
				partySelected = false;
				
			} else {
				citySelected = false;
				partySelected = true;
				
			}
		}
		
		public function set toggleSelected(btnName:String):void {
			_toggleSelected = btnName;
		}
		
		public function get toggleSelected():String {
			return _toggleSelected;
		}
		
		public function set citySelected(value:Boolean):void {
			_citySelected = value;
		}
		
		public function get citySelected():Boolean {
			return _citySelected;
		}
		
		public function set partySelected(value:Boolean):void {
			_partySelected = value;
		}
		
		public function get partySelected():Boolean {
			return _partySelected;
		}
		
		public function set storedQuery(qry:String):void {
			_storedQuery = qry;
		}
		
		public function get storedQuery():String {
			return _storedQuery;
		}
	}
}