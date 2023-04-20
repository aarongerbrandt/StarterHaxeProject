package;

import flixel.FlxSprite;
import flixel.FlxG;

class ControllableHero extends FlxSprite {

    private static var SPRITE_WIDTH(default, null):Int = 128;
    private static var SPRITE_HEIGHT(default, null):Int = 64;

    private static var DISTANCE_PER_FRAME(default, null):Int = 10;

    public function new()
    {
        super();

        makeGraphic(SPRITE_WIDTH, SPRITE_HEIGHT);
    }

    override public function update(elapsed:Float)
    {
        if(FlxG.keys.pressed.UP) {
            this.velocity.y -= DISTANCE_PER_FRAME;
        }
        if(FlxG.keys.pressed.RIGHT) {
            this.velocity.x += DISTANCE_PER_FRAME;
        }
        if(FlxG.keys.pressed.DOWN) {
            this.velocity.y += DISTANCE_PER_FRAME;
        }
        if(FlxG.keys.pressed.LEFT) {
            this.velocity.x -= DISTANCE_PER_FRAME;
        }

        if(!FlxG.keys.anyPressed([RIGHT, UP, LEFT, DOWN])) {
            this.velocity.x = 0;
            this.velocity.y = 0;
        }

        super.update(elapsed);
    }

}