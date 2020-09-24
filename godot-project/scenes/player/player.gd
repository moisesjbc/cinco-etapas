extends KinematicBody2D

export var speed: int = 500

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
	
	move_and_collide(velocity * speed * delta)
