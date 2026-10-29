extends CharacterBody2D


const SPEED = 300.0
var screen_size
var last_direction

func _physics_process(delta: float) -> void:
	# Add the gravity (floating rn).
	#if not is_on_floor():
		#velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		velocity.y = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x +=1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if Input.is_action_pressed("move_right") and Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.animation = "walk NE"
		last_direction = "NE"
	elif Input.is_action_pressed("move_right") and Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.animation = "walk SE"
		last_direction = "SE"
	elif Input.is_action_pressed("move_left") and Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.animation = "walk SW"
		last_direction = "SW"
	elif Input.is_action_pressed("move_left") and Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.animation = "walk NW"
		last_direction = "NW"
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.animation = "walk E"
		last_direction = "E"
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.animation = "walk N"
		last_direction = "N"
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.animation = "walk W"
		last_direction = "W"
	elif Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.animation = "walk S"
		last_direction = "S"
	
	
