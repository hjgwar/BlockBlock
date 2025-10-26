function killPlayer()
{
	stopEverything()
	if LevelController.alarm[1] < 0
	{
		playRandomOuch()
		// restart the level
		LevelController.alarm[1] = 3 * game_get_speed(gamespeed_fps)
		repeat(100)
		{
			part_particles_burst(LevelController.partSys, oPlayer.x, oPlayer.y, fire)
		}
		instance_destroy(oPlayer)
	}
}

function stopEverything()
{
	// stop potential explodingSolids
	if instance_exists(ExplodingSolidController)
	{
		ExplodingSolidController.alarm[0] = -1
		ExplodingSolidController.alarm[1] = -1
		// sound might already be playing
		audio_stop_sound(warning)
	}
	// stop potential button countdown
	if instance_exists(oButton)
	{
		oButton.alarm[0] = -1
		// sound might already be playing
		audio_stop_sound(clock)
	}	
	// stop all enemies from moving
	if instance_exists(oEnemy)
	{
		oEnemy.alarm[0] = -1
		oEnemy.speed = 0
	}
}