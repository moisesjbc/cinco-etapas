extends Node2D

var state_machine
onready var player = get_node("/root/main_scene/player")
onready var death = get_node("/root/main_scene/death")
var player_final_position = Vector2(150.0, 368.0)
var loved_one_final_position = Vector2(500.0, 470.0)
var death_final_position = Vector2(-100.0, 368.0)

func start():
	state_machine.get_node("distance_label").queue_free()
	state_machine.get_node("meteorites_respawn").disable()
	state_machine.get_node("friends_respawn").disable()
	state_machine.clean_npcs()
	state_machine.get_node("story_gui").set_text("O no...", null, null)
	state_machine.get_node("player").disable_input()

func process(delta):
	var all_in_position = true
	if player.global_position.distance_to(player_final_position) > 30:
		all_in_position = false
		player.move_and_collide((player_final_position - player.global_position).normalized() * 300 * delta)
	if state_machine.loved_one.global_position.distance_to(loved_one_final_position) > 30:
		all_in_position = false
		state_machine.loved_one.move_and_collide((loved_one_final_position - state_machine.loved_one.global_position).normalized() * 300 * delta)
	if death.global_position.distance_to(death_final_position) > 30:
		all_in_position = false
		death.translate((death_final_position - death.global_position).normalized() * 300 * delta)
	if all_in_position:
		state_machine.change_state("state_4_depression_act_1")
