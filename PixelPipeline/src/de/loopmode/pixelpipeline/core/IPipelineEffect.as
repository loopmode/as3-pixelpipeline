package de.loopmode.pixelpipeline.core
{

	/**
	 * The IPipelineEffect interface defines an item in a a pipeline. 
	 * It holds references to the next item in the pipeline and to an effect to be applied when the pipeline is processing this item.
	 **/
	public interface IPipelineEffect
	{
		/**
		 * Sets the next effect in the pipeline chain.
		 * it will be called automatically after this one.
		 */
		function set next(value:IPipelineEffect):void;
		
		/**
		 * The next effect in the pipeline chain.
		 */
		function get next():IPipelineEffect;
		
		/**
		 * Sets the effect to be applied when processed in the pipeline chain.
		 */
		function set effect(value:IPixelEffect):void;
		
		/**
		 * The effect that will be applied in the pipeline chain.
		 */
		function get effect():IPixelEffect;
	}
}