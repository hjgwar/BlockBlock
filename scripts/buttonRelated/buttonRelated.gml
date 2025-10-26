function turnButtonOffToStartEnemies() {
	sprite_index = sButtonOn
	audio_stop_sound(clock)
	audio_play_sound(click, 1, false)
	oEnemy.speed = 1
	oEnemy.alarm[0] = 0
}

function turnButtonOnToStopEnemies() {
	if alarm[0] < 0
	{
		sprite_index = sButtonOff
		oEnemy.speed = 0
		audio_play_sound(click, 1, false)
		audio_play_sound(clock, 1, true)
		alarm[0] = 4 * game_get_speed(gamespeed_fps)
	}
}