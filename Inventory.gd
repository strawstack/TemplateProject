extends CanvasLayer

var slots
var items = {}

func _ready():
	visible = false
	slots = $GridContainer.get_children()

func add(itemRef):
	var count = 0
	for slot in slots:
		if not slot.get_texture():
			slot.set_texture(itemRef.get_texture())
			items[itemRef.name] = {
				"slot": count,
				"ref": itemRef
			}
			break
		count += 1

func remove(itemRef):
	var itemName = itemRef.name
	var slotIndex = null
	var returnItemRef = null 
	if (itemName in items): 
		slotIndex = items[itemName]["slot"]
		returnItemRef = items[itemName]["ref"]
	slots[slotIndex].set_texture(null)
	items.erase(itemName)
	return returnItemRef

func contains(itemName):
	return itemName in items

func _process(delta):
	if (Input.is_action_just_pressed("inventory")):
		visible = not visible
