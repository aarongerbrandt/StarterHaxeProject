package;

import Hero;
import ScreensaverHero;
import ControllableHero;
import Wall;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
	var controllableHero = new ControllableHero();
	var screensaverHeroes = new FlxTypedGroup<ScreensaverHero>();
	var walls = new FlxTypedGroup<Wall>();

	override public function create()
	{
		super.create();

		screensaverHeroes.add(new ScreensaverHero());
		screensaverHeroes.add(new ScreensaverHero());
		screensaverHeroes.add(new ScreensaverHero());
		screensaverHeroes.add(new ScreensaverHero());	

		add(screensaverHeroes);

		add(controllableHero);

		walls.add(new Wall(100, 100));
		walls.add(new Wall(100, 300));
		walls.add(new Wall(300, 300));
		walls.add(new Wall(300, 100));

		add(walls);

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

		FlxG.collide(controllableHero, walls);

		FlxG.overlap(controllableHero, screensaverHeroes, traceCallback);
	}

	private function traceCallback(objA:FlxSprite, objB:FlxSprite)
	{
		return trace(objA.toString() + " & " + objB.toString());
	}
}
