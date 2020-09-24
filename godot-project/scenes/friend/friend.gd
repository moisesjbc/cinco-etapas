extends KinematicBody2D

export var MIN_SPEED = 300
export var MAX_SPEED = 600
export var STICKY_DISTANCE = 100
onready var speed = randi() % (MAX_SPEED - MIN_SPEED) + MIN_SPEED
onready var player = get_node("/root/main_scene/player")
var is_sticked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("speed " + str(speed))

func _physics_process(delta):
	var distance_to_player: Vector2 = player.global_position - global_position
	
	if distance_to_player.length() > STICKY_DISTANCE:
		move_and_collide(distance_to_player.normalized() * speed * delta)
	else:
		is_sticked = true
		
		# "Stick" friend to player by removing it from its current parent
		# and adding it as a child to player.
		var position = global_position
		get_parent().remove_child(self)
		player.add_child(self)
		player.stick_friend(self)
		global_position = position
		set_physics_process(false)
