package;

import Hero;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var hero = new Hero(200, 400);
		add(hero);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
