package Screens
{
	import feathers.controls.Button;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	
	import starling.events.Event;
	
	public class ProfileScreen extends Screen
	{
		private var lblNome:Label;
		private var lblCognome:Label;
		private var lblFacolta:Label;
		private var imgProfilo:ImageLoader;
		private var txtNome:TextInput;
		private var txtCognome:TextInput;
		private var txtFacolta:TextInput;
		
		private var btnSalvaProfilo:Button;
		
		private var _width:int;
		private var _height:int;
		
		public function ProfileScreen()
		{
			super();
			this.addEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
		}
		
		private function addedToStageHandler(e:Event):void {
			_width = stage.stageWidth;
			_height = stage.stageHeight;
			
			CreateInterface();
			AddComponents();
		}
		
		private function CreateInterface():void {
			//gestione immagine profilo
			imgProfilo = new ImageLoader();
			imgProfilo.maxWidth = 150;
			imgProfilo.maxHeight = 150;
			imgProfilo.x = 2;
			imgProfilo.y = 5;
			imgProfilo.maintainAspectRatio = true;
			imgProfilo.source = "assets/Profile.jpg";
			
			//gestione nome persona
			lblNome = new Label();
			lblNome.x = 155;
			lblNome.y = 15;
			lblNome.text = "Nome";
			
			txtNome = new TextInput();
			txtNome.x = 230;
			txtNome.y = 10;
			txtNome.width = _width - 240;
			
			//gestione cognome persona
			lblCognome = new Label();
			lblCognome.x = 155;
			lblCognome.y = 65;
			lblCognome.text = "Cognome";
			
			txtCognome = new TextInput();
			txtCognome.x = 230;
			txtCognome.y = 60;
			txtCognome.width = _width - 240;
			
			//gestione facolta
			lblFacolta = new Label();
			lblFacolta.x = 155;
			lblFacolta.y = 115;
			lblFacolta.text = "Facolta";
			
			txtFacolta = new TextInput();
			txtFacolta.x = 230;
			txtFacolta.y = 110;
			txtFacolta.width = _width - 240;
			
			//pulsanti azione
			//pulsante salva profilo
			btnSalvaProfilo = new Button();
			btnSalvaProfilo.x = 20;
			btnSalvaProfilo.y = imgProfilo.y + 155;
			btnSalvaProfilo.width = 115;
			btnSalvaProfilo.label = "Salva profilo";
			btnSalvaProfilo.addEventListener(Event.TRIGGERED, btnSalvaProfilo_triggeredHandler);
		}
		
		private function AddComponents():void {
			addChild(imgProfilo);
			addChild(lblNome);
			addChild(txtNome);
			addChild(lblCognome);
			addChild(txtCognome);
			addChild(lblFacolta);
			addChild(txtFacolta);
			addChild(btnSalvaProfilo);
		}
		
		private function btnSalvaProfilo_triggeredHandler(e:Event):void {
			
		}
		
	}
}