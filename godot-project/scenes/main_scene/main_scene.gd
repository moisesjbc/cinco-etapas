extends Node2D

var current_stage: int = -1
var distance_to_loved_one = 0

func _ready():
	$stage_timer.start(1)
	set_physics_process(false)

func s1_separation_0():
	$story_gui.set_text("Eramos tan felices...", null, funcref(self, "s1_separation_1"))
	
func s1_separation_1():
	$player.loose_loved_one()
	$stage_timer.start(1.5)
	
func stage_2():
	$story_gui.set_text("Quizás si sacrifico vida por velocidad [ESPACIO]...", funcref(self, "stage_2_1"), null)
	$player.enable_sacrifice()

func stage_2_1():
	print("sacrifice!")

func _on_stage_timer_timeout():
	if current_stage == -1:
		s1_separation_0()
	elif current_stage == 0:
		set_physics_process(true)
		$story_gui.set_text("No dejaré que se lo lleven...", null, null)
		$meteorites_respawn.enable()
		$stage_timer.start(2)
	elif current_stage == 1:
		$story_gui.set_text("¡Aunque tenga que acabar con todos...!", null, null)
		$friends_respawn.enable()
		$stage_timer.start(2)
	elif current_stage == 2:
		$story_gui.set_text("No llego...", null, funcref(self, "stage_2"))
		set_physics_process(true)
		pass
	current_stage += 1

func _physics_process(delta):
	if current_stage >= 0:
		print("loved one speed: " + str(get_node("/root/main_scene/loved_one").traveling_speed))
		print("player: " + str($player.traveling_speed))
		distance_to_loved_one += (get_node("/root/main_scene/loved_one").traveling_speed - $player.traveling_speed) * delta
		$distance_label.text = str(int(distance_to_loved_one)) + " ->"
