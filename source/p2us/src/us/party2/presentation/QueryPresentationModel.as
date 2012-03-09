package us.party2.presentation
{
	import assets.Assets;
	
	import com.demonsters.debugger.MonsterDebugger;
	import com.mapquest.LatLng;
	import com.mapquest.tilemap.InfoWindow;
	import com.mapquest.tilemap.ShapeCollection;
	import com.mapquest.tilemap.TilemapComponent;
	import com.mapquest.tilemap.pois.ForceDeclutter;
	import com.mapquest.tilemap.pois.MapIcon;
	import com.mapquest.tilemap.pois.Poi;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	
	import us.party2.event.InfoVizEvent;
	import us.party2.event.QueryEvent;
	import us.party2.model.pojo.LfmPojo;
	import us.party2.utils.P2Poi;
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
		
		private var _selectedItem:*;
		
		private var _pn:PageNavigator;
		
		private var _map:TilemapComponent;
		
		private var selectedPoi:P2Poi = null;
		
		private var currentPoi:P2Poi = null;
		
		public function QueryPresentationModel() {}
		
		public function query(data:*):void {
			if (data)
				dispatcher.dispatchEvent(new QueryEvent(QueryEvent.QUERY, data));
			
		}
		
		public function loadMap():void {
			
			var shapeCollection:ShapeCollection = new ShapeCollection();
			
			if (listProvider.length > 0) {
				map.removeShapes();
				map.declutter = new ForceDeclutter();
				
				var count:int = 0;
				for each (var pojo:LfmPojo in listProvider) {
					
					if (count == 0)
						map.setCenter(new LatLng(pojo.lat, pojo.long), 4);
					
					var poi:P2Poi = new P2Poi(new LatLng(pojo.lat, pojo.long));
					poi.rolloverAndInfoTitleText = pojo.title;
					
					var strContent:String = new String();
					strContent = pojo.title+"\n";
					strContent += pojo.startDate+"\n";
					strContent += "<a target='_blank' href='"+pojo.url+"'><font color='#0021FF'>Lastfm</font></a>";
					
					poi.icon = buildDefaultIcon();
					poi.infoContent = strContent;
					poi.data = pojo;					
					poi.addEventListener(MouseEvent.CLICK, onPoiClick);
					shapeCollection.add(poi);
					
					count++;
				}
				
				map.addShapeCollection(shapeCollection);
				
			}	
		}
		
		private function onPoiClick(event:MouseEvent):void {
			
			if (selectedPoi != null)
				currentPoi = selectedPoi;
			
			selectedPoi = event.currentTarget as P2Poi;
			
			selectedItem = selectedPoi.data;
					
			selectedPoi.icon = buildSelectedIcon();
			
			if (currentPoi != null && (currentPoi != selectedPoi))
				currentPoi.icon = buildDefaultIcon();
			
			dispatcher.dispatchEvent(new InfoVizEvent(InfoVizEvent.LOAD_INFOVIZ, selectedPoi));
			
		}
		
		private function buildDefaultIcon():MapIcon {
			var icon:MapIcon = new MapIcon();
			icon.setImage(new Assets.PARTY_BLACK(), 32, 41);
			
			return icon;
		}
		
		private function buildSelectedIcon():MapIcon {
			var icon:MapIcon = new MapIcon();
			icon.setImage(new Assets.PARTY_WHITE(), 32, 41);
			
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
		
		public function set selectedItem(value:*):void {
			_selectedItem = value;
		}
		
		public function get selectedItem():* {
			return _selectedItem;
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