hovering = false;
size = 0;
sizeSpeed = 0;

sizeTo = 0;
color = c_white;

function SetSize(_size){
	sizeTo = _size;	
}

function SetColor(_col){
	switch(_col){
		case "Red": color = c_red; break;
		case "Green": color = c_green; break;
		case "Blue": color = c_blue; break;
		default: color = c_white; break;
	}
}