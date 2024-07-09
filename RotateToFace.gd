extends Sprite2D

func _physics_process(delta):
	var small = 0.0001
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if (input_direction.length() > small):
		var rad = atan2(input_direction.y, input_direction.x)
		set_rotation(rad)
