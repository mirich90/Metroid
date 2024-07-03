extends KinematicBody2D

const SPEED = 100
var motion = Vector2()
onready var animation = $AnimationPlayer

func _physics_process(delta):
	motion = move_and_slide(motion)

func _process(delta):
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	
	if right:
		animation.play("Run")
		motion.x = SPEED
	elif left:
		animation.play("Run")
		motion.x = -SPEED
	else:
		animation.play("Idle")
		motion.x = 0
	
