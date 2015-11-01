package de.loopmode.pixelpipeline.core
{
	
	import flash.display.BitmapData;
	
	import flashx.textLayout.formats.WhiteSpaceCollapse;
	
	/**
	 * Runs a series of effects on an image.
	 */
	public class Pipeline implements IPipeline
	{
		private var _items:Vector.<IPipelineEffect> = new Vector.<IPipelineEffect>();
		private var buffer:BitmapData;
		
		public function Pipeline(...effects:Array)
		{
			if (effects) {
				for (var i:int = 0, t:int=effects.length; i < t; i++) {
					this.add(effects[i]);
				}
			}
		}
		
		public function get items():Vector.<IPipelineEffect>
		{
			return _items;
		}

		/**
		 * Processes an input image in all effects in the pipeline.
		 * The result of each pipeline effect is given into the next effect in the chain.
		 * The result of the last effect in the chain is returned.
		 * @param image - The image to process
		 * @return The processed image
		 * @see IBitmapEffect#process()
		 */
		public function process(image:BitmapData):BitmapData
		{
			if (this.buffer == null) {
				this.buffer = image.clone();
			}
			else {
				this.buffer.draw(image);
			}
			
			var current:IPipelineEffect = this.items[0];
			while (current != null) 
			{
				current.effect.process(this.buffer);
				current = current.next;
			}
			return this.buffer; 
		}
		
		public function add(processor:IPixelEffect):Boolean
		{
			return addAt(this.items.length, processor);
		}
		
		public function addAt(index:int, image:IPixelEffect):Boolean
		{
			if (index < 0 || index > this.items.length) return false;
			var link:IPipelineEffect = new PipelineEffect(image);
			if (index < this.items.length && this.items[index] != null) 
			{
				this.items[index].next = link;
			}
			this.items.splice(this.items.length, 0, link);

			createLinkedList();
			return true;
		}		
		
		public function addBefore(target:IPixelEffect, processor:IPixelEffect):Boolean
		{
			return addAt(this.items.indexOf(target), processor);
		}
		
		public function addAfter(target:IPixelEffect, processor:IPixelEffect):Boolean
		{
			var index:int = this.items.indexOf(target);
			if (index == -1) return false;
			return addAt(index + 1, processor);
		}
		
		public function remove(processor:IPixelEffect):Boolean
		{
			return removeAt(indexOf(processor));
		}
		
		public function removeAt(index:int):Boolean
		{
			if (index < 0 || index > this.items.length) return false;
			this.items.splice(index, 1);
			return true;
		}
		
		public function indexOf(effect:IPixelEffect):int
		{
			const t:int = this.items.length;
			var i:int = 0;
			for (; i < t; i++) 
			{
				if (this.items[i].effect == effect) 
				{
					return i;
				}
			}
			return -1;
		}
		
		public function clearBuffer():void 
		{
			if (this.buffer != null) {
				this.buffer.dispose();
				this.buffer = null;
			}
		}
		
		protected function createLinkedList():void
		{
			const t:int = this.items.length;
			var i:int = 0;
			var prev:IPipelineEffect = null;

			for (; i < t; i++) 
			{
				if (prev != null) prev.next = this.items[i];
				prev = this.items[i];
			}
			
			this.items[this.items.length-1].next = null;
		}
	}
}
