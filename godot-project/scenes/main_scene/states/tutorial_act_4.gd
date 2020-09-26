extends Node2D

var state_machine

func start():
	state_machine.set_text("El número indica la distancia con tu objetivo actual. Pulsa [ESPACIO] para continuar", null, funcref(self, "step_1"), "ui_sacrifice")
	state_machine.get_node("distance_control").set_distance(789, 1)
	
func step_1():
	state_machine.set_text("El color rojo indica que el objetivo se está alejando. Pulsa [ESPACIO] para continuar", null, funcref(self, "step_2"), "ui_sacrifice")

func step_2():
	state_machine.get_node("distance_control").set_distance(789, -1)
	state_machine.set_text("El color verde indica que el objetivo se está acercando. Pulsa [ESPACIO] para continuar", null, funcref(self, "step_3"), "ui_sacrifice")
	
func step_3():
	state_machine.get_node("distance_control").clear()
	state_machine.set_text("Pulsa ESPACIO para empezar", null, funcref(self, "step_4"), "ui_sacrifice")
	
func step_4():
	state_machine.change_state("state_0_loss")
