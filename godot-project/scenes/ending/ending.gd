extends Node2D

func _ready():
	$story_gui.set_texts([
		"Hace unos meses desde el accidente.",
		"Al principio me negué a aceptarlo.",
		"Y lo pagué con mis amigos.",
		"Lo intenté todo para recuperarlo.",
		"Pero fue imposible y me rendí.",
		"Mis amigos no se rindieron conmigo y me ayudaron a aceptarlo.",
		"\"Lo... siento\", me disculpé.",
		"\"Tranquilo, solo fue una etapa\".",
	], funcref(self, "return_to_main_menu"))
	
func return_to_main_menu():
	get_tree().change_scene("res://menus/main_menu/main_menu.tscn")
