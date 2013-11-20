(function () { "use strict";
var js = {}
js.Browser = function() { }
var jsNIT = {}
jsNIT.Main = function() { }
jsNIT.Main.main = function() {
	new js.JQuery(js.Browser.document).ready(function(e) {
		createjs.Ticker.RAF = "raf";
		createjs.Ticker.setFPS(60);
		jsNIT.Main._stage = new createjs.Stage(js.Browser.document.getElementById("c"));
		jsNIT.Main._stage.onMouseUp = jsNIT.Main.stageClickHandler;
		jsNIT.Main._stage.addEventListener("stagemouseup",jsNIT.Main.stageClickHandler);
		jsNIT.Main._shape = new createjs.Shape();
		jsNIT.Main._shape.graphics.beginFill("#FF0000");
		jsNIT.Main._shape.graphics.drawCircle(20,20,20);
		jsNIT.Main._shape.graphics.endFill();
		jsNIT.Main._stage.addChild(jsNIT.Main._shape);
		createjs.Ticker.addEventListener("tick",jsNIT.Main.tickHandler);
	});
}
jsNIT.Main.tickHandler = function() {
	jsNIT.Main._stage.update();
}
jsNIT.Main.stageClickHandler = function() {
	createjs.Tween.removeTweens(jsNIT.Main._shape);
	createjs.Tween.get(jsNIT.Main._shape).to({ x : jsNIT.Main._stage.mouseX - 20, y : jsNIT.Main._stage.mouseY - 20},1000,createjs.Ease.quadOut);
}
var q = window.jQuery;
js.JQuery = q;
js.Browser.document = typeof window != "undefined" ? window.document : null;
jsNIT.Main.main();
})();
