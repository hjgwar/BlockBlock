function initiateRandomExplosions()
{
	if (alarm[0] < 0 and alarm[1] < 0)
	{
		waitingTime = irandom_range(4, 6) * game_get_speed(gamespeed_fps)
		if room == Level8
		{
			waitingTime = irandom_range(1, 2) * game_get_speed(gamespeed_fps)
		}
		alarm[0] = waitingTime
	}	
}

function explodeSolid(iExplodingSolid)
{
	audio_stop_sound(warning)
	// smoke particles + 'boom!'
	audio_play_sound(boom, 1, false)
	part_particles_burst(LevelController.partSys, iExplodingSolid.x, iExplodingSolid.y, smoke)
	// kill the player if it's nearby
	if collision_circle(iExplodingSolid.x, iExplodingSolid.y, 20, oPlayer, false, false) != noone
	{
		killPlayer()
	}
	// kill an enemy if it's nearby
	var iEnemy = collision_circle(iExplodingSolid.x, iExplodingSolid.y, 20, oEnemy, false, true)
	if iEnemy != noone
	{
		instance_destroy(iEnemy)
	}
	// destroy the solid itself
	instance_destroy(iExplodingSolid)
}

function countdownToExplosion(iExplodingSolid)
{
	// start the short warning
	iExplodingSolid.sprite_index = sExplodingSolid
	audio_play_sound(warning, 1, true)
	if ExplodingSolidController.alarm[1] < 0
	{
		ExplodingSolidController.alarm[1] = 1.8 * game_get_speed(gamespeed_fps)
	}
}

function findExplodingSolidToStartCountdown()
{
	// get list of instances of oExplodingSolid objects
	var iExplodingSolids = []
	for (var i = 0; i < instance_number(oExplodingSolid); ++i;)
	{
	    iExplodingSolids[i] = instance_find(oExplodingSolid, i);
	}
	if (array_length(iExplodingSolids) > 0)
	{
		// pick one at random
		iExplodingSolid = iExplodingSolids[irandom(array_length(iExplodingSolids) - 1)]
		countdownToExplosion(iExplodingSolid)
	}
}