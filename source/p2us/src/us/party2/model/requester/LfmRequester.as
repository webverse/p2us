package us.party2.model.requester
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	
	import us.party2.model.adapter.IRESTRequesterAdapter;
	import us.party2.model.consumer.http.HTTPServiceConsumer;
	
	public class LfmRequester implements IRESTRequesterAdapter
	{
		private var _consumer:HTTPServiceConsumer;
		
		public function LfmRequester() {}
		
		public function request():void
		{
			consumer.httpService.send();
		}
		
		public function onFail(fault:FaultEvent):void {
			Alert.show(fault.fault.faultDetail, "LfmRequester");
		}
		
		
		public function set consumer(c:HTTPServiceConsumer):void {
			_consumer = c;
		}
		
		public function get consumer():HTTPServiceConsumer {
			return _consumer;
		}
		
	}
}