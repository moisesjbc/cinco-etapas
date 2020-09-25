extends Node2D

var state_machine

onready var player = get_node("/root/main_scene/player")
var loved_one

func start():
	state_machine.get_node("story_gui").set_text("No dejaré que se lo lleven...", null, null)
	state_machine.get_node("meteorites_respawn").enable()
	state_machine.get_node("stage_timer").start(2)
	loved_one = state_machine.loved_one

func process(delta):
	state_machine.distance_to_loved_one = max(state_machine.distance_to_loved_one + (loved_one.traveling_speed - player.traveling_speed) * delta, 0)
	state_machine.get_node("distance_label").text = str(int(state_machine.distance_to_loved_one)) + " ->"

func timeout():
	state_machine.change_state("state_2_anger")
