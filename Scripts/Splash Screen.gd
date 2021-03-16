extends TextureRect

var game = preload("res://Scenes/Level One.tscn").instance()

func _ready():
	$AnimatedSprite.play("Walking")
	$AnimationPlayer.play("Animation")


func _on_TextureButton_pressed():
	add_child(game)
