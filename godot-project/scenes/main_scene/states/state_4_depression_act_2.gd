extends Node2D

var state_machine
var player

var death_left
var death_right

var death_left_final_position
var death_right_final_position

func start():
	player = get_node("/root/main_scene/player")
	player.enable_input()
	
	var friends_respawn = state_machine.get_node("friends_respawn")
	friends_respawn.respawn_friend(500)
	friends_respawn.respawn_friend(500)
	friends_respawn.respawn_friend(500)
	friends_respawn.respawn_friend(500)
	friends_respawn.respawn_friend(500)
	friends_respawn.respawn_friend(500)
	
	death_left = get_node("/root/main_scene/death")
	death_left_final_position = Vector2(350.0, death_left.global_position.y)
	
	death_right = state_machine.death_right
	death_right_final_position = Vector2(650.0, death_right.global_position.y)
	state_machine.set_text("Es imposible...", null, funcref(self, "step_1"))
	
func step_1():
	state_machine.set_text("No sirve de nada", null, funcref(self, "step_2"))
	
func step_2():
	state_machine.set_text("[color=#00FF00]¡Aguanta![/color]", null, funcref(self, "step_3"))
	
func step_3():
	state_machine.set_text("¿...Luís?", null, null)

func process(delta):
	var all_in_position = state_machine.move_to(death_left, death_left_final_position, delta, true, 40)
	all_in_position = state_machine.move_to(death_right, death_right_final_position, delta, all_in_position, 40)
	if all_in_position:
		death_left.queue_free()
		death_right.queue_free()
		state_machine.change_state("state_5_acceptance_act_0")
