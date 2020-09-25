extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation_player.play("fade_out")
