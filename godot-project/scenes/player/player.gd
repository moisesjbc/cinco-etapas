extends KinematicBody2D

export var base_speed: int = 500
var speed: int
export var damage_per_meteorite = 10
export var min_speed: int = 30
export var stick_penalty_by_friend: int = 100
var n_sticked_friends: int = 0
var bullet_scene = preload("res://scenes/bullet/bullet.tscn")
var life = 50

func _ready():
	update_life_label()

func _physics_process(delta):
	var velocity: Vector2 = Vector2(0.0, 0.0)
	
	# Horizontal movement
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	elif Input.is_action_pressed("ui_right"):
		velocity.x = +1
	
	# Vertical movement
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	elif Input.is_action_pressed("ui_down"):
		velocity.y = +1
		
	# Shoot
	if Input.is_action_just_pressed("ui_shoot"):
		shoot()

	speed = max(base_speed - n_sticked_friends * stick_penalty_by_friend, min_speed)
	move_and_collide(velocity * speed * delta)
	
	$bullet_respawn.look_at(get_global_mouse_position())

func stick_friend(friend):
	add_child(friend)
	n_sticked_friends += 1
	
func unstick_friend():
	n_sticked_friends -= 1

func shoot():
	var bullet = bullet_scene.instance()
	
	get_node("/root/main_scene").add_child(bullet)
	bullet.global_position = $bullet_respawn/sprite.global_position
	bullet.global_rotation = $bullet_respawn/sprite.global_rotation

func update_life_label():
	$life_label.text = str(life) + " %"

func meteorite_hit():
	life -= damage_per_meteorite
	if life < 0:
		life = 0
	update_life_label()
