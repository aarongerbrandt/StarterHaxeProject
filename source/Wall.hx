package;

import flixel.FlxSprite;

class Wall extends FlxSprite {

    public function new(?x=0, ?y=0) 
    {
        super(x, y);
        this.immovable = true;
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

}