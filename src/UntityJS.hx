package ;
import js.Browser;
import js.Lib;

class UntityJS {
	
	function new(){
		this.bindToWindow();
	}
	
	function bindToWindow(){
		js.Lib.alert('bind exec 1');
		trace("wx");
		var win = untyped __js__("window");
		win.untityJS = this;
		
	}
	
	public static function main():Void{
		
			new UntityJS();
			js.Lib.alert('bind exec 2');
		
	}	
}