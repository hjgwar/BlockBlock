function playRandomOooh()
{
	playRandomAsset("oooh{0}")
}

function playRandomOuch()
{
	playRandomAsset("ouch{0}")
}

function playRandomAsset(soundNameFormat)
{
	ooohArr = []
	for (var i = 0; i < 30; i += 1)
	{
		assetIndex = asset_get_index(string(soundNameFormat, i))
		if assetIndex != -1
		{
			array_push(ooohArr, assetIndex)
		}
	}
	audio_play_sound(ooohArr[irandom(array_length(ooohArr) - 1)], 1, false)
}