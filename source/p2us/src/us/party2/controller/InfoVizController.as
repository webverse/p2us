package us.party2.controller
{
	import mx.controls.Alert;
	
	import us.party2.presentation.InfoVizPresentationModel;
	import us.party2.utils.DateUtils;

	public class InfoVizController
	{
		[Bindable]
		[Inject("infoVizPresentationModel")]
		public var infoModel:InfoVizPresentationModel;
		
		public function InfoVizController(){}
		
		[EventHandler(event="InfoVizEvent.LOAD_INFOVIZ", properties="data")]
		public function infoVizLoadHandler(data:*):void {
			infoModel.loadInfoViz(data);
		}
	}
}