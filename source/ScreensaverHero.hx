package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;
import flixel.math.FlxVelocity;

class ScreensaverHero extends FlxSprite {
    private static var maxHexColor = 16777216;

    private var running = false;

    var velY = FlxG.random.int(15,25) * FlxG.random.sign();
    var velX = FlxG.random.int(15,25) * FlxG.random.sign();

    public function new()
    {
        super();
        makeGraphic(128, 64);
        screenCenter();
        this.y -= 50;

        this.velocity.x = velY;
        this.velocity.y = velX;

        this.color = FlxG.random.int(0, maxHexColor);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        FlxSpriteUtil.screenWrap(this);
        this.color += Std.int(4*(this.x + this.y)) % maxHexColor;

        if (getDistanceFromMouse(FlxG.mouse) < 100) {
            FlxVelocity.moveTowardsMouse(this, 20, 1000);
        }
    }

    private function getDistanceFromMouse(mouse) {
        var centerX = this.x + 64;
        var centerY = this.y + 32;
        var distance = Math.sqrt(Math.pow(mouse.x - centerX, 2)+Math.pow(mouse.y - centerY, 2));
        return distance;
    }

}