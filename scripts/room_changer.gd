extends Node2D

@export var room: String

@onready var cam_changer = $/root/World/Cameras


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		cam_changer.change_camera(room)
