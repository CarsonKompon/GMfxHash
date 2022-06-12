/*
	GMfxHash v1.0.0 by Carson Kompon (06/11/2022)
	
	
	Functions that are prefixed with `GMfxHash_` are direct calls to the functions
	from the fx(hash) snippet. However, These functions ONLY work when in HTML5.
	So you should instead use the non-prefixed functions, as they emulate the fx(hash)
	snippet when running on platforms other than HTML5.
	
	
	
	DOCUMENTATION:
	
	`fxhash_init()`			You must include this as the first line of your Controller object or the first
							line of your init room's creation code (if you have one)
	
	`fxhash`				A string equal to the unique 51 character hash of the token.
	
	`fxrand(x=1)`			A function that generates a number between 0 and X based on the fxhash.
	
	`fxrandi(x=1)`			A function that generates an integer between 0 and X (inclusive) based on the
							fxhash.
	
	`fxrand_range(x, y)`	A function that generates a number between X and Y based on the fxhash.
	
	`fxrandi_range(x, y)`	A function that generates an integer between X and Y (inclusive) based on
							the fxhash.
							
	`fxchoose(array)`		A function that returns a random value from an array based on the fxhash.
	
	`fxpreview()`			A function you can call whenever the code is ready to be captured.
	
	`isFxpreview`			A boolean, true when the code is executed to take the capture, false otherwise.
*/


//////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////// DO NOT EDIT PAST THIS LINE ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////


/// The unique 51 character hash of the token.
#macro fxhash global.__GMfxHash_hash

/// A boolean, true when the code is executed to take the capture, false otherwise.
#macro isFxpreview __GMfxHash_isFxpreview()

/// Initializes variables required for fx(hash) usage
function fxhash_init(){
	randomize();
	if(os_browser == browser_not_a_browser){
		global.__GMfxHash_hash = GMfxHash_generate_fake_hash();
	}else{
		global.__GMfxHash_hash = GMfxHash_fxhash();
	}
	var _seed = 0;
	for(var i=0; i<string_length(global.__GMfxHash_hash); i++){
		var _char = string_char_at(global.__GMfxHash_hash, i+1);
		_seed = (_seed * 58) + ord(_char);
	}
	random_set_seed(_seed%2147483647);
}

/// A PRNG function that generates a number between 0 and x based on the fxhash
/// @param {real} _max=1 The number to generate up to
/// @returns {real}
function fxrand(_max = 1){
	if(os_browser == browser_not_a_browser){
		return random(_max);
	}else{
		return GMfxHash_fxrand()*_max;	
	}
}

/// A PRNG function that generates an integer between 0 and x (inclusive) based on the fxhash
/// @param {real} _max=1 The number to generate up to
/// @returns {real}
function fxrandi(_max = 1){
	return fxrandi_range(0,_max);
}

/// A PRNG function that generates a number between two numbers based on the fxhash
/// @returns {real}
function fxrand_range(_num1, _num2){
	var _low = min(_num1, _num2);
	var _high = max(_num1, _num2);
	return (fxrand()*(_high-_low))+_low;
}

/// A PRNG function that generates an integer between two numbers based on the fxhash
/// @returns {real}
function fxrandi_range(_num1, _num2){
	var _low = min(_num1,_num2);
	var _high = max(_num1,_num2);
	return floor(fxrand()*((_high+1)-_low))+_low;
}

/// A PRNG function that returns a random value from an array based on the fxhash
/// @returns {any}
function fxchoose(_array){
	return _array[fxrandi_range(0,array_length(_array)-1)];
}

/// A function you can call whenever the code is ready to be captured
function fxpreview(){
	if(os_browser == browser_not_a_browser){
		show_debug_message("fxhash: TRIGGER PREVIEW");
	}else{
		GMfxHash_fxpreview();	
	}
}

/// Generates a fake hash (should only be used for testing)
/// @returns {string}
function GMfxHash_generate_fake_hash(){
	var _alphabet = "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ";
	var _hash = "oo";
	for(var i=0; i<49; i++){
		_hash += string_char_at(_alphabet, irandom_range(1,string_length(_alphabet))) 	
	}
	return _hash;
}

/// @ignore
function __GMfxHash_isFxpreview(){
	if(os_browser == browser_not_a_browser){
		return false;
	}else{
		return GMfxHash_isFxpreview();	
	}
}