package us.party2.event
{
	import flash.events.Event;
	
	public class ChangeStateMainEvent extends Event
	{
		private var _data:* = null;
		
		public static const STATE_CHANGED: String = "ChangeStateMainEvent.STATE_CHANGED";
		
		public function ChangeStateMainEvent (type:String, data:*, bubbles:Boolean=true, cancelable : Boolean=false)
		{
			super (type, bubbles, cancelable);
			this._data = data;
		}
		
		public function get data():* {
			return _data;
		}
		
		public function set data (value:*) : void {
			_data = value;
		}
		
		override public function clone():Event {
			return new ChangeStateMainEvent(type, data, bubbles, cancelable);
		}
	}
}