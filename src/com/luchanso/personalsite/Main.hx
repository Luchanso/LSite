package com.luchanso.personalsite;

import com.luchanso.tools.Copy;
import js.Browser;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.net.URLRequest;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */

class Main extends Sprite 
{
	static inline var iconSize = 64;
	
	static inline var HTTPGithub = "https://github.com/Luchanso/";
	static inline var HTTPGoogle = "https://plus.google.com/+OlegLoutchansky/";
	static inline var HTTPSkype = "skype:Luchnik360?chat";
	static inline var HTTPVK = "https://vk.com/loutchansky";
	static inline var HTTPGmail = "mailto:oleg@loutchansky.com";
	
	static inline var margin = 25;
	static inline var targetWindow = "_blank";
	
	var background : Bitmap;
	var labelLuchanso : TextField;
	
	var skype : Sprite;
	var github : Sprite;
	var google : Sprite;
	var vk : Sprite;
	var gmail : Sprite;
	
	var realWidth = Browser.window.innerWidth;
	var realHeight = Browser.window.innerHeight;
	
	public function new()
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, addToStage);
	}
	
	private function addToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, addToStage);
		
		background = new Bitmap(Assets.getBitmapData("img/bg.jpg"));
		
		var k = realWidth / background.width;
		background.width = realWidth;
		background.height = background.height * k;
		
		var labelLuchansoFormat = new TextFormat("Arial", 100, 0xFFFFFF);
		
		labelLuchanso = new TextField();
		labelLuchanso.defaultTextFormat = labelLuchansoFormat;
		labelLuchanso.text = "Luchanso";
		labelLuchanso.width = labelLuchanso.textWidth;
		labelLuchanso.height = labelLuchanso.textHeight;
		labelLuchanso.x = realWidth / (4 / 3) - labelLuchanso.textWidth / 2;
		labelLuchanso.y = realHeight / 2 - labelLuchanso.textHeight / 2;
		
		var universal = new Sprite();
		universal.buttonMode = true;
		universal.mouseEnabled = true;
		
		github = Copy.clone(universal);
		github.addChild(new Bitmap(Assets.getBitmapData("img/github.png")));
		github.x = realWidth / (4 / 3) - labelLuchanso.textWidth / 2;
		github.y = realHeight / 2 + labelLuchanso.height / 2;
		github.width = iconSize;
		github.height = iconSize;
		github.addEventListener(MouseEvent.CLICK, gihubRef);
		
		google = Copy.clone(universal);
		google.addChild(new Bitmap(Assets.getBitmapData("img/google.png")));
		google.x = github.x + github.width + margin;
		google.y = realHeight / 2 + labelLuchanso.height / 2;
		google.width = iconSize;
		google.height = iconSize;
		google.addEventListener(MouseEvent.CLICK, googleRef);
		
		skype = Copy.clone(universal);
		skype.addChild(new Bitmap(Assets.getBitmapData("img/skype.png")));
		skype.x = google.x + google.width + margin;
		skype.y = realHeight / 2 + labelLuchanso.height / 2;
		skype.width = iconSize;
		skype.height = iconSize;
		skype.addEventListener(MouseEvent.CLICK, skypeRef);
		
		vk = Copy.clone(universal);
		vk.addChild(new Bitmap(Assets.getBitmapData("img/vk.png")));
		vk.x = skype.x + skype.width + margin;
		vk.y = realHeight / 2 + labelLuchanso.height / 2;
		vk.width = iconSize;
		vk.height = iconSize;
		vk.addEventListener(MouseEvent.CLICK, vkRef);
		
		gmail = Copy.clone(universal);
		gmail.addChild(new Bitmap(Assets.getBitmapData("img/gmail.png")));
		gmail.x = vk.x + vk.width + margin;
		gmail.y = realHeight / 2 + labelLuchanso.height / 2;
		gmail.width = iconSize;
		gmail.height = iconSize;
		gmail.addEventListener(MouseEvent.CLICK, gmailHref);
		
		addChild(background);
		addChild(labelLuchanso);
		
		addChild(github);
		addChild(google);
		addChild(skype);
		addChild(vk);
		addChild(gmail);
	}
	
	private function gmailHref(e:MouseEvent):Void 
	{
		Lib.getURL(new URLRequest(HTTPGmail), targetWindow);
		
	}
	
	private function skypeRef(e:MouseEvent):Void 
	{
		Lib.getURL(new URLRequest(HTTPSkype), targetWindow);
	}
	
	private function vkRef(e:MouseEvent):Void 
	{
		Lib.getURL(new URLRequest(HTTPVK), targetWindow);
	}
	
	private function googleRef(e:MouseEvent):Void 
	{
		Lib.getURL(new URLRequest(HTTPGoogle), targetWindow);
	}
	
	private function gihubRef(e:MouseEvent):Void 
	{
		Lib.getURL(new URLRequest(HTTPGithub), targetWindow);
	}
}
