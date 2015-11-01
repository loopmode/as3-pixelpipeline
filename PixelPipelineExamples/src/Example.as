package
{
	
	import de.loopmode.pixelpipeline.core.Pipeline;
	import de.loopmode.pixelpipeline.effects.BlurEffect;
	import de.loopmode.pixelpipeline.effects.ColorEffect;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Run the example, move the mouse from top left to the sides and see what happens.
	 */
	
	public class Example extends Sprite
	{
		
		[Embed(source="assets/Koala.jpg")]
		private static var ExampleImage:Class;
		
		private var image:Bitmap;
		private var bitmapData:BitmapData;
		
		private var effects:Pipeline;
		private var colorEffect:ColorEffect;
		private var blurEffect:BlurEffect;

		public function Example()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		protected function onAddedToStage(event:Event):void
		{
			image = new ExampleImage();
			image.scaleX = image.scaleY = stage.stageWidth / image.width;
			addChild(image);
			
			bitmapData = image.bitmapData.clone();
			// demo syntax. colorEffect is injected, blurEffect is extracted. don't do this.
			colorEffect = new ColorEffect();
			effects = new Pipeline(colorEffect, new BlurEffect());
			blurEffect = effects.items[1].effect as BlurEffect;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			colorEffect.hue = rand(-180, 180) * (mouseX/stage.stageWidth);
			colorEffect.contrast = rand(0, 255) * (mouseX/stage.stageWidth);
			colorEffect.saturation = rand(-255, 255) * (mouseX/stage.stageWidth);
			colorEffect.brightness = rand(-255, 255) * (mouseX/stage.stageWidth);
			blurEffect.blurX = rand(0, 255) * (mouseY/stage.stageHeight);
			blurEffect.blurY = rand(0, 255) * (mouseY/stage.stageHeight);
			image.bitmapData = effects.process(bitmapData);
		}		
		
		private function rand(min:Number, max:Number):Number 
		{
			var range:Number = Math.abs(min - max);
			return Math.random() * range + min;
		}
	}
}