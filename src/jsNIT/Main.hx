//package jsNIT;
//import js.Browser;
//import js.JQuery;
//
//enum JSState {
//	on;
//	off;
//	disable;
//}
//
//class JSManager{
//	public var internalState : JSState;
//	
//	public function new(){
//		new JQuery(Browser.document).ready(function(e){
//        	this.printDiv();
//        });
//	}
//	
//	public function jsDispatch():Void{
//		
//	}
//	
//	public  static function main():Void{
//		
//     	new JSManager();
//	}
//	
//	private function printDiv(){
//		var str = haxe.Resource.getString("my_sample");
//        var t = new haxe.Template(str);
//        var output = t.execute({ name : "John", age : 33 });
//		new JQuery("#content").html(output);
//        trace(new JQuery("#content"));
//	}
//}
//
//class JSConcreteManager extends JSManager{
//	public function new(){
//		super();
//		this.internalState = on;
//	}
//	override public function jsDispatch():Void{
//		super.jsDispatch();
//	}
//	
//}

package jsNIT;

import createjs.tweenjs.Ease;
import createjs.easeljs.Ticker;
import createjs.tweenjs.Tween;
import createjs.easeljs.Stage;
import createjs.easeljs.Shape;
import js.Browser;
import js.JQuery;


class Main
{
    private static var _shape:Shape;
    private static var _stage:Stage;

    public static function main():Void
    {
    	new JQuery(Browser.document).ready(function(e){
    		//Ticker provides a centralized tick or heartbeat broadcast at a set interval.
        //Here we tells it to use browser "requestAnimationFrame" instead of "setTimeout" to process ticks
        Ticker.RAF = "raf";
        //Maximum FPS
        Ticker.setFPS(60);

        //Creating of stage. We need to create stage manually. Constructor receives canvas element declared in index.html.
        _stage = new Stage(cast js.Browser.document.getElementById("c"));
        _stage.onMouseUp = stageClickHandler;
		_stage.addEventListener('stagemouseup',stageClickHandler);
        //Shape object, looks familiar:-)
        _shape = new Shape();
        _shape.graphics.beginFill("#FF0000");
        _shape.graphics.drawCircle(20, 20, 20);
        _shape.graphics.endFill();
        _stage.addChild(_shape);

        //Alternative to Event.ENTER_FRAME. Method tickHandler called 60 times per second
        Ticker.addEventListener("tick",tickHandler);
    	});
        
    }

    //In CreateJS we have to update stage every time any display object changed.
    //So it's not necessary to update it on each frame but in this example choose the simple way.
    private static function tickHandler():Void
    {
        _stage.update();
    }

    //Stage was clicked
    private static function stageClickHandler():Void
    {
        //Using tween-engine from CreateJS
        Tween.removeTweens(_shape);
        Tween.get(_shape).to({x:_stage.mouseX - 20, y:_stage.mouseY - 20}, 1000, Ease.quadOut);
    }
}
