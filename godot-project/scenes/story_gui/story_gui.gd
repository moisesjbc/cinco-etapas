extends Control

var current_callback = null

func set_text(text, callback):
	$RichTextLabel.set_bbcode("[center]" + text + "[/center]")
	current_callback = callback
	$timer.start()

func _on_timer_timeout():
	$RichTextLabel.set_bbcode("")
	if current_callback:
		current_callback.call_func()
