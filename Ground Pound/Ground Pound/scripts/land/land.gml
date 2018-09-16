// Switch location to ground, create dust particle

// Currently landing
if place_meeting(x, y + 1, o_wall) && location == "Air" {
	location = "Ground";
}