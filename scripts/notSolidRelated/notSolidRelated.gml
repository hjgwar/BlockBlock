function decreaseAlpha() {
	image_alpha = clamp(image_alpha - 0.03, 0, 1)
}

function increaseAlpha() {
	image_alpha = clamp(image_alpha + 0.03, 0, 1)
}

function makePlayerWaitForZeroAlpha() {
	if image_alpha > 0
	{
		if y - oPlayer.y < 1 or y - oPlayer.y > -1
		{
			// player needs to move on x axis to continue, but should wait
			oPlayer.dx = 0
		}
		if x - oPlayer.x < 1 or x - oPlayer.x > -1
		{
			// player needs to move on y axis to continue, but should wait
			oPlayer.dy = 0
		}
		if !alphaFlag
		{
			playRandomOooh()
			alphaFlag = true
		}
	}
}

function makeEnemyWaitForZeroAlpha() {
	var iEnemy = instance_place(x, y, oEnemy) 
	if image_alpha > 0
	{
		iEnemy.speed = 0
		return;
	}
	if !instance_exists(oButton) and LevelController.alarm[0] < 0 and LevelController.alarm[1] < 0
	{
		iEnemy.speed = 1
		return;
	}
	if instance_exists(oButton) and oButton.alarm[0] < 0 and LevelController.alarm[0] < 0 and LevelController.alarm[1] < 0
	{
		iEnemy.speed = 1
		return;
	}	
}