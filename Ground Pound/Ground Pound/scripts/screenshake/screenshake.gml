/// @desc screenshake(magnitude, frames)
///@param magnitude
///@param frames
var magnitude = argument0;
var frames = argument1;


with o_camera{ // use camera variables
	if magnitude > shake_remain{
		shake_magnitude = magnitude;
		shake_remain = magnitude;
		shake_length = frames;
	}
}