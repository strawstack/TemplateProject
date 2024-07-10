extends Node2D

@export var dialogueFile: Resource

func _on_body_entered(body):
	get_parent().beginDialogue(dialogueFile.data)
