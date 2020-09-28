extends Node2D

var state_machine

func start():
	state_machine.get_node("story_gui").set_text("No llego... quizás si sacrifico vida por velocidad... ([ESPACIO]: -10 vida, + velocidad)", null, null, null)
	state_machine.get_node("player").enable_sacrifice()

func process(delta):
	state_machine.get_node("state_2_anger").process(delta)
	if state_machine.distance_to_loved_one <= 0:
		state_machine.change_state("state_4_depression_act_0")
