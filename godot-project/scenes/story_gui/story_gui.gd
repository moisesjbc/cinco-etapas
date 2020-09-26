extends Control

var current_callback = null

func set_text(text, start_callback, end_callback, delay=3):
	set_physics_process(false)
	if start_callback:
		start_callback.call_func()

	$RichTextLabel.set_bbcode("[center]" + text + "[/center]")
	current_callback = end_callback
	if delay:
		if delay is int:
			$timer.start(delay)
		else:
			set_physics_process(true)
			
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_sacrifice"):
		set_physics_process(false)
		_on_timer_timeout()

func _on_timer_timeout():
	$RichTextLabel.set_bbcode("")
	if current_callback:
		current_callback.call_func()

func set_texts(texts, end_callback=null):
	_set_text(texts, 0, end_callback)

func _set_text(texts, i, end_callback=null):
	if i < len(texts) - 1:
		set_text(texts[i], null, null)
		yield(get_tree().create_timer(2.5), "timeout")
		_set_text(texts, i+1, end_callback)
	else:
		set_text(texts[i], null, end_callback)
