extends Area2D

func _on_area_entered(area):
	area.get_parent().action()
