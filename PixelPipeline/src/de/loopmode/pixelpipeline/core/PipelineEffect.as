package de.loopmode.pixelpipeline.core
{

	public class PipelineEffect implements IPipelineEffect
	{
		private var _next:IPipelineEffect;
		private var _processor:IPixelEffect;
		
		public function PipelineEffect(processor:IPixelEffect)
		{
			_processor = processor;
		}
		
		public function set next(value:IPipelineEffect):void
		{
			_next = value;
		}
		
		public function get next():IPipelineEffect
		{
			return _next;
		}
		
		public function set effect(value:IPixelEffect):void
		{
			_processor = value;
		}
		
		public function get effect():IPixelEffect
		{
			return _processor;
		}
	}
}