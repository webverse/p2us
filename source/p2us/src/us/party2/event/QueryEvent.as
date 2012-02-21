package us.party2.event
{
	import flash.events.Event;
	
	public class QueryEvent extends Event
	{
		private var _data:* = null;
		
		public static const QUERY:String = "QueryEvent.QUERY";
		
		public function QueryEvent(type:String, data:*, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		public function set data(value:*):void {
			_data = value;
		}
		
		public function get data():* {
			return _data;
		}
		
		override public function clone():Event {
			return new QueryEvent(type, data, bubbles, cancelable);
		} 
	
	}
}