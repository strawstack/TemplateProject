extends Sprite2D

enum InteractType {ITEM, DIALOGUE, OTHER}

@export var type: InteractType

# Dialogue file used if interaction is DIALOGUE type
@export var dialogueFile: Resource

# State that must be true for action to trigger
@export var inState: Array[String]

# Items that must be in inventory for action to trigger
@export var inItems: Array[Node2D]

# State that will be set to true, false, or toggle on action 
@export var stateTrue: Array[String]
@export var stateFalse: Array[String]
@export var stateToggle: Array[String]

# Items placed in inventory on action
@export var outItems: Array[Node2D]

var gc

func _ready():
	gc = get_node("/root/main/GameController")

func action():
	if type == InteractType.DIALOGUE:
		gc.beginDialogue(dialogueFile.data)

	elif type == InteractType.ITEM:
		if visible and type == InteractType.ITEM:
				visible = false
				if inStateValid(inState) and inItemsValid(inItems):
					setState(stateTrue, true)
					setState(stateFalse, false)
					toggleState(stateToggle)
					giveItems(outItems)

func inStateValid(inState):
	pass

func inItemsValid(inItems):
	pass

func setState(stateNames, value):
	pass

func toggleState(stateNames):
	pass

func giveItems(outItems):
	pass
