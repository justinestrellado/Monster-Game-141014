
/*
 * MainMenu
 * Created by Eqela Studio 2.0b7.4
 */

public class MainMenu : SEScene
{
	SESprite background;
	SESprite text;
	
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		AudioClipManager.prepare("coc");
		var w = get_scene_width(), h = get_scene_height();
		
		rsc.prepare_image("background", "cocbackground2",w,h);
		rsc.prepare_font("myfont", "arial bold color=#E5E4E2", 70);
		//rsc.prepare_image("play", "Click to Play", w,h);
		
		background = add_sprite_for_image(SEImage.for_resource("background"));
		text = add_sprite_for_text("Click everywhere to Play", "myfont");
		
		background.move(0,0);
		text.move(get_scene_width()*0.20,get_scene_height()*0.45);
		AudioClipManager.play("coc");
	}
public void on_pointer_press(SEPointerInfo pi)
{
		base.on_pointer_press(pi);
		if(pi.is_inside(0,0,get_scene_width(),get_scene_height())) {
		switch_scene(new MainScene());
		}
}
	public void cleanup() {
		base.cleanup();
		SESprite.remove(background);
		SESprite.remove(text);
	}
}
