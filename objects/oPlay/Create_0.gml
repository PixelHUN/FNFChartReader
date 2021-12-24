global.menusong = 0;

songname = "bopeebo";
difficulty = "";

songspeed = 0;

_paused = false;

downscroll = true;
gas = false;

depth = -999;

vsync = false;
lastvsync = vsync;
fpscap = 60;
lowframerate = false;

version = "0.1 (DEV)";

display_reset(0, vsync);

gpu_set_tex_filter(true);

rousr_dissonance_create("913142040097869845");
rousr_dissonance_set_state("In Menus...");