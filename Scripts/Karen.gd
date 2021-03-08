extends KinematicBody2D

var move_vec = Vector2()
var MOVE_SPEED = 10

func _ready():
	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		move_vec = move_vec.normalized()
		move_and_collide(move_vec * MOVE_SPEED)

func _physics_process(delta):
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
