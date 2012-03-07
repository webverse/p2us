package us.party2.utils
{
	public class Constants
	{
		public static const TOGGLE_CITY:String = "toggleBtnCity";
		
		public static const TOGGLE_PARTY:String = "toggleBtnParty";
		
		public static const MAP_KEY:String = "Fmjtd%7Cluua21utn9%2C2w%3Do5-h4txg";
		
		public static const LFM_KEY:String = "ba76c756a044a0b6ee654a00129ad49c";
		
		public static const SOUNDKICK_KEY:String = "makn2uMZs1aBvlj3";
		
		public static const QUERY_LIMIT:Number = 10;
		
		public static const LFM_CITY_URL:String = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=$q&page=$p&limit="+QUERY_LIMIT+"&api_key="+LFM_KEY;
		
		public static const LFM_ARTIST_URL:String = "http://ws.audioscrobbler.com/2.0/?method=artist.getevents&artist=$q&autocorrect=1&page=$p&limit="+QUERY_LIMIT+"&api_key="+LFM_KEY;
		
		public static const SONGKICK_ARTISTID_URL:String = "http://api.songkick.com/api/3.0/search/artists.json?query=$q&apikey="+SOUNDKICK_KEY;
		
		public static const SONGKICK_CALENDAR_URL:String = "http://api.songkick.com/api/3.0/artists/$artid/calendar.json?page=$p&per_page="+QUERY_LIMIT+"&apikey="+SOUNDKICK_KEY;
		
		public static const MS_PER_DAY:Number = 1000 * 60 * 60 * 24;
		
	}
}