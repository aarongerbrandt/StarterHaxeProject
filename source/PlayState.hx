package;

import Hero;
import ScreensaverHero;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		add(new ScreensaverHero());
		add(new ScreensaverHero());
		add(new ScreensaverHero());
		add(new ScreensaverHero());

		var helloWorld = new FlxText();
		helloWorld.text = "Hello World!";
		helloWorld.alignment = FlxTextAlign.RIGHT;
		helloWorld.borderColor = FlxColor.LIME;
		helloWorld.italic = true;
		helloWorld.size = 80;
		helloWorld.screenCenter();
		add(helloWorld);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
