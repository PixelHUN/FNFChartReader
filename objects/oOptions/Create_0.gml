selection = 0;
selectiondisplay = 0;

var _fontsprite = sprite_add("assets/sprite/font.png",43,false,true,0,0);
font = font_add_sprite_ext(_fontsprite, "abcdefghijklmnopqrstuvwxyz,_0123456789-.:@~", true, -20);

optionslist[0] = "Frame Cap";
optionslist[1] = "Vsync";
optionslist[2] = "Downscroll";
optionslist[3] = "Scroll Speed";