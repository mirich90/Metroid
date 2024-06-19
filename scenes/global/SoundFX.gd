extends Node

var se_sounds_path = "res://assets/sounds/se/"
var musics_sounds_path = "res://assets/sounds/musics/"

var sounds = {
	"Bullet" : load(se_sounds_path + "Bullet.wav"),
	"Click" : load(se_sounds_path + "Click.wav"),
	"EnemyDie" : load(se_sounds_path + "EnemyDie.wav"),
	"Explosion" : load(se_sounds_path + "Explosion.wav"),
	"Hurt" : load(se_sounds_path + "Hurt.wav"),
	"Jump" : load(se_sounds_path + "Jump.wav"),
	"Pause" : load(se_sounds_path + "Pause.wav"),
	"Powerup" : load(se_sounds_path + "Powerup.wav"),
	"Step" : load(se_sounds_path + "Step.wav"),
	"Unpause" : load(se_sounds_path + "Unpause.wav"),
}

onready var sound_players = get_children()

func play(sound_string, pitch_scale = 1, volume_db = 0):
	for soundPlayer in sound_players:
		if not soundPlayer.playing:
			soundPlayer.pitch_scale = pitch_scale
			soundPlayer.volume_db = volume_db
			soundPlayer.stream = sounds[sound_string]
			soundPlayer.play()
			return
	print("Too many sounds playing at once")
