package;

import flixel.FlxSprite;
import flixel.FlxG;

class ControllableHero extends FlxSprite {

    public function new()
    {
        super();

        makeGraphic(128, 64);
    }

    override public function update(elapsed:Float)
    {
        if(FlxG.keys.pressed.UP) {
            this.velocity.y -= 10;
        }
        if(FlxG.keys.pressed.RIGHT) {
            this.velocity.x += 10;
        }
        if(FlxG.keys.pressed.DOWN) {
            this.velocity.y += 10;
        }
        if(FlxG.keys.pressed.LEFT) {
            this.velocity.x -= 10;
        }

        if(!FlxG.keys.anyPressed([RIGHT, UP, LEFT, DOWN])) {
            this.velocity.x = 0;
            this.velocity.y = 0;
        }

        super.update(elapsed);
    }

}