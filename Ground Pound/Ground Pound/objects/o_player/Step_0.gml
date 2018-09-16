/// @description State Machine
switch (state){
	
	case "Move":
		#region Move State
		
			// Move left or right or idle
			if input.right{
				// RUN SPRITE
				image_xscale = 1;
				xSpeed = lerp(xSpeed, move_speed, acceleration);
			}
			else if input.left{
				// RUN SPRITE
				image_xscale = -1;
				xSpeed = lerp(xSpeed, -move_speed, acceleration);
			}
			else if not input.right and not input.left{
				// IDLE SPRITE
				
				xSpeed = lerp(xSpeed, 0, acceleration);
			}
			
			// Check if we're on the ground or in the air
			if place_meeting(x, y+1, o_wall){
				location = "Ground";
				
				// Jump!
				if input.jump{
					bounce(jump_height);
				}
			} else {
				location = "Air";
				
				// Constantly pull downward by gravity
				ySpeed = approach(ySpeed, fall_speed, grav);
				
				// Change sprite based on direction if in Air
			}
			
			// If on a trampoline, bounce
			if place_meeting(x, y+1, o_trampoline){
				bounce(jump_height);
			}
			
			// SWITCH STATES
			
			// Pound Switch
			if input.pound{
				state = "Pound";
				
				// No Horizontal movement
				xSpeed = 0;
				alarm[0] = pound_timer; 
				
				// Start with a little hop
				bounce(jump_height);
			}
			
			// Hurt Switch
			if place_meeting(x, y, o_enemy){
				
			}
			
		break;
		#endregion
		
	case "Pound":
		#region Pound State
			// Do nothing until we're pounding
			if pounding == true{
				ySpeed = pound_fall_speed;
			}
			
			
			// SWITCH STATES -- reset pounding
			// If you run into a wall or an enemy switch back to normal
			if place_meeting(x, y+1, o_wall){
				screenshake(6, 10);
				
				// continue pounding if the floor is breakable
				if !place_meeting(x, y+1, o_wall_breakable){
					// If on a trampoline, bounce
					if place_meeting(x, y+1, o_trampoline){
						bounce(mega_jump_height);
					}
					pounding = false;
					state = "Move";
				}
			}
				
			
		break;
		#endregion
		
	case "Hitstun":
		#region Hitstun State
	
	
			// SWITCH STATES
			
		break;
		#endregion
	
	default:
		state = "Move";
		break;
}

// if sleeping, no movement
if sleeping{
	xSpeed = 0;
	ySpeed = 0;
}

// Move the object
move_and_collide();

// Land
land();


show_debug_message(location);
