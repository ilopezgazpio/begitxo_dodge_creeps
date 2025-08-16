extends Area2D

@export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO
	var animation = $AnimatedSprite2D

	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		animation.play()
	else:
		animation.animation = "down"
		animation.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.y < 0:
		animation.animation = "up"
	elif velocity.y > 0:
		animation.animation = "down"
	elif velocity.x < 0:
		animation.animation = "left"
	elif velocity.x > 0:
		animation.animation = "right"
