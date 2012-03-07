package us.party2.utils
{
	import com.mapquest.LatLng;
	import com.mapquest.tilemap.pois.MapIcon;
	import com.mapquest.tilemap.pois.Poi;

	public class P2Poi extends Poi
	{
		private var _data:*;
		
		public function P2Poi(latLang:LatLng, mapIcon:MapIcon=null, data:*=null)
		{
			super(latLang, mapIcon);
			this.data = data;
		}
		
		public function set data(value:*):void {
			_data = value;
		}
		
		public function get data():* {
			return _data;
		}
		
	}
}