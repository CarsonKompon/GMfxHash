/// @description Init variables and object(s)



// Initialize GMfxHash functions (REQUIRED)
fxhash_init();



// Since our room is only 256x256, scale up the window based on platform
var _windowScale = 8;
if(os_browser == browser_not_a_browser){
	_windowScale = 3; // Scale less on PC so the window isn't massive
}
window_set_size(room_width * _windowScale, room_height * _windowScale);



// Print the fxhash and a few random numbers to the console just for fun
show_debug_message("fxhash: " + fxhash);
show_debug_message("Random 0-1: " + string(fxrand()));
show_debug_message("Random int 1-100: " + string(fxrandi_range(1, 100)));



// Spawn a random shape (There are more fxrand calls in parShape)
shape = fxchoose([objSquare, objCircle, objTriangle]);
instance_create_depth(room_width/2, room_height/2, 0, shape);