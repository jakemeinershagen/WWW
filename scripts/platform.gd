extends StaticBody2D
class_name Platform

@export var lifetime = 2
var player_touched = false
var last_reset = 0

@onready var timer = $Timer


func _ready() -> void:
	timer.wait_time = lifetime


func _process(_delta: float) -> void:
	if player_touched and timer.is_stopped():
		disable()
	if Shared.reset_num > last_reset:
		reset()
		last_reset = Shared.reset_num


func disable():
	visible = false
	collision_layer = 0


func enable():
	visible = true
	collision_layer = 3


func reset():
	player_touched = false
	enable()


func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		timer.start()
		player_touched = true
