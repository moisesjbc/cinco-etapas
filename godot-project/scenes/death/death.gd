extends Area2D

onready var player = get_node("/root/main_scene/player")

export var to_right: bool = true
export var return_speed: int = 50
export var initial_global_position: Vector2
var velocity: Vector2

func _ready():
	initial_global_position = global_position
	if to_right:
		velocity = Vector2(1.0, 0.0)
	else:
		velocity = Vector2(-1.0, 0.0)

func _physics_process(delta):
	if player.n_sticked_friends() > 0:
		translate(velocity * player.n_sticked_friends() * 30 * delta)
	elif (global_position.x - initial_global_position.x) > return_speed * delta:
		translate(-velocity * return_speed * delta)

func _on_death_body_entered(body):
	if body.name == "player":
		body.die()
