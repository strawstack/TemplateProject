extends Node2D

var state = {}

func _ready():
	initState()

func initState():
	state['name'] = false

func toggleState(name):
	state[name] = not state[name]

func setState(name, value):
	state[name] = value

func addItem(itemRef):
	get_node("/root/main/Inventory").add(itemRef)

func beginDialogue(json):
	get_node("/root/main/TextBox").beginDialogue(json)

func _process(delta):
	pass
