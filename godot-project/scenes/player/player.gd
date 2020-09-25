extends KinematicBody2D

export var initial_speed: int = 500
var base_speed: int
var speed: int
export var initial_traveling_speed: int = 200
export var base_traveling_speed: int = initial_traveling_speed
var traveling_speed: int = 200
export var damage_per_meteorite = 10
export var damage_per_sacrifice = 10
export var min_speed: int = 30
export var stick_penalty_by_friend: int = 100
export var traveling_speed_increase_per_sacrifice: int = 300
var n_sticked_friends: int = 0
var bullet_scene = preload("res://scenes/bullet/bullet.tscn")
var life = 100
var sacrifice_enabled: bool = false
var input_enabled: bool = true

signal player_died

func _ready():
	base_speed = initial_speed
	update_life_label()

func _physics_process(delta):
	var velocity: Vector2 = Vector2(0.0, 0.0)
	
	if input_enabled:
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
			
		# Sacrifice
		if sacrifice_enabled and Input.is_action_just_pressed("ui_sacrifice"):
			sacrifice()
			
		# Shoot
		if Input.is_action_just_pressed("ui_shoot"):
			shoot()
		
		speed = max(base_speed + travelling_speed_delta() * 0.1 - n_sticked_friends * stick_penalty_by_friend, min_speed)
		traveling_speed = max(base_traveling_speed - n_sticked_friends * stick_penalty_by_friend, min_speed)
		move_and_collide(velocity * speed * delta)
		
		$bullet_respawn.look_at(get_global_mouse_position())

func disable_input():
	input_enabled = false
	
func enable_input():
	input_enabled = true

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
	take_damage(damage_per_meteorite)
	
func take_damage(damage):
	life -= damage
	if life <= 0:
		life = 0
		die()
		
	update_life_label()
	
func die():
	emit_signal("player_died")

func loose_loved_one():
	position = $loved_one.global_position
	var loved_one = $loved_one
	take_damage(50)
	remove_child(loved_one)
	get_node("/root/main_scene").add_child(loved_one)
	loved_one.global_position = position 
	loved_one.die()
	return loved_one
	
func sacrifice():
	take_damage(damage_per_sacrifice)
	base_traveling_speed += traveling_speed_increase_per_sacrifice

func enable_sacrifice():
	sacrifice_enabled = true

func travelling_speed_delta():
	return traveling_speed - initial_traveling_speed
