class_name Bullet extends Node3D

const AttackTypes = preload("res://scripts/attack_types.gd")

@export var damage: int = 1
@export var bullet_type: AttackTypes.TYPES

@onready var model: MeshInstance3D = $Model

#region Public API

func setup(color: Color):
	var material = StandardMaterial3D.new()
	material.albedo_color = color
	
	model.material_override = material

func get_damage() -> int:
	return damage
	

func get_attack_type() -> AttackTypes.TYPES:
	return bullet_type

#endregion
