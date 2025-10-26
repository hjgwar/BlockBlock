function startBasicMovement() {
	// start moving in a random compass direction
	speed = 1
	directionArr = [0, 90, 180, 270]
	direction = directionArr[irandom(array_length(directionArr) - 1)]
}

function reverseDirection() {
	if alarm[1] < 0
	{
		//Choose opposite direction
		var newDirection = direction - 180
		if newDirection < 0
		{
			newDirection += 360
		}
		direction = newDirection
		// starting empty alarm to ensure this function is not called immediately again
		// which could happen because the collision is really pixel perfect
		alarm[1] = 5
	}
}

function turnToPlayer() {
	// more advanced enemy: turns towards player every couple of seconds
	direction = point_direction(x, y, oPlayer.x, oPlayer.y)
}

function eventuallyTurnToPlayer() {	
	// more advanced enemy: turns towards player every couple of seconds
	if room != Level9
	{
		if alarm[0] < 0
		{
			alarm[0] = 3 * game_get_speed(gamespeed_fps)
		}
	}
}