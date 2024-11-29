extends CharacterBody2D

@export var speed: float = 200.0
@export var speedFaster: float = 500.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1000.0

var screen_size = Vector2()

const FLOOR_NORMAL = Vector2.UP

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	# Reset horizontal velocity every frame
	velocity.x = 0
	var current_speed = speedFaster if Input.is_action_pressed("boost") else speed
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		$AnimatedSprite2D.flip_h = true # Face right
	elif Input.is_action_pressed("move_left"):
		velocity.x -= speed
		$AnimatedSprite2D.flip_h = false # Face left
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Gravity effect
	velocity.y += gravity * delta
	

	# Apply movement
	move_and_slide()

	# Animation handling
	if velocity.x != 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.stop()
