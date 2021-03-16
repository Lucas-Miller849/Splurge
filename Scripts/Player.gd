extends KinematicBody2D

var MOVE_SPEED = 245
onready var animation = $AnimatedSprite
onready var sprite = $AnimatedSprite
onready var list = $List

func _ready():
	list.text = Global.list[0]

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("ui_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("ui_down"):
		move_vec.y += 1 
	if Input.is_action_pressed("ui_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("ui_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
	
	if move_vec.x == 1:
		sprite.flip_h = true
		animation.play("Walking")
	elif move_vec.x == -1:
		sprite.flip_h = false
		animation.play("Walking")
	else:
		animation.stop()
	
	if get_collision_layer_bit(1):
		list.text = Global.list[1]
	
	if Input.is_action_pressed("ui_select"):
		pass


func _on_Area2D_body_entered(body):
	if body.name == "Karen":
		get_tree().get_root().set_disable_input(true)
