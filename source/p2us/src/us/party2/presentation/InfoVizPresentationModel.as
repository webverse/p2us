package us.party2.presentation
{
	import flash.events.IEventDispatcher;
	
	import us.party2.model.pojo.LfmPojo;

	[Bindable]
	public class InfoVizPresentationModel
	{
		private var _inLayout:Boolean = false;
		
		private var _pojo:LfmPojo;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public function InfoVizPresentationModel() {}
		
		public function loadInfoViz(data:*):void {
			inLayout = true;
			pojo = data.data as LfmPojo;
		}
		
		public function set inLayout(value:Boolean):void {
			_inLayout = value;
		}
		
		public function get inLayout():Boolean {
			return _inLayout;
		}
		
		public function set pojo(value:LfmPojo):void {
			_pojo = value;
		}
		
		public function get pojo():LfmPojo {
			return _pojo;
		}
		
	}
}