// make sure these sounds in subfolders are loaded
gml_pragma("MarkTagAsUsed", "oooh", "ouch");
window_set_size(1280, 720)
partSys = part_system_create()
audio_play_sound(grunt, 1, false)