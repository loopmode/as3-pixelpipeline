package de.loopmode.pixelpipeline.core
{
	import flash.display.BitmapData;


	public interface IPixelEffect
	{
		/**
		 * Applies modifications to an image.
		 * @param image - the image to process
		 * @return The processed image
		 */
		function process(image:BitmapData):BitmapData;
	}
}