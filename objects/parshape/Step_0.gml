var _sizeTo = sizeTo;

if(point_distance(x,y,mouse_x,mouse_y) <= size){
	if(mouse_check_button(mb_left)){
		_sizeTo = sizeTo/2;
	}else if(!hovering){
		size *= 1.05;
		hovering = true;
	}
}else if(hovering){
	size *= 0.95;
	hovering = false;
}

var _displacement = _sizeTo - size;
sizeSpeed += (0.1 * _displacement) - (0.25 * sizeSpeed);
size += sizeSpeed;