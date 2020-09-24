extends KinematicBody2D

export var speed = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(Vector2(1, 0).normalized().rotated(rotation) * speed * delta)
	if collision:
		if collision.collider.is_in_group("friends"):
			collision.collider.move_away()
		queue_free()
