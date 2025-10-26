if place_meeting(x, y, oPlayer)
{
	decreaseAlpha()
	makePlayerWaitForZeroAlpha()
}

if place_meeting(x, y, oEnemy)
{
	decreaseAlpha()
	makeEnemyWaitForZeroAlpha()
}

if !place_meeting(x, y, oPlayer) and !place_meeting(x, y, oEnemy)
{
	increaseAlpha()
	alphaFlag = false
}