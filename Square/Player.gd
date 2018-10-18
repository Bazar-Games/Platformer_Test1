extends KinematicBody2D

export (int) var speed = 200

const SPEED = 200

var bullet = preload("res://bullet.tscn")
var bulletCount = 0
var isSpacePressed = false
var velocity = Vector2()

func _ready():
	set_process(true)

func _prosses(delta):
	print("hello world")

func get_input():

    if Input.is_action_pressed("ui_right"):
        velocity.x = SPEED
        velocity.y = 0
		
    elif Input.is_action_pressed("ui_left"):
        velocity.x = -SPEED
        velocity.y = 0
		
    elif Input.is_action_pressed("ui_down"):
        velocity.y = SPEED
        velocity.x = 0
		
    elif Input.is_action_pressed("ui_up"):
        velocity.y = -SPEED
        velocity.x = 0
   
func shoot():
	bulletCount = bulletCount+ 1
	var bullet_instance = bullet.instance()
	bullet_instance.set_name("bullet" + str(bulletCount))
	
	add_child(bullet)

func _physics_process(delta):
    get_input()
    move_and_slide(velocity)