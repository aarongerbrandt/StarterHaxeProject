package;

import Hero;
import ScreensaverHero;
import ControllableHero;
import Wall;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var controllableHero = new ControllableHero();
	var screensaverHeroes = new FlxTypedGroup<ScreensaverHero>();
	var walls = new FlxTypedGroup<Wall>();
	var wallCoords:Array<FlxPoint> = [
		FlxPoint.weak(100, 100),
		FlxPoint.weak(100, 300),
		FlxPoint.weak(300, 300),
		FlxPoint.weak(300, 100)
	];

	override public function create()
	{
		super.create();

		for (i in 0...4) {
			screensaverHeroes.add(new ScreensaverHero());
		}	
		add(screensaverHeroes);

		for(point in wallCoords) {
			walls.add(new Wall(point.x, point.y));
		}

		add(walls);

		add(controllableHero);

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
