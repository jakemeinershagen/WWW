extends Node2D
class_name Checkpoint

@export var room: String

@onready var sprite = $Sprite

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.checkpoint["position"] = position
		body.checkpoint["gravity"] = Vector2(0,
										body.GRAV_AMMOUNT * (1 if rotation == 0 else -1))
		body.checkpoint["rotation"] = rotation
		body.checkpoint["room"] = room
		Shared.active_checkpoint = self


func _process(_delta: float) -> void:
	if Shared.active_checkpoint == self:
		sprite.frame = 1
	else:
		sprite.frame = 0
