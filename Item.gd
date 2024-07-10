extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_texture():
	return $Sprite2D.get_texture()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
