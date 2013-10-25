package
{
	import flash.display.Sprite;
	import starling.core.Starling;
	
	[SWF(width="480", height="320", frameRate="60", backgroundColor="#314046")]
	public class AngryDevs extends Sprite
	{
		private var _starling:Starling;
		
		public function AngryDevs()
		{	
			_starling = new Starling(Game, stage);
			_starling.antiAliasing = 1;
			_starling.start();
		}		
	}
}