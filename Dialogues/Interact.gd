extends Sprite2D

enum InteractType {ITEM, DIALOGUE, OTHER}

@export var type: InteractType

# Dialogue file used if interaction is DIALOGUE type
@export var dialogueFile: Resource

# If this item itself is given to player on success
@export var giveSelf: bool

# State that must be true/false for action to trigger
@export var inStateTrue: Array[String]
@export var inStateFalse: Array[String]

@export var consumeInItems: bool

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
		if visible and type == InteractType.ITEM and inStateValid(inStateTrue, inStateFalse) and inItemsValid(inItems):

			setState(stateTrue, true)
			setState(stateFalse, false)
			toggleState(stateToggle)

			# Optional: Remove inItems from inventory
			if consumeInItems:
				for itemRef in inItems:
					gc.removeItem(itemRef)

			# Give interaction target to player
			if giveSelf:
				visible = false
				gc.addItem(self)

			giveItems(outItems)

func inStateValid(inStateTrue, inStateFalse):
	for name in inStateTrue:
		if not gc.getState(name):
			return false
	for name in inStateFalse:
		if gc.getState(name):
			return false
	return true

func inItemsValid(inItems):
	for itemRef in inItems:
		var name = itemRef.name
		if not gc.inventory.contains(name):
			return false
	return true

func setState(stateNames, value):
	for name in stateNames:
		gc.setState(name, value)

func toggleState(stateNames):
	for name in stateNames:
		gc.toggleState(name)

func giveItems(outItems):
	for itemRef in outItems:
		gc.addItem(itemRef)
