extends KinematicBody2D

export var MIN_SPEED = 10
export var MAX_SPEED = 30
export var STICKY_DISTANCE = 100
onready var player
var is_sticked: bool = false
var speed: int
var link_scene = preload("res://scenes/particles_link/particles_link.tscn")
var link = null

func _ready():
	z_index = -1
	player = get_node("/root/main_scene/player")
	speed = player.speed + randi() % (MAX_SPEED - MIN_SPEED) + MIN_SPEED

func _physics_process(delta):
	player = get_node("/root/main_scene/player")
	var distance_to_player: Vector2 = player.global_position - global_position
	
	if distance_to_player.length() > STICKY_DISTANCE:
		move_and_collide(distance_to_player.normalized() * (speed + player.travelling_speed_delta() * 0.1) * delta)
	else:
		is_sticked = true
		
		# "Stick" friend to player by removing it from its current parent
		# and adding it as a child to player.
		var position = global_position
		get_parent().remove_child(self)
		player.add_child(self)
		player.stick_friend(self)
		link = link_scene.instance()
		add_child(link)
		global_position = position
		link.link($energy_ball, player.get_node("energy_ball"))
		set_physics_process(false)

func move_away():
	queue_free()
