extends CPUParticles2D

func _ready():
	emitting = false

func link(src_node, dst_node):
	position = src_node.position
	gravity = to_local(dst_node.global_position) - src_node.position
	print("src_node.get_parent().name ", src_node.get_parent().name)
	if src_node.get_parent().name != "loved_one":
		lifetime = gravity.length() * 0.015
	scale = Vector2.ONE
	emitting = true
	color_ramp.colors[0] = src_node.color
	color_ramp.colors[1] = dst_node.color

func break():
	emitting = false
