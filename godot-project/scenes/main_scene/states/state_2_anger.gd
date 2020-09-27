extends Node2D

var state_machine

onready var player = get_node("/root/main_scene/player")

func start():
	state_machine.get_node("story_gui").set_text("¡Aunque tenga que acabar con todos...!", null, null)
	state_machine.get_node("friends_respawn").enable()
	state_machine.get_node("stage_timer").start(20)


func process(delta):
	state_machine.get_node("state_1_denial").process(delta)


func timeout():
	state_machine.change_state("state_3_bargaining")
