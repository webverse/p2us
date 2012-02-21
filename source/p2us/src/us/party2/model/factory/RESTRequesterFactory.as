package us.party2.model.factory
{
	import us.party2.model.adapter.IRESTRequesterAdapter;
	import us.party2.model.consumer.http.HTTPServiceConsumer;
	import us.party2.model.requester.LfmRequester;
	import us.party2.utils.Constants;

	public class RESTRequesterFactory
	{
		public function RESTRequesterFactory()
		{
		}
		
		public static function createLfmCityRequester(city:String, page:Number):IRESTRequesterAdapter {
			var url:String = Constants.LFM_CITY_URL.replace("$c", city).replace("$p", page);
			var consumer:HTTPServiceConsumer = new HTTPServiceConsumer(url);
			var requester:LfmRequester = new LfmRequester();
			requester.consumer = consumer;
			
			return requester;
		
		}
		
		public static function createLfmPartyRequester(party:String, page:Number):IRESTRequesterAdapter {
			var url:String = Constants.LFM_ARTIST_URL.replace("$a", party).replace("$p", page);
			var consumer:HTTPServiceConsumer = new HTTPServiceConsumer(url);
			var requester:LfmRequester = new LfmRequester();
			requester.consumer = consumer;
			
			return requester;
		}
		
	}
}