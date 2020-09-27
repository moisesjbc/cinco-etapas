extends Node2D

var state_machine

var aim_learned: bool = false

func start():
	update_text()
	
func update_text():
	state_machine.set_text(
		state_machine.get_instruction_text("Mueve el ratón", aim_learned) + " para apuntar ",
		null, null, null, not aim_learned)
		
func process(_delta):
	state_machine.check_skip_tutorial()
		
func input(event):
	if not aim_learned and event is InputEventMouseMotion:
		aim_learned = true
		update_text()
		state_machine.set_timeout(1)

func timeout():
	state_machine.change_state("tutorial_act_2")
