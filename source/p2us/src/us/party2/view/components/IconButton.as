package us.party2.view.components
{
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	
	import us.party2.view.components.skin.IconButtonSkin;
	
	[Style(name="icon", type="*")]
	public class IconButton extends Button
	{
		public function IconButton()
		{
			addEventListener(FlexEvent.CREATION_COMPLETE, onComplete);
			super();
		}
		
		private function onComplete(event:FlexEvent):void {
			setStyle("skinClass", Class(IconButtonSkin));
		}
	}
}