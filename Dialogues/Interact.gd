extends Sprite2D

enum InteractType {ITEM, DIALOGUE, OTHER}

@export var type: InteractType

@export var dialogueFile: Resource

@export var requiredItems: Array[Node2D]

var gc

func _ready():
	gc = get_node("/root/main/GameController")

func action():
	if type == InteractType.DIALOGUE:
		gc.beginDialogue(dialogueFile.data)

	elif type == InteractType.ITEM:
		if visible and type == InteractType.ITEM:
				visible = false
				gc.addItem(self)
