extends Node2D

var current_stage: int = -1
var distance_to_loved_one = 0

onready var current_state

func _ready():
	change_state("state_0_loss")
		
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
