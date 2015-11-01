package de.loopmode.pixelpipeline.effects
{
	import de.loopmode.pixelpipeline.core.IPixelEffect;
	
	import flash.display.BitmapData;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	
	public class BlurEffect implements IPixelEffect
	{
		private var blurFilter:BlurFilter;
		private const ZERO_POINT:Point = new Point(0, 0);
		
		public function BlurEffect(x:Number=5, y:Number=5, quality:Number=1)
		{
			blurFilter = new BlurFilter(x, y, quality);
		}
		
		public function get blurX():Number
		{
			return blurFilter.blurX;
		}

		public function set blurX(value:Number):void
		{
			blurFilter.blurX = value;
		}

		public function get blurY():Number
		{
			return blurFilter.blurY;
		}

		public function set blurY(value:Number):void
		{
			blurFilter.blurY = value;
		}

		public function get blurQuality():int
		{
			return blurFilter.quality;
		}

		public function set blurQuality(value:int):void
		{
			blurFilter.quality = value;
		}

		public function process(image:BitmapData):BitmapData
		{
			image.applyFilter(image, image.rect, ZERO_POINT, blurFilter);
			return image;
		}
	}
}