package us.party2.model.adapter
{
	import mx.rpc.events.FaultEvent;
	
	import us.party2.model.consumer.http.HTTPServiceConsumer;

	public interface IRESTRequesterAdapter
	{
		function request():void;
		function onFail(fail:FaultEvent):void;
		
		function set consumer(service:HTTPServiceConsumer):void;
		function get consumer():HTTPServiceConsumer;

	}
}