extends Node2D

@export var inventory: CanvasLayer
@export var textBox: Node2D

var state = {}

func _ready():
	initState()

func initState():
	state['isUnlocked'] = false
	state['complete'] = false

func toggleState(name):
	state[name] = not state[name]

func setState(name, value):
	state[name] = value
	print("Set: ", name, " ", value)

func getState(name):
	return state[name]

func addItem(itemRef):
	print("Get: ", itemRef.name)
	inventory.add(itemRef)

func removeItem(itemRef):
	print("Remove: ", itemRef.name)
	inventory.remove(itemRef)

func beginDialogue(json):
	textBox.beginDialogue(json)

func _process(delta):
	pass
