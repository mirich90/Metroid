extends KinematicBody2D

const ExplosionEffect = preload("res://scenes/effects/ExplosionEffect.tscn")

var velocity = Vector2.ZERO
export var speed: int = 40
export var gravity: int = 320
export var is_physics: bool = true

func _physics_process(delta):
	move_and_collide(velocity * delta * speed / 100)
#	position += velocity * delta * speed / 100
	if is_physics:
		velocity.y += gravity * delta

#func _physics_process(delta):
#	if is_physics:
#		velocity.y += gravity * delta

func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	queue_free()


func _on_Hitbox_body_entered(body):
	Utils.instance_scene_on_main(ExplosionEffect, global_position)
#	var collision = move_and_collide(velocity * delta * speed / 100)
#	if not collision: return

#	var direction = (global_position - body.global_position).normalized()
#	velocity = velocity.bounce(direction) * 0.6
	queue_free()

func _on_Hitbox_area_entered(area):
	Utils.instance_scene_on_main(ExplosionEffect, global_position)
#	var direction = (global_position - area.get_cell_autotile_coord()).normalized()
#	velocity = velocity.bounce(direction) * 0.6
#	var collision = move_and_collide(velocity * delta)
#	if not collision: return
#	velocity = velocity.bounce(collision.normal) * 0.6
	queue_free()


#var velocity: Vector2 = Vector2.ZERO
#var dir: Vector2 = Vector2.ZERO
#var speed: float = 1200.0
#var gravity: float = 1000.0
#
#func _ready() -> void:
#	velocity = dir * speed
#
#func _physics_process(delta: float) -> void:
#	velocity.y += gravity * delta
#
#	var collision = move_and_collide(velocity * delta)
#	if not collision: return
#
#	velocity = velocity.bounce(collision.normal) * 0.6
