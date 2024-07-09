extends Node2D

@export var speed = 400

var root

func _ready():
	root = get_parent() # Movement script affects character root

func _process(delta):
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	root.velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	root.move_and_slide()
