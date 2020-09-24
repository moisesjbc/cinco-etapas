extends Node2D

var current_stage: int = -1

func _ready():
	$stage_timer.start(1)

func s1_separation_0():
	$story_gui.set_text("Eramos tan felices...", null, funcref(self, "s1_separation_1"))
	
func s1_separation_1():
	$player.loose_loved_one()
	$stage_timer.start(1.5)

func _on_stage_timer_timeout():
	if current_stage == -1:
		current_stage = 0
		s1_separation_0()
	elif current_stage == 0:
		current_stage = 1
		$story_gui.set_text("No dejaré que se lo lleven...", null, null)
		$meteorites_respawn.enable()
		$stage_timer.start(15)
	elif current_stage == 1:
		current_stage = 2
		$story_gui.set_text("Aunque tenga que acabar con todos...", null, null)
		$friends_respawn.enable()
