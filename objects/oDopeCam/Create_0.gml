isActive = false;

camID = 0; // View Camera ID

zoom = 1; // Zoom Level
target = undefined; // Camera Target
smooth = 0.2; // Smoothing



vw = 1280; // Original View Width
vh = 720; // Original View Height

tx = 0; // Target X
ty = 0; // Target Y

cx = 0; // Camera X
cy = 0; // Camera Y

ox = 0; // Offset X
oy = 0; // Offset Y

// Functions
function activate() // Activate
{
	isActive = true;
	show_debug_message("Activated!");
}
function deactivate() // Deactivate
{
	isActive = false;
	show_debug_message("Deactivated!");
}
function set_target(target_to_set = undefined) // Set Camera Target
{
	target = target_to_set;
	show_debug_message("Set target to: "+ string(target_to_set));
}
function target_position(xpos, ypos) // Set Target Position
{
	tx = xpos;
	ty = ypos;
	show_debug_message("Set target pos to: " + string(xpos) + ", " + string(ypos));
}
function target_offset(xoffset = 0, yoffset = 0) // Set Target Offset
{
	ox = xoffset;
	oy = yoffset;
	show_debug_message("Set target offset to: " + string(xoffset) + ", " + string(yoffset));
}
function set_zoom(targetzoom = 1) // Set Camera Zoom
{
	zoom = targetzoom;
	show_debug_message("Set target zoom to: " + string(targetzoom));
}
function camera_smoothing(smoothlevel = 0.2) // Set Camera Smoothing (Between 0 - 1)
{
	smooth = 1 - (1 * smoothlevel);
	show_debug_message("Set camera smoothing to: " + string(smoothlevel));
}

show_debug_message("Henlo, I'm alive!");