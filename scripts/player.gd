extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0

var gravity = Vector2(0, 980)


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
