/// @description Init variables and object(s)



// Initialize GMfxHash functions (REQUIRED)
fxhash_init();



// Since our room is only 256x256, scale up the window based on platform
var _windowScale = 8;
if(os_browser == browser_not_a_browser){
	_windowScale = 3; // Scale less on PC so the window isn't massive
}
window_set_size(room_width * _windowScale, room_height * _windowScale);

// Print the fxhash to the console just so we can see it
show_debug_message("fxhash: " + fxhash);

// Get the fx(hash) features. If testing on windows, the optional argument is passed as the default value.
// This is by default an empty struct, but can be of any type, you just need to handle it accordingly.
var _features = fxfeatures({
	"Shape": fxchoose(["Square", "Circle", "Triangle"]),
	"Shape Size": fxrandi_range(8, 64),
	"Shape Color": fxchoose(["Red", "Green", "Blue"])
})
// Print the features to the console for fun
show_debug_message(_features);

// Now we can create our object with the supplied features.
var _shape, _shapeSize, _shapeColor;

// If a feature has no spaces in it's name, you can directly call it using dot notation
if(_features.Shape == "Square") _shape = objSquare;
else if(_features.Shape == "Circle") _shape = objCircle;
else if(_features.Shape == "Triangle") _shape = objTriangle;

// If a feature has spaces in it's name, you can use variable_struct_get
_shapeSize = variable_struct_get(_features, "Shape Size");
_shapeColor = variable_struct_get(_features, "Shape Color");

// Create the instance of the shape
var _inst = instance_create_depth(room_width/2, room_height/2, 0, _shape);
_inst.SetSize(_shapeSize);
_inst.SetColor(_shapeColor);