extends CharacterBody2D

@export
var _SPEED = 300.0

@export
var _JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta * 2.5

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -_JUMP_VELOCITY


	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * _SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, _SPEED)

	move_and_slide()
