extends CharacterBody2D

@export var speed: float = 500.0
@export var speed_faster: float = 1000.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1000.0

# Variables adicionales
@export var wall_jump_push: float = 400.0  # Fuerza horizontal al saltar desde la pared
@export var wall_slide_gravity: float = 300.0  # Gravedad reducida al deslizarse por una pared

var is_wall_sliding: bool = false
var screen_size = Vector2()

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	velocity.x = 0
	var current_speed = speed_faster if Input.is_action_pressed("boost") else speed
	
	# Movimiento horizontal
	if Input.is_action_pressed("move_right"):
		velocity.x += current_speed
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("move_left"):
		velocity.x -= current_speed
		$AnimatedSprite2D.flip_h = false

	# Gravedad normal
	velocity.y += gravity * delta
	
	# Salto normal
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Manejo de salto en pared
	if is_on_wall() and not is_on_floor():
		is_wall_sliding = true  # Activar deslizamiento en pared
		velocity.y = min(velocity.y, wall_slide_gravity)  # Reducir la gravedad al deslizarse
		
		if Input.is_action_just_pressed("jump"):
			# Saltar desde la pared
			velocity.y = jump_velocity
			velocity.x = wall_jump_push * (-1 if is_on_wall_left() else 1)  # Empuje hacia el lado opuesto
	else:
		is_wall_sliding = false  # No está deslizando

	# Aplicar movimiento
	move_and_slide()

	# Animaciones
	if is_wall_sliding:
		$AnimatedSprite2D.play("wall")  # Animación de deslizar en la pared
	elif is_on_floor():
		if velocity.x != 0:
			$AnimatedSprite2D.play("walk")  # Caminar
		else:
			$AnimatedSprite2D.play("idle")  # Quieto
	else:
		$AnimatedSprite2D.play("jump")  # Saltar en el aire


# Detectar si está en la pared izquierda o derecha
func is_on_wall_left() -> bool:
	return is_on_wall() and velocity.x < 0

func is_on_wall_right() -> bool:
	return is_on_wall() and velocity.x > 0
