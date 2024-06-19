extends Area2D

# warning-ignore-all:unused_class_variable
export(Resource) var connection = null
export(String, FILE, "*.tscn") var new_map_path = ""
var active = true

func _on_Door_body_entered(Player):
	if Player.get_name() == 'Player' and active == true:
		Player.emit_signal("hit_door", self)
		active = false
