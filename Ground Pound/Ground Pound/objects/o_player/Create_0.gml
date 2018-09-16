/// @description 
move_speed = 3;
acceleration = .5;
jump_height = -6;
mega_jump_height = -12;
fall_speed = 16;
pound_fall_speed = 20;
xSpeed = 0;
ySpeed = 0;
sleeping = false;
state = "Move";			// Move, Pound, Hitstun
location = "Ground";	// Ground or Air

// Pound state variables
pounding = false;
pound_timer = .1 * room_speed;
alarm[0] = 0;		// pound timer

// Dependencies
input = instance_create_layer(0,0,"Player", o_input);