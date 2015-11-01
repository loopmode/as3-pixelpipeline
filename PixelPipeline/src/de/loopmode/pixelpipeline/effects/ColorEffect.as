package de.loopmode.pixelpipeline.effects
{
	import com.gskinner.geom.ColorMatrix;
	
	import de.loopmode.pixelpipeline.core.IPixelEffect;
	
	import flash.display.BitmapData;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class ColorEffect implements IPixelEffect
	{
		
		private const ZERO_POINT:Point = new Point(0, 0);
		
		private var cmx:ColorMatrix;
		private var cmxFilter:ColorMatrixFilter;
		
		private var _brightness:Number;
		private var _contrast:Number;
		private var _saturation:Number;
		private var _hue:Number;
		
		public function ColorEffect(brightness:Number=0, contrast:Number=0, saturation:Number=0, hue:Number=0)
		{
			cmx = new ColorMatrix();
			cmxFilter = new ColorMatrixFilter();
			this.configure(brightness, contrast, saturation, hue);
		}

		public function configure(brightness:Number, contrast:Number, saturation:Number, hue:Number):void 
		{
			_brightness = brightness;
			_contrast = contrast;
			_saturation = saturation;
			_hue = hue;
		}
		
		public function process(image:BitmapData):BitmapData
		{
			cmx.adjustBrightness(_brightness);
			cmx.adjustContrast(_contrast);
			cmx.adjustSaturation(_saturation);
			cmx.adjustHue(_hue);
			cmxFilter.matrix = cmx;
			
			image.applyFilter(image, image.rect, ZERO_POINT, cmxFilter);
			
			cmx.reset();
			return image;
		}
		
		public function get hue():Number
		{
			return _hue;
		}

		public function set hue(value:Number):void
		{
			_hue = value;
		}

		public function get saturation():Number
		{
			return _saturation;
		}

		public function set saturation(value:Number):void
		{
			_saturation = value;
		}

		public function get contrast():Number
		{
			return _contrast;
		}

		public function set contrast(value:Number):void
		{
			_contrast = value;
		}

		public function get brightness():Number
		{
			return _brightness;
		}

		public function set brightness(value:Number):void
		{
			_brightness = value;
		}
	}
}