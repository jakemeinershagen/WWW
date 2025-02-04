extends Node2D
class_name Checkpoint

@onready var sprite = $Sprite

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.checkpoint = position
		Shared.active_checkpoint = self


func _process(_delta: float) -> void:
	if Shared.active_checkpoint == self:
		sprite.frame = 1
	else:
		sprite.frame = 0
