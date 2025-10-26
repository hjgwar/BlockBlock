function flagReached() {
	stopEverything()
	if LevelController.alarm[0] < 0
	{
		// make player look happy
		sprite_index = sPlayerHappy
		// burst particles around player
		part_particles_burst(LevelController.partSys, x, y, warpLines)
		// make player say woopie
		audio_play_sound(woopie, 1, false)
		// advance to the next room
		LevelController.alarm[0] = 2 * game_get_speed(gamespeed_fps)
	}	
}

function flagInoperative() {
	// play nope sound
	audio_play_sound(nope, 1, false)
	// push player back
	oPlayer.x = oKeyFlag.x - 17
	oPlayer.y = oKeyFlag.y
	if room == Level3 or room == Level4
	{
		var iKey = instance_nearest(x, y, oKey)
		// show the key
		iKey.image_alpha = 1
		// burst particles at key
		part_particles_burst(LevelController.partSys, iKey.x, iKey.y, warpLines)
	}
}

function keyFlagReached() {
	// don't have the key yet?
	if oKeyFlag.sprite_index = sFlagLocked
	{
		flagInoperative()	
		return;
	}
	flagReached()
}

function keyReached() {
	if oKey.image_alpha == 1
	{
		// change the goal flag
		oKeyFlag.sprite_index = sFlag
		// burst particles at flag
		var iFlag = instance_nearest(x, y, oKeyFlag)
		part_particles_burst(LevelController.partSys, iFlag.x, iFlag.y, warpLines)
		// play sparkle sound
		audio_play_sound(sparkle, 1, false)
		// remove the key
		instance_destroy(oKey)
	}	
}