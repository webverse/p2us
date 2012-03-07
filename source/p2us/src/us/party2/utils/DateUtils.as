package us.party2.utils
{
	public class DateUtils
	{
		public function DateUtils()
		{
		}
		
		public static function daysBetween(startDate:Date, finalDate:Date):String {
			
			var difference:Number = Math.abs(finalDate.getTime() - startDate.getTime());
			
			return Math.round(difference/Constants.MS_PER_DAY).toString();
			
		}
	}
}