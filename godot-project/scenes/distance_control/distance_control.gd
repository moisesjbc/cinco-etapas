extends Control

func _ready():
	clear()
	
func clear():
	$label.bbcode_text = ""

func set_distance(distance, delta):
	var color = "#FF0000"
	if delta == 0:
		color = "#FFFFFF"
	elif delta < 0:
		color = "#00FF00"
	$label.bbcode_text = "[color=" + color +"][right]" + str(int(distance)) + " -> [/right][/color]"
