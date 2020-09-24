extends KinematicBody2D

export var speed: int = 500
export var min_speed: int = 30
export var stick_penalty_by_friend: int = 100
var n_sticked_friends: int = 0


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

	var final_speed = max(speed - n_sticked_friends * stick_penalty_by_friend, min_speed)
	move_and_collide(velocity * final_speed * delta)

func stick_friend(friend):
	add_child(friend)
	n_sticked_friends += 1
	
func unstick_friend(friend):
	n_sticked_friends -= 1
