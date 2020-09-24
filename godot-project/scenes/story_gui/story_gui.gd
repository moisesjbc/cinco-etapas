extends Control

var current_callback = null

func set_text(text, start_callback, end_callback):
	if start_callback:
		start_callback.call_func()

	$RichTextLabel.set_bbcode("[center]" + text + "[/center]")
	current_callback = end_callback
	$timer.start()

func _on_timer_timeout():
	$RichTextLabel.set_bbcode("")
	if current_callback:
		current_callback.call_func()
