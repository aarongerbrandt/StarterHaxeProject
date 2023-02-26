package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;
import flixel.math.FlxVelocity;

class ScreensaverHero extends FlxSprite {
    private static var SPRITE_WIDTH(default, null):Int = 128;
    private static var SPRITE_HEIGHT(default, null):Int = 64;

    private static var MOUSE_FLEE_DISTANCE(default, null):Int = 100;
    private static var MOUSE_FLEE_SPEED(default, null):Int = 20;
    private static var MOUSE_FLEE_TIMEOUT_MS(default, null):Int = 1000;

    private static var MIN_HEX_COLOR(default, null) = 0;
    private static var MAX_HEX_COLOR(default, null) = 16777216;

    var velY = FlxG.random.int(15,25) * FlxG.random.sign();
    var velX = FlxG.random.int(15,25) * FlxG.random.sign();

    public function new(x=0,y=0)
    {
        super();
        makeGraphic(SPRITE_WIDTH, SPRITE_HEIGHT);
        this.x = x;
        this.y = y;

        this.velocity.x = velY;
        this.velocity.y = velX;

        this.color = FlxG.random.int(MIN_HEX_COLOR, MAX_HEX_COLOR);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        FlxSpriteUtil.screenWrap(this);

        // Sign will make it randomly increase OR decrease by that amount
        var newColor = (this.color + Std.int(4*(this.x + this.y))) * FlxG.random.sign();    
        // Should prevent from reaching a crazy number I think?
        this.color = newColor % MAX_HEX_COLOR;          

        if (getDistanceFromMouse(FlxG.mouse) < MOUSE_FLEE_DISTANCE) {
            FlxVelocity.moveTowardsMouse(this, MOUSE_FLEE_SPEED, MOUSE_FLEE_TIMEOUT_MS);
        }
    }

    private function getDistanceFromMouse(mouse) {
        var centerX = this.x + (SPRITE_WIDTH / 2);
        var centerY = this.y + (SPRITE_HEIGHT / 2);
        var distance = Math.sqrt(Math.pow(mouse.x - centerX, 2)+Math.pow(mouse.y - centerY, 2));
        return distance;
    }

}