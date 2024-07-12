extends Node2D

enum InteractType {ITEM, DIALOGUE, OTHER}

var gc

var targetItem = null

func _ready():
	gc = get_node("/root/main/GameController")

func _process(delta):
	if (Input.is_action_just_pressed("action")):
		if (targetItem):
			targetItem.get_parent().action()

func _physics_process(delta):
	var small = 0.0001
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	# If keys pressed, rotate to face that direction
	if (input_direction.length() > small):
		var rad = atan2(input_direction.y, input_direction.x)
		set_rotation(rad)

	targetItem = $RayCast2D.get_collider()
