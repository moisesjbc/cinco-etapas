extends Node2D

var state_machine

var left_pressed: bool = false
var right_pressed: bool = false
var up_pressed: bool = false
var down_pressed: bool = false

func start():
	state_machine.get_node("skip_label").set_visible(true)
	update_text()
	
func update_text():
	state_machine.set_text(
		"Pulsa las teclas " +
		state_machine.get_instruction_text("A", left_pressed) + ", " +
		state_machine.get_instruction_text("S", down_pressed) + ", " +
		state_machine.get_instruction_text("D", right_pressed) + ", " +
		state_machine.get_instruction_text("W", up_pressed) + " para moverte",
		null, null, null, not left_pressed and not right_pressed and not up_pressed and not down_pressed)
	
func process(delta):
	if not left_pressed or not right_pressed or not up_pressed or not down_pressed:
		if Input.is_action_pressed("ui_left"):
			left_pressed = true
			update_text()
		if Input.is_action_pressed("ui_right"):
			right_pressed = true
			update_text()
		if Input.is_action_pressed("ui_up"):
			up_pressed = true
			update_text()
		if Input.is_action_pressed("ui_down"):
			down_pressed = true
			update_text()
		if left_pressed and right_pressed and up_pressed and down_pressed:
			state_machine.set_timeout(1)
			set_physics_process(false)
	state_machine.check_skip_tutorial()
	
func timeout():
	state_machine.change_state("tutorial_act_1")
