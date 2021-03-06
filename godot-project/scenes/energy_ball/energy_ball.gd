extends Sprite

var scales = [
	Vector2.ZERO,
	Vector2.ZERO
]

export var color: Color = Color.white

func _ready():
	scales[0] = scale
	scales[1] = scale + Vector2(scale.x * 0.1, scale.y * 0.1)
	start_tween()
	self.modulate = color

func start_tween():
	$tween.interpolate_property(self, "scale", scales[0], scales[1], 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$tween.start()

func _on_tween_tween_completed(_object, _key):
	scales.invert()
	start_tween()
