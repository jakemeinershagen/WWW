extends Node2D

@export var room_1_cam: Camera2D
@export var room_2_cam: Camera2D

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		room_1_cam.enabled = !room_1_cam.enabled
		room_2_cam.enabled = !room_2_cam.enabled
