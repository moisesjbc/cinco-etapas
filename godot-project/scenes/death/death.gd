extends Area2D

onready var player = get_node("/root/main_scene/player")

export var to_right: bool = true
var velocity: Vector2

func _ready():
	if to_right:
		velocity = Vector2(1.0, 0.0)
	else:
		velocity = Vector2(-1.0, 0.0)

func _physics_process(delta):
	#print("process ", is_colliding())
	var relative_speed = player.base_speed - player.speed
	
	if relative_speed > 0:
		var collision = translate(velocity * max(relative_speed, 0) * delta)


func _on_death_body_entered(body):
	print("body", body.name)
	if body.name == "player":
		body.die()
