extends RayCast2D

var collider = null
func _physics_process(delta):
	collider = get_collider()
