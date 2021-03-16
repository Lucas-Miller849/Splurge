extends Node

var list:Array = ["Bananas", "Apples", "Bread", "Milk"]

func _ready():
	pass


signal take_life(lives)
signal add_karens(karens)


func stop_player():
	get_tree().get_root().set_disable_input(true)
	
	

func let_go():
	get_tree().get_root().set_disable_input(false)
