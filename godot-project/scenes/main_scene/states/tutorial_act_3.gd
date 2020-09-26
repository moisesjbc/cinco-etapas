extends Node2D

var state_machine

var use_learned: bool = false

func start():
	update_text()
	
func update_text():
	state_machine.set_text(
		state_machine.get_instruction_text("Pulsa espacio", use_learned) + " para interactuar ",
		null, null, null)
		
func process(delta):
	state_machine.check_skip_tutorial()

func input(event):
	if not use_learned and event is InputEventKey and event.scancode == KEY_SPACE:
		use_learned = true
		update_text()
		state_machine.set_timeout(1)
		
func timeout():
	state_machine.change_state("tutorial_act_4")
