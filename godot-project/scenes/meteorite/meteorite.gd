extends KinematicBody2D

var velocity: Vector2
var speed: int = 100
var random_rotation: float = randf() * 0.2 - 0.1

func _ready():
	velocity = Vector2(-1.0, 0.0).normalized()


func _physics_process(delta):
	rotate(random_rotation)
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		if collision.collider.name == "player":
			collision.collider.meteorite_hit()
		queue_free()
