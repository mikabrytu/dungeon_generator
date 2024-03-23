class_name Actor extends Node3D

const AttackTypes = preload("res://scripts/attack_types.gd")

@export var priority: int = 1
@export var weakness: AttackTypes.TYPES

@onready var collision_area: Area3D = $CollisionArea
@onready var health: Health = $Health

signal actor_finished

#region Godot Lifecycle

func _ready():
	collision_area.area_entered.connect(_on_area_entered)
	health.dead.connect(_on_actor_dead)
	

#endregion

#region Public API

func get_priority() -> int:
	return priority
	

func can_act():
	pass

#endregion

#region Implementaion

func _validate_hit():
	# Cast hit to proper class
	# Check for attack type and weakness
	# Damage by amount
	
	health.damage(1)
	

#endregion

#region Listeners

func _on_area_entered(area: Area3D):
	_validate_hit()
	

func _on_actor_dead():
	queue_free()
	

#endregion
