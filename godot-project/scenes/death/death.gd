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
	if player.n_sticked_friends() > 0:
		var collision = translate(velocity * player.n_sticked_friends() * 30 * delta)

func _on_death_body_entered(body):
	if body.name == "player":
		body.die()
