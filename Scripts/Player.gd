extends KinematicBody2D

const MOVE_SPEED = 300

func _ready():
	pass

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
	
	if Input.is_action_pressed("ui_select"):
		pass