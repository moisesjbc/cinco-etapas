extends Node2D

var state_machine

var player
var player_final_position
var loved_one
var loved_one_final_position = Vector2(990, 460)
var death_scene = preload("res://scenes/death/death.tscn")
var death_right
var death_right_final_position
var death_left
var death_left_final_position

func start():
	player = state_machine.get_node("/root/main_scene/player")
	player_final_position = state_machine.get_node("/root/main_scene/loved_one").real_global_position()
	loved_one = state_machine.loved_one
	
	death_left = get_node("/root/main_scene/death")
	death_left_final_position = Vector2(300, death_left.global_position.y)
	
	death_right = death_scene.instance()
	state_machine.death_right = death_right
	death_right.to_right = false
	death_right.global_position = Vector2(1300.0, 368)
	death_right.name = "death_right"
	death_right_final_position = Vector2(1000.0, death_right.global_position.y)
	death_right.add_to_group("clear_on_reset")
	get_tree().root.add_child(death_right)
	death_right.set_physics_process(false)
	
	death_left_final_position = Vector2(30.0, death_left.global_position.y)

func process(delta):
	var all_in_position = state_machine.move_to(player, player_final_position, delta, true)
	if loved_one:
		all_in_position = state_machine.move_to(loved_one, loved_one_final_position, delta, all_in_position)
	all_in_position = state_machine.move_to(death_right, death_right_final_position, delta, all_in_position)
	all_in_position = state_machine.move_to(death_left, death_left_final_position, delta, all_in_position)
	if all_in_position:
		if loved_one:
			loved_one.queue_free()
			loved_one = null
			state_machine.set_timeout(2)

func timeout():
	state_machine.set_text("¿Por qué...?", null, funcref(self, "change_to_next_state"))

func change_to_next_state():
	state_machine.change_state("state_4_depression_act_2")
