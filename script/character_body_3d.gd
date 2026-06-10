extends CharacterBody3D

const SPEED = 2
const ROTATION_SPEED = 0.5
const JUMP_VELOCITY = 0.1

func _physics_process(delta: float) -> void:

	# Gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Pulo
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Rotação esquerda/direita
	if Input.is_action_pressed("ui_left"):
		rotate_y(ROTATION_SPEED * delta)

	if Input.is_action_pressed("ui_right"):
		rotate_y(-ROTATION_SPEED * delta)

	# Movimento frente/trás
	var move_input = 0.0

	if Input.is_action_pressed("ui_up"):
		move_input = 1.0

	if Input.is_action_pressed("ui_down"):
		move_input = -1.0

	# Direção para frente do personagem
	var direction = -transform.basis.z

	velocity.x = direction.x * move_input * SPEED
	velocity.z = direction.z * move_input * SPEED

	move_and_slide()
