extends KinematicBody2D


export var MOVE_SPEED = 200
onready var sprite = $AnimatedSprite
onready var animation = $AnimatedSprite
onready var label = $Speech
onready var pos = get_parent().get_node("PointOne")

var player = null
var chasing:bool = false

func _ready():
#	Global.connect("add_karens", self, "_on_Area2D_body_entered")
	label.hide()
	var nav = get_parent().get_node("Nav")


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player = get_parent().get_node("Player")
		chasing = true
		label.show()
	else:
		pass

func _physics_process(delta):
	if player != null:
		var vec_to_player = player.global_position - global_position
		vec_to_player = vec_to_player.normalized() 
		move_and_collide(vec_to_player * MOVE_SPEED * delta)
		if vec_to_player.x > 0:
			sprite.flip_h = true
		if vec_to_player.x < 0:
			sprite.flip_h = false
	else:
		var vec_to_pos = pos.global_position - global_position
		vec_to_pos = vec_to_pos.normalized()
		move_and_collide(vec_to_pos * MOVE_SPEED * delta)
	if chasing == true:
		animation.play("Angry")
		animation.speed_scale = 2 
	else:
		animation.play("Walking")
		animation.speed_scale = 1


func _on_Area2D_body_exited(body):
	player = null
	chasing = false
	label.hide()


func _on_Body_body_entered(body):
	pass


func _on_Body_body_exited(body):
	pass # Replace with function body.
