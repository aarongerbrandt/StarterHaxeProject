package;

import flixel.FlxSprite;

class Wall extends FlxSprite {

    public function new(?x:Float = 0, ?y:Float = 0) 
    {
        super(x, y);
        this.immovable = true;
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

}