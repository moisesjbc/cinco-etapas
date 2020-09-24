extends RigidBody2D

func _ready():
	print(position)
	var direction_vector: Vector2 = -position.normalized()
	direction_vector.rotated(randf() * 0.3)
	
	var intensity: float = 3
	add_force(Vector2(0.0, 0.0), direction_vector * intensity)
	angular_velocity = 2
