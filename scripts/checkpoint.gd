extends Node2D
class_name Checkpoint


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("yes")
	if body is Player:
		body.checkpoint = position
