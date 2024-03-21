extends Node3D

class_name Actor

@export var priority: int = 1


func get_priority() -> int:
	return priority
	

func can_act():
	pass
