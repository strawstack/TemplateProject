extends Node2D

func _ready():
	pass

func addItem(itemRef):
	get_node("/root/main/CanvasLayer").add(itemRef)

func _process(delta):
	pass
