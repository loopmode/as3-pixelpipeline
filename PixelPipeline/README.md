A library for running multiple bitmap filter effects in a chain.  
The order of the effects can be controlled.
Individual effects may be modified.

Calling the `process()` method will start the chain and return the last result.

Usage:
	
	import de.loopmode.pixelpipeline.core.Pipeline;
	import de.loopmode.pixelpipeline.effects.BlurEffect;
	import de.loopmode.pixelpipeline.effects.ColorEffect;
	
	colorEffect = new ColorEffect();
	blurEffect = new BlurEffect();
	effects = new Pipeline(colorEffect, blurEffect);
		
	colorEffect.contrast = 255;
	colorEffect.brightness = -10;
	blurEffect.blurX = 5;
	blurEffect.blurY = 5;
	
	image.bitmapData = effects.process(bitmapData);

