extends Node

class_name Interactable

@export var requiredItems: Array

# Returns the type interactable type
func type():
	return null

# Called by action
# Game state precondition
# Returns true if valid
func precondition():
	return true

# Called externally
# Performs action based on precondition
func action():
	pass
