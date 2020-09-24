extends Node2D

var state_machine
onready var player = get_node("/root/main_scene/player")
onready var death = get_node("/root/main_scene/death")

func start():
	state_machine.get_node("distance_label").queue_free()
	state_machine.get_node("meteorites_respawn").disable()
	state_machine.get_node("friends_respawn").disable()
	for meteorite in get_tree().get_nodes_in_group("meteorites"):
		meteorite.queue_free()
	for friend in get_tree().get_nodes_in_group("friends"):
		friend.queue_free()
	state_machine.get_node("story_gui").set_text("O no...", null, null)
	state_machine.get_node("player").disable_input()

func process(delta):
	player.move_and_collide((Vector2(150.0, 368.0) - player.global_position).normalized() * 300 * delta)
	death.move_and_collide((Vector2(0.0, 368.0) - death.global_position).normalized() * 300 * delta)
