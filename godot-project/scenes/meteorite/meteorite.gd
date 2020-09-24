extends RigidBody2D

var player

func _ready():
	player = get_node("/root/main_scene/player")

	# Set a random linear velocity
	var direction_vector: Vector2 = -position.normalized()
	var intensity: float = 1.5
	direction_vector.rotated(randf() * 0.3)
	add_force(Vector2(0.0, 0.0), direction_vector * intensity)
	
	# Set a random linear velocity
	angular_velocity = randf() - 0.5
	

func _physics_process(delta):
	# Delete meteorite if too far from player
	if global_position.distance_to(player.global_position) > 1000:
		queue_free()
