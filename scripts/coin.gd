extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.play_pickup_sound()
		Shared.score += 1
		print(Shared.score)
		queue_free()
