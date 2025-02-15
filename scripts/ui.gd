extends CanvasLayer

func toggle_pause():
	get_tree().paused = not get_tree().paused
	$PauseMenu.visible = not $PauseMenu.visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_released("pause"):
		toggle_pause()


func _on_resume_button_up() -> void:
	toggle_pause()


func _on_quit_button_up() -> void:
	get_tree().quit()


func _on_restart_button_up() -> void:
	toggle_pause()
	get_tree().reload_current_scene()
