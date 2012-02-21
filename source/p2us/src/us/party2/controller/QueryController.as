package us.party2.controller
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import us.party2.model.adapter.IRESTRequesterAdapter;
	import us.party2.model.factory.RESTRequesterFactory;
	import us.party2.model.pojo.LfmPojo;
	import us.party2.presentation.MainPresentationModel;
	import us.party2.presentation.QueryPresentationModel;
	import us.party2.utils.Constants;

	public class QueryController
	{
		
		[Bindable]
		[Inject(source="mainPresentationModel")]
		public var model:MainPresentationModel;
		
		[Bindable]
		[Inject(source="queryPresentationModel")]
		public var queryModel:QueryPresentationModel;
		
		private var requester:IRESTRequesterAdapter;
		
		private var dataProvider:ArrayCollection;
		
		private var storedQuery:String = "";
		
		private var newQuery:Boolean = false;
		
		public function QueryController() {}
		
		[EventHandler(event="QueryEvent.QUERY", properties="data")]
		public function queryEventHandler(data:*):void {
			
			newQuery = data.newQuery;
			
			storedQuery = data.stmt;
			
			if (data.toggle == Constants.TOGGLE_CITY)
				requester = RESTRequesterFactory.createLfmCityRequester(data.stmt, data.page);
			else
				requester = RESTRequesterFactory.createLfmPartyRequester(data.stmt, data.page);
			
			requester.consumer.httpService.addEventListener(ResultEvent.RESULT, onRequestResult);
			requester.request();
		}
		
		public function onRequestResult(event:ResultEvent):void {
			dataProvider = new ArrayCollection();
			queryModel.perPage = event.result.lfm.events.perPage;
			queryModel.totalPages = event.result.lfm.events.totalPages;
			queryModel.totalRecords = event.result.lfm.events.total;
			
			for each (var o:Object in event.result.lfm.events.event as ArrayCollection) {
				
				var p:LfmPojo = new LfmPojo();
				p.title = o.title;
				p.lat = o.venue.location.point.lat;
				p.long = o.venue.location.point.long;
				p.venue = o.venue;
				p.artists = o.artists;
				p.url = o.url;
				p.description = o.description;
				p.cancelled = o.cancelled;
				p.image = o.image as ArrayCollection;
				
				p.reviews = o.reviews;
				p.tag = o.tag;
				p.startDate = o.startDate;
				//p.tags;
				dataProvider.addItem(p);
			}
			
			queryModel.listProvider = dataProvider;
			model.storedQuery = storedQuery;
			
			if (model.currentState == MainPresentationModel.MAIN_STATE)
				model.changeState(MainPresentationModel.RESULTS_STATE);
				
			if (queryModel.map != null)
				queryModel.loadMap();
			
			if (queryModel.pn != null && newQuery)
				queryModel.pn.init();
			
			
		}
		
	}
}