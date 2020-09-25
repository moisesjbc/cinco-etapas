extends KinematicBody2D

export var velocity: Vector2 = Vector2(-1.0, 0.0)
var speed: int = 500
var random_rotation: float = randf() * 0.2 - 0.1
export var destroy_on_collision: bool = true
var player

func _ready():
	player = get_node("/root/main_scene/player")
	velocity = velocity.normalized()


func _physics_process(delta):
	rotate(random_rotation)
	if player:
		var collision = move_and_collide(velocity * (speed + player.travelling_speed_delta() * 0.1) * delta)
		if destroy_on_collision and collision:
			if collision.collider.name == "player":
				collision.collider.meteorite_hit()
			queue_free()
