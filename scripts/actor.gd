class_name Actor extends Node3D

const AttackTypes = preload("res://scripts/attack_types.gd")

@export var priority: int = 1
@export var weakness: AttackTypes.TYPES
@export var is_acting: bool = false

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

func _validate_hit(damage: int, type: AttackTypes.TYPES):
	if (weakness == AttackTypes.TYPES.NONE):
		return
	
	if (weakness == AttackTypes.TYPES.ALL || weakness == type):
		health.damage(damage)
	

#endregion

#region Listeners

func _on_area_entered(area: Area3D):
	if (area.get_parent().is_in_group("bullets")):
		var bullet = area.get_parent() as Bullet
		_validate_hit(bullet.get_damage(), bullet.get_attack_type())
	

func _on_actor_dead():
	queue_free()
	

#endregion
