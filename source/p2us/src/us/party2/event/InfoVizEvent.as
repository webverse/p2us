package us.party2.event
{
	import flash.events.Event;
	
	public class InfoVizEvent extends Event
	{
		private var _data:*;
		
		public static const LOAD_INFOVIZ:String = "InfoVizEvent.LOAD_INFOVIZ";
		
		public function InfoVizEvent(type:String, data:*, bubbles:Boolean=false, cancelable:Boolean=false)
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
			return new InfoVizEvent(type, data, bubbles, cancelable);
		}
	}
}