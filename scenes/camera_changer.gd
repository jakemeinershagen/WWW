extends Node


func change_camera(new_camera: String):
	var cameras = get_children()
	for cam in cameras:
		if cam.name == new_camera:
			cam.enabled = true
		else:
			cam.enabled = false
