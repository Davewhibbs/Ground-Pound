/// @description 
if place_meeting(x, y-1, player){
	if player.state == "Pound"{
		// make the player sleep for a certain number of frames
		sleep(50, player, player.xSpeed, player.ySpeed);
		
		// destroy self
		instance_destroy();
	}
}

