extends Node2D

var current_stage: int = 0

func _ready():
	$stage_timer.start(1)

func s1_separation_0():
	$story_gui.set_text("Eramos tan felices...", funcref(self, "s1_separation_1"))
	
func s1_separation_1():
	$player.loose_loved_one()

func _on_stage_timer_timeout():
	if current_stage == 0:
		s1_separation_0()
