package de.loopmode.pixelpipeline.core
{

	/**
	 * The IBitmapPipeline interface defines methods to manage a list of bitmap effects.
	 */
	public interface IPipeline extends IPixelEffect
	{
		
		function get items():Vector.<IPipelineEffect>;

		/**
		 * Adds an effect to this pipeline.
		 * @param effect - The effect instance
		 */
		function add(effect:IPixelEffect):Boolean;
		
		/**
		 * Adds an effect before a given other effect.
		 * @param target - The existing effect
		 * @param effect - The new effect to insert before `target`.
		 * @return true when the effect was added.
		 */
		function addBefore(target:IPixelEffect, effect:IPixelEffect):Boolean;
		
		/**
		 * Adds an effect after a given other effect.
		 * @param target - The existing effect
		 * @param effect - The effect to insert after `target`.
		 * @return true when the effect was added.
		 */
		function addAfter(target:IPixelEffect, effect:IPixelEffect):Boolean;
		
		/**
		 * Adds an effect at given numeric position.
		 * @param index - The index at which to insert the `effect`
		 * @param effect - The effect to insert at `index`.
		 * @return true when the effect was added.
		 */
		function addAt(index:int, effect:IPixelEffect):Boolean;
		
		/**
		 * Removes an effect from this pipeline.
		 * @param effect - The effect to remove.
		 * @return true when the effect was found and removed.
		 */
		function remove(effect:IPixelEffect):Boolean;
		
		
		/**
		 * Removes the effect at a given numeric index.
		 * @param index - The index at which to remove
		 * @return true when an effect was found and removed.
		 */
		function removeAt(index:int):Boolean;
		
		/**
		 * Returns the numeric index of an effect in this pipeline.
		 * @param effect - The effect in question
		 * @return The index of `effect` or -1 if it was not found.
		 */
		function indexOf(effect:IPixelEffect):int;
	}
}