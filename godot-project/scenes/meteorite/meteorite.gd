extends KinematicBody2D

export var velocity: Vector2 = Vector2(-1.0, 0.0)
var speed: int = 100
var random_rotation: float = randf() * 0.2 - 0.1
export var destroy_on_collision: bool = true

func _ready():
	velocity = velocity.normalized()


func _physics_process(delta):
	rotate(random_rotation)
	var collision = move_and_collide(velocity * speed * delta)
	if destroy_on_collision and collision:
		if collision.collider.name == "player":
			collision.collider.meteorite_hit()
		queue_free()
