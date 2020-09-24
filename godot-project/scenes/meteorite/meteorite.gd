extends KinematicBody2D

var velocity: Vector2
var speed: int = 100
var random_rotation: float = randf() * 0.2 - 0.1

func _ready():
	# Set a random linear velocity
	velocity = (get_node("/root/main_scene/player").global_position - global_position).normalized()
	var intensity: float = 1.5
	velocity.rotated(randf() * 0.3)


func _physics_process(delta):
	move_and_collide(velocity * speed * delta)
	rotate(random_rotation)
