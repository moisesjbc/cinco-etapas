extends Node2D

var state_machine

var shooting_learned: bool = false

func start():
	update_text()
	
func update_text():
	state_machine.set_text(
		state_machine.get_instruction_text("Click izquierdo del ratón", shooting_learned) + " para disparar ",
		null, null, null, not shooting_learned)
		
func process(_delta):
	state_machine.check_skip_tutorial()
		
func input(event):
	if not shooting_learned and event is InputEventMouseButton:
		shooting_learned = true
		update_text()
		state_machine.set_timeout(1)
		
func timeout():
	state_machine.change_state("tutorial_act_3")
