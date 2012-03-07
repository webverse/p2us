package us.party2.model.factory
{
	import us.party2.model.adapter.IRESTRequesterAdapter;
	import us.party2.model.consumer.http.HTTPServiceConsumer;
	import us.party2.model.requester.RESTRequester;
	import us.party2.utils.Constants;

	public class RESTRequesterFactory
	{
		public function RESTRequesterFactory() {}
		
		//LFM
		public static function createLfmRequester(query:String, page:Number, baseUrl:String):IRESTRequesterAdapter {
			var url:String = baseUrl.replace("$q", query).replace("$p", page);
			var consumer:HTTPServiceConsumer = new HTTPServiceConsumer(url);
			var requester:RESTRequester = new RESTRequester();
			requester.consumer = consumer;
			
			return requester;
		}
		
		//SONGKICK
		public static function createSongKickArtistIdRequester(query:String, baseUrl:String):IRESTRequesterAdapter {
			var url:String = baseUrl.replace("$q", query);
			var consumer:HTTPServiceConsumer = new HTTPServiceConsumer(url);
			var requester:RESTRequester = new RESTRequester();
			requester.consumer = consumer;
			
			return requester;
		}
		
		public static function createSongKickArtistCalendarRequester(artid:Number, page:Number, baseUrl:String):IRESTRequesterAdapter {
			var url:String = baseUrl.replace("$artid", artid).replace("$p", page);
			var consumer:HTTPServiceConsumer = new HTTPServiceConsumer(url);
			var requester:RESTRequester = new RESTRequester();
			requester.consumer = consumer;
			
			return requester;
		}
		
	}
}