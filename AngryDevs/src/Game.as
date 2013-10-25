package
{
	import Screens.AgendaScreen;
	import Screens.ExamsScreen;
	import Screens.ProfileScreen;
	import Screens.TrendScreen;
	
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.controls.TabBar;
	import feathers.data.ListCollection;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.animation.Transitions;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		protected var TabbedMenu:TabBar;
		protected var Navigator:ScreenNavigator;
		private var TransitionManager:ScreenSlidingStackTransitionManager;
		private var _width:int;
		private var _height:int;
		
		
		public function Game()
		{
			super();
			initialize();
			this.addEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
		}
		
		private function initialize():void {
			new MetalWorksMobileTheme();
			_width = 480;
			_height = 320;
			
			
		}
		
		private function IncreaseScreen():void {
			if(TabbedMenu.selectedIndex == 0){
				Navigator.showScreen("exams");
				TabbedMenu.selectedIndex = 1;
			} else if(TabbedMenu.selectedIndex == 1){
				Navigator.showScreen("agenda");
				TabbedMenu.selectedIndex = 2;
			} else if(TabbedMenu.selectedIndex == 2){
				Navigator.showScreen("trend");
				TabbedMenu.selectedIndex = 3;
			} else if(TabbedMenu.selectedIndex == 3){
				Navigator.showScreen("profile");
				TabbedMenu.selectedIndex = 0;
			}
		}
		
		private function DecreaseScreen():void {
			if(TabbedMenu.selectedIndex == 0){
				Navigator.showScreen("trend");
				TabbedMenu.selectedIndex = 3;
			} else if(TabbedMenu.selectedIndex == 1){
				Navigator.showScreen("profile");
				TabbedMenu.selectedIndex = 0;
			} else if(TabbedMenu.selectedIndex == 2){
				Navigator.showScreen("exams");
				TabbedMenu.selectedIndex = 1;
			} else if(TabbedMenu.selectedIndex == 3){
				Navigator.showScreen("agenda");
				TabbedMenu.selectedIndex = 2;
			}
		}
		
		private function addedToStageHandler(e:Event):void {
			//init menu
			TabbedMenu = new TabBar();
			TabbedMenu.dataProvider = new ListCollection(
				[
					{ label: "Profilo" },
					{ label: "Gestione esami" },
					{ label: "Agenda esami" },
					{ label: "Andamento" }
				]);
			TabbedMenu.selectedIndex = 0;
			TabbedMenu.width = _width;
			TabbedMenu.height = 40;
			TabbedMenu.y = _height - TabbedMenu.height;
			TabbedMenu.addEventListener( Event.CHANGE, TabbedMenu_changeHandler );
			
			addChild(TabbedMenu);
			
			//init screen navigator
			Navigator = new ScreenNavigator();
			Navigator.x = 0;
			Navigator.y = 0;
			Navigator.setSize(_width, _height - TabbedMenu.height);
			TransitionManager = new ScreenSlidingStackTransitionManager(Navigator);
			TransitionManager.duration = 0.4;
			TransitionManager.ease = Transitions.EASE_IN_OUT;
			addChild(Navigator);
			Navigator.addScreen( "profile", new ScreenNavigatorItem( ProfileScreen ) );
			Navigator.addScreen( "exams", new ScreenNavigatorItem( ExamsScreen ) );
			Navigator.addScreen( "agenda", new ScreenNavigatorItem( AgendaScreen ) );
			Navigator.addScreen( "trend", new ScreenNavigatorItem( TrendScreen ) );
			
			Navigator.showScreen("profile");
		}
		
		private function TabbedMenu_changeHandler(e:Event):void {
			if(TabbedMenu.selectedIndex == 0){
				Navigator.showScreen("profile");
			} else if(TabbedMenu.selectedIndex == 1){
				Navigator.showScreen("exams");
			} else if(TabbedMenu.selectedIndex == 2){
				Navigator.showScreen("agenda");
			} else if(TabbedMenu.selectedIndex == 3){
				Navigator.showScreen("trend");
			} else {
				Navigator.showScreen("profile");
			}
		}
		
	}
}