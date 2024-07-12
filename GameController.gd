extends Node2D

func _ready():
	pass

func addItem(itemRef):
	get_node("/root/main/Inventory").add(itemRef)

func beginDialogue(json):
	get_node("/root/main/TextBox").beginDialogue(json)

func _process(delta):
	pass
