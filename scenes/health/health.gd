class_name Health extends Node3D

@export var max_health: int

var current_health: int

signal dead

#region Godot Lifecycle

func _ready():
	current_health = max_health
	

#endregion

#region Public API

func damage(amount: int):
	current_health = current_health - amount
	_check_if_dead()
	

func heal(amount: int):
	current_health = current_health + amount
	

func get_current_health() -> int:
	return current_health
	

func get_max_health() -> int:
	return max_health
	

#endregion

#region Implementation

func _check_if_dead():
	if (current_health <= 0):
		_die()
	

func _die():
	dead.emit()
	

#endregion
