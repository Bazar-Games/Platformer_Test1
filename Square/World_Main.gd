extends Node

var spacePress = false
var bulletCount = 0
var bullet = preload("res://bullet.tscn")

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("space"):
		spacePress == false
		fire()
		spacePress = true
	else:
		spacePress = false
		
	var playerPos = get_node("Player").get_position()
	
	if Input.is_action_pressed("ui_right"):
		playerPos.x =playerPos.x - 100 * delta
	elif Input.is_action_pressed("ui_right"):
		playerPos.x =playerPos.x + 100 * delta
	
	node("Player").set_position(playerPos)
	
func fire():
	bulletCount = bulletCount + 1
	var bullet_instance = bullet.instance()
	bullet_instance.set_name("bullet" + str(bulletCount))
	add_child(bullet_instance)
	var bulletPos = get_node("bullet" + str(bulletCount)).position()
	var playerPos = get_node("Player").position()
	bulletPos.y = playerPos.y + 200
	bulletPos.x = playerPos.x + 200
	get_node("bullet" + str(bulletCount)).position(bulletPos)