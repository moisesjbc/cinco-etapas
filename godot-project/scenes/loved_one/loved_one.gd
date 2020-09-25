extends KinematicBody2D

export var traveling_speed: int = 1500

func _ready():
	set_physics_process(false)

func die():
	set_physics_process(true)

func _physics_process(delta):
	var collision = move_and_collide(Vector2(1.0, 0.0).normalized() * 500 * delta)
	
func real_global_position():
	return $sprite.global_position

func _on_visibility_notifier_screen_exited():
	set_physics_process(false)
