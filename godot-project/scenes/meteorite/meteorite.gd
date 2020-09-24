extends RigidBody2D

func _ready():
	# Set a random linear velocity
	var direction_vector: Vector2 = -position.normalized()
	var intensity: float = 1.5
	direction_vector.rotated(randf() * 0.3)
	add_force(Vector2(0.0, 0.0), direction_vector * intensity)
	
	# Set a random linear velocity
	angular_velocity = randf() - 0.5
	
