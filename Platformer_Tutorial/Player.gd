extends KinematicBody2D

const WALK = 40
const SPRINT = 70
const GRAVITY = 10
const JUMP = -250
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("D"):
		velocity.x = WALK 
	elif Input.is_action_pressed("A"):
		velocity.x = -WALK 
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("Space"):
		velocity.y = JUMP
	velocity.y = velocity.y + GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)

