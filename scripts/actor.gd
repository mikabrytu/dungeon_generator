class_name Actor extends Node3D

const AttackTypes = preload("res://scripts/attack_types.gd")

@export var priority: int = 1
@export var weakness: AttackTypes.TYPES

@onready var collision_area: Area3D = $Area3D

signal actor_finished

#region Godot Lifecycle

func _ready():
	collision_area.body_entered.connect(_on_body_entered)

#endregion

#region Public API

func get_priority() -> int:
	return priority
	

func can_act():
	pass

#endregion

#region Listeners

func _on_body_entered(body: Node3D):
	print(body.name + " is hitting " + self.name)

#endregion
