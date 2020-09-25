extends Node2D

var current_stage: int = -1
var distance_to_loved_one = 0
var death_right

onready var current_state

func _ready():
	change_state("state_4_depression_act_0")
		
func change_state(new_state):
	current_state = get_node(new_state)
	current_state.state_machine = self
	if current_state.has_method("start"):
		current_state.start()
	
func _on_stage_timer_timeout():
	if current_state and current_state.has_method("timeout"):
		current_state.timeout()

func _physics_process(delta):
	if current_state and current_state.has_method("process"):
		current_state.process(delta)


func move_to(node, final_position, delta, flag, speed = 300):
	if node.global_position.distance_to(final_position) > 30:
		node.move_and_collide((final_position - node.global_position).normalized() * speed * delta)
		return false
	else:
		return flag and true


func set_text(text, pre_callback, post_callback):
	$story_gui.set_text(text, pre_callback, post_callback)
	
func set_texts(texts, post_callback=null):
	$story_gui.set_texts(texts, post_callback)
	
func set_timeout(time):
	$stage_timer.start(time)
