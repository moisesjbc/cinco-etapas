extends Node2D

var state_machine

func start():
	state_machine.get_node("story_gui").set_text("Eramos tan felices...", null, funcref(self, "loose_loved_one"))
	
func loose_loved_one():
	state_machine.get_node("player").loose_loved_one()
	state_machine.get_node("stage_timer").start(1.5)
	
func timeout():
	state_machine.change_state("state_1_denial")
