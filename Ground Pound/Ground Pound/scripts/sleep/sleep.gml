///@param duration
///@param target
///@param xSpeed
///@param ySpeed

var duration = argument0;
var time = current_time + duration;

var target = argument1;
var xSpd = argument2;
var ySpd = argument3;

while (current_time < time){
	target.xSpeed = 0;
	target.ySpeed = 0;
}

target.xSpeed = xSpd;
target.ySpeed = ySpd;