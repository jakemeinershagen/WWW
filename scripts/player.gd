extends CharacterBody2D
class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = -400.0
const GRAV_AMMOUNT = 980

var gravity = Vector2(0, GRAV_AMMOUNT)
var falling = false

@onready var checkpoint = {
	"position": position,
	"gravity": gravity,
	"rotation": rotation,
	"room": "Room1"
}

func _physics_process(delta: float) -> void:
	# Handle jump.
	if ((Input.is_action_just_pressed("switch_gravity") and is_on_floor())
			or (Input.is_action_just_pressed("switch_gravity") and is_on_ceiling())):
		gravity = -gravity
		rotation += PI

	# Add the gravity.
	velocity += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var collision = get_last_slide_collision()
	
	var body = null
	if collision:
		body = collision.get_collider()
	
	if body and body.name == "Spikes":
		die()
	
	if not (is_on_ceiling() or is_on_floor()):
		falling = true
	if (is_on_ceiling() or is_on_floor()) and falling:
		$TapSound.play()
		falling = false


func die():
	position = checkpoint["position"]
	rotation = checkpoint["rotation"]
	gravity = checkpoint["gravity"]
	$/root/World/Cameras.change_camera(checkpoint["room"])
	velocity = Vector2.ZERO
	Shared.reset_num += 1


func play_pickup_sound():
	$PickupSound.play()
