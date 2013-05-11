package ;

import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{
	public function new()
	{
		super();
	}

	override public function init()
	{
#if debug
		HXP.console.enable();
#end

		HXP.scene = new GameScene();
	}

	public static function main() { new Main(); }

}