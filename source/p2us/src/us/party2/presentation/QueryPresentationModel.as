package us.party2.presentation
{
	import assets.Assets;
	
	import com.mapquest.LatLng;
	import com.mapquest.tilemap.InfoWindow;
	import com.mapquest.tilemap.TilemapComponent;
	import com.mapquest.tilemap.pois.MapIcon;
	import com.mapquest.tilemap.pois.Poi;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import spark.primitives.BitmapImage;
	
	import us.party2.event.QueryEvent;
	import us.party2.model.pojo.LfmPojo;
	import us.party2.view.components.InfoViz;
	import us.party2.view.components.PageNavigator;
	
	[Bindable]
	public class QueryPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		private var _totalRecords:Number = 0;
		
		private var _totalPages:Number = 0;
		
		private var _perPage:Number = 0;
		
		private var _listProvider:ArrayCollection = new ArrayCollection(); 
		
		private var _pn:PageNavigator;
		
		private var _map:TilemapComponent;
		
		private var selectedPoi:Poi = null;
		
		private var currentPoi:Poi = null;
		
		public function QueryPresentationModel() {}
		
		public function query(data:*):void {
			if (data)
				dispatcher.dispatchEvent(new QueryEvent(QueryEvent.QUERY, data));
			
		}
		
		public function loadMap():void {
			
			if (listProvider.length > 0) {
				map.removeShapes();
				
				var count:int = 0;
				for each (var pojo:LfmPojo in listProvider) {
					
					if (count == 0)
						map.setCenter(new LatLng(pojo.lat, pojo.long), 4);
					
					var poi:Poi = new Poi(new LatLng(pojo.lat, pojo.long));
					poi.rolloverAndInfoTitleText = pojo.title+" - "+pojo.startDate;
					
					var strContent:String = new String();
					strContent = pojo.title+"\n";
					strContent += pojo.startDate+"\n";
					strContent += "<a target='_blank' href='"+pojo.url+"'><font color='#0021FF'>"+pojo.url+"</font></a>";
					
					poi.icon = buildDefaultIcon();
					poi.infoContent = strContent;
					poi.addEventListener(MouseEvent.CLICK, onPoiClick);
					
					/*
					map.infoWindow = new InfoWindow(map.tileMap);
					
					var infoViz:InfoViz = new InfoViz();
					infoViz.width = 400;
					infoViz.height = 300;
					
					poi.infoContent = infoViz;
					*/
					
					map.addShape(poi);
					
					count++;
				}
				
			}	
		}
		
		private function onPoiClick(event:MouseEvent):void {
			
			if (selectedPoi != null)
				currentPoi = selectedPoi;
			
			selectedPoi = event.currentTarget as Poi;
					
			selectedPoi.icon = buildSelectedIcon();
			
			if (currentPoi != null && (currentPoi != selectedPoi))
				currentPoi.icon = buildDefaultIcon();
			
		}
		
		private function buildDefaultIcon():MapIcon {
			var icon:MapIcon = new MapIcon();
			icon.setImage(new Assets.BLACK_MARKER(), 32, 41);
			
			return icon;
		}
		
		private function buildSelectedIcon():MapIcon {
			var icon:MapIcon = new MapIcon();
			icon.setImage(new Assets.WHITE_MARKER(), 32, 41);
			
			return icon;
		}
		
		public function set totalRecords(value:Number):void {
			_totalRecords = value;
		}
		
		public function get totalRecords():Number {
			return _totalRecords;
		}
		
		public function set totalPages(value:Number):void {
			_totalPages = value;
		}
		
		public function get totalPages():Number {
			return _totalPages;
		}
		
		public function set perPage(value:Number):void {
			_perPage = value;
		}
		
		public function get perPage():Number {
			return _perPage;
		}
		
		public function set listProvider(value:ArrayCollection):void {
			_listProvider = value;
		}
		
		public function get listProvider():ArrayCollection {
			return _listProvider;
		}
		
		public function set pn(value:PageNavigator):void {
			_pn = value;
		}
		
		public function get pn():PageNavigator {
			return _pn;
		}
		
		public function set map(value:TilemapComponent):void {
			_map = value;
		}
		
		public function get map():TilemapComponent {
			return _map;
		}
	}
}