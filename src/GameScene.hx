package ;

import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Joystick;
import nme.geom.Point;

class XBOX_GAMEPAD
{
	public static var A_BUTTON:Int = 0;
	public static var B_BUTTON:Int = 1;
	public static var X_BUTTON:Int = 2;
	public static var Y_BUTTON:Int = 3;
	public static var LB_BUTTON:Int = 4;
	public static var RB_BUTTON:Int = 5;
	public static var BACK_BUTTON:Int = 6;
	public static var START_BUTTON:Int = 7;
	public static var LEFT_ANALOGUE_BUTTON:Int = 8;
	public static var RIGHT_ANALOGUE_BUTTON:Int = 9;
	public static var LEFT_ANALOGUE_X:Int = 1;
	public static var LEFT_ANALOGUE_Y:Int = 2;
	public static var RIGHT_ANALOGUE_X:Int = 5;
	public static var RIGHT_ANALOGUE_Y:Int = 4;

	/**
	* Keep in mind that if TRIGGER axis returns value > 0 then LT is being pressed, and if it's < 0 then RT is being pressed
	*/
	public static var TRIGGER:Int = 3;
}

class GameScene extends Scene
{
	private var gamepad:Joystick;
	
	private var leftStick:Image;
	private var rightStick:Image;
	private var dPad:Spritemap;
	
	private var xButton:Image;
	private var yButton:Image;
	private var aButton:Image;
	private var bButton:Image;
	
	private var back:Image;
	private var start:Image;
	
	private var LB:Image;
	private var RB:Image;
	
	private var offAlpha:Float = 0.5;
	private var onAlpha:Float = 1.0;
	
	private static var LB_Y:Float = 2;
	private static var RB_Y:Float = 2;
	
	private static var LEFT_STICK_POS:Point = new Point(80, 48);
	private static var RIGHT_STICK_POS:Point = new Point(304, 136);
	private static var STICK_MOVEMENT_RANGE:Float = 10;
	
	public function new() 
	{
		super();
	}
	
	override public function begin():Void 
	{
		gamepad = Input.joystick(0);
		
		// LB
		LB = new Image("gfx/LB.png");
		LB.alpha = 0.8;
		addGraphic(LB, HXP.BASELAYER, 71, LB_Y);
		
		// RB
		RB = new Image("gfx/RB.png");
		RB.alpha = 0.8;
		addGraphic(RB, HXP.BASELAYER, 367, RB_Y);
		
		// Gamepad Background
		addGraphic(new Image("gfx/xbox360_gamepad.png"), HXP.BASELAYER);
		
		// Left stick
		leftStick = new Image("gfx/Stick.png");
		leftStick.alpha = offAlpha;
		addGraphic(leftStick, HXP.BASELAYER);
		
		// Right stick
		rightStick = new Image("gfx/Stick.png");
		rightStick.alpha = offAlpha;
		addGraphic(rightStick, HXP.BASELAYER, 0, 0);
		
		dPad = new Spritemap("gfx/DPad.png", 87, 87);
		dPad.add("Idle", [0]);
		dPad.add("Up", [1]);
		dPad.add("Right", [2]);
		dPad.add("Down", [3]);
		dPad.add("Left", [4]);
		dPad.add("UpRight", [5]);
		dPad.add("DownRight", [6]);
		dPad.add("DownLeft", [7]);
		dPad.add("UpLeft", [8]);
		dPad.play("Idle");
		dPad.alpha = offAlpha;
		addGraphic(dPad, HXP.BASELAYER, 144, 126);
		
		xButton = new Image("gfx/X.png");
		xButton.alpha = offAlpha;
		addGraphic(xButton, HXP.BASELAYER, 357, 70);
		
		yButton = new Image("gfx/Y.png");
		yButton.alpha = offAlpha;
		addGraphic(yButton, HXP.BASELAYER, 395, 34);
		
		aButton = new Image("gfx/A.png");
		aButton.alpha = offAlpha;
		addGraphic(aButton, HXP.BASELAYER, 395, 109);
		
		bButton = new Image("gfx/B.png");
		bButton.alpha = offAlpha;
		addGraphic(bButton, HXP.BASELAYER, 433, 70);
		
		back = new Image("gfx/Back.png");
		back.alpha = offAlpha;
		addGraphic(back, HXP.BASELAYER, 199, 79);
		
		start = new Image("gfx/Start.png");
		start.alpha = offAlpha;
		addGraphic(start, HXP.BASELAYER, 306, 79);
	}
	
	override public function update():Dynamic 
	{	
		if (Input.joystick(0).check(XBOX_GAMEPAD.A_BUTTON))					trace("A");
		if (Input.joystick(0).check(XBOX_GAMEPAD.B_BUTTON))					trace("B");
		if (Input.joystick(0).check(XBOX_GAMEPAD.X_BUTTON))					trace("X");
		if (Input.joystick(0).check(XBOX_GAMEPAD.Y_BUTTON))					trace("Y");
		if (Input.joystick(0).check(XBOX_GAMEPAD.LB_BUTTON))				trace("LB");
		if (Input.joystick(0).check(XBOX_GAMEPAD.RB_BUTTON))				trace("RB");
		if (Input.joystick(0).check(XBOX_GAMEPAD.BACK_BUTTON))				trace("BACK");
		if (Input.joystick(0).check(XBOX_GAMEPAD.START_BUTTON))				trace("START");
		if (Input.joystick(0).check(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON))		trace("LEFT_ANALOGUE_BUTTON");
		if (Input.joystick(0).check(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON))	trace("RIGHT_ANALOGUE_BUTTON");
		
		if (Input.joystick(0).getAxis(XBOX_GAMEPAD.TRIGGER) != 0) 			trace("Trigger " + Input.joystick(0).getAxis(XBOX_GAMEPAD.TRIGGER));
		
		if (Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) != 0) 	trace("LEFT_ANALOGUE_X " + Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X));
		if (Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) != 0) 	trace("LEFT_ANALOGUE_Y " + Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y));
		if (Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) != 0) 	trace("RIGHT_ANALOGUE_X " + Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X));
		if (Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) != 0) 	trace("RIGHT_ANALOGUE_Y " + Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y));
		
		if (Input.joystick(0).hat.x != 0) trace("Hat x " + Input.joystick(0).hat.x);
		if (Input.joystick(0).hat.y != 0) trace("Hat y " + Input.joystick(0).hat.y);
		
		
		if (gamepad.check(XBOX_GAMEPAD.A_BUTTON))
		{
			aButton.alpha = onAlpha;
		}
		else
		{
			aButton.alpha = offAlpha;
		}
		
		if (gamepad.check(XBOX_GAMEPAD.B_BUTTON))
		{
			bButton.alpha = onAlpha;
		}
		else
		{
			bButton.alpha = offAlpha;
		}
		
		if (gamepad.check(XBOX_GAMEPAD.X_BUTTON))
		{
			xButton.alpha = onAlpha;
		}
		else
		{
			xButton.alpha = offAlpha;
		}
		
		if (gamepad.check(XBOX_GAMEPAD.Y_BUTTON))
		{
			yButton.alpha = onAlpha;
		}
		else
		{
			yButton.alpha = offAlpha;
		}
		
		if (gamepad.check(XBOX_GAMEPAD.LB_BUTTON))
		{
			LB.y = LB_Y + 5;
		}
		else
		{
			LB.y = LB_Y;
		}
		
		if (gamepad.check(XBOX_GAMEPAD.RB_BUTTON))
		{
			RB.y = RB_Y + 5;
		}
		else
		{
			RB.y = RB_Y;
		}
		
		if (gamepad.check(XBOX_GAMEPAD.START_BUTTON))
		{
			start.alpha = onAlpha;
		}
		else
		{
			start.alpha = offAlpha;
		}
		
		if (gamepad.check(XBOX_GAMEPAD.BACK_BUTTON))
		{
			back.alpha = onAlpha;
		}
		else
		{
			back.alpha = offAlpha;
		}
		
		var angle:Float = 0;
		
		if (Math.abs(gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X)) > Joystick.deadZone || Math.abs(gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y)) > Joystick.deadZone)
		{
			angle = Math.atan2(gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y), gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X));
			leftStick.x = LEFT_STICK_POS.x + STICK_MOVEMENT_RANGE * Math.cos(angle);
			leftStick.y = LEFT_STICK_POS.y + STICK_MOVEMENT_RANGE * Math.sin(angle);
			leftStick.alpha = onAlpha;
		}
		else
		{
			leftStick.x = LEFT_STICK_POS.x;
			leftStick.y = LEFT_STICK_POS.y;
			leftStick.alpha = offAlpha;
		}
		
		if (Math.abs(gamepad.getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X)) > Joystick.deadZone || Math.abs(gamepad.getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y)) > Joystick.deadZone)
		{
			angle = Math.atan2(gamepad.getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y), gamepad.getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X));
			rightStick.x = RIGHT_STICK_POS.x + STICK_MOVEMENT_RANGE * Math.cos(angle);
			rightStick.y = RIGHT_STICK_POS.y + STICK_MOVEMENT_RANGE * Math.sin(angle);
			rightStick.alpha = onAlpha;
		}
		else
		{
			rightStick.x = RIGHT_STICK_POS.x;
			rightStick.y = RIGHT_STICK_POS.y;
			rightStick.alpha = offAlpha;
		}
		
		if (gamepad.hat.x != 0 || gamepad.hat.y != 0)
		{
			if (gamepad.hat.x > 0)
			{
				if (gamepad.hat.y > 0)
				{
					dPad.play("DownRight");
				}
				else if (gamepad.hat.y < 0)
				{
					dPad.play("UpRight");
				}
				else	// gamepad.hat.y == 0
				{
					dPad.play("Right");
				}
			}
			else if (gamepad.hat.x < 0)
			{
				if (gamepad.hat.y > 0)
				{
					dPad.play("DownLeft");
				}
				else if (gamepad.hat.y < 0)
				{
					dPad.play("UpLeft");
				}
				else	// gamepad.hat.y == 0
				{
					dPad.play("Left");
				}
			}
			else	// gamepad.hat.x == 0
			{
				if (gamepad.hat.y > 0)
				{
					dPad.play("Down");
				}
				else if (gamepad.hat.y < 0)
				{
					dPad.play("Up");
				}
			}
			dPad.alpha = onAlpha;
		}
		else
		{
			dPad.play("Idle");
			dPad.alpha = offAlpha;
		}
		
		super.update();
	}
}