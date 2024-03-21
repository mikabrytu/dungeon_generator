class_name Actor extends Node3D

@export var priority: int = 1

signal actor_finished

#region Public API

func get_priority() -> int:
	return priority
	

func can_act():
	pass

#endregion
