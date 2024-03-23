class_name Bullet extends Node3D

const AttackTypes = preload("res://scripts/attack_types.gd")

@export var damage: int = 1
@export var bullet_type: AttackTypes.TYPES
@export var speed: float

@onready var model: MeshInstance3D = $Model

var shot_direction: Vector3i

#region Godot Lifecycle

func _process(delta):
	position = position + (shot_direction * speed * delta)
	

#endregion

#region Public API

func setup(color: Color, direction: Vector3i):
	if (model == null):
		model = $Model
	
	_change_bullet_color(color)
	_set_direction(direction)
	

func set_type(type: AttackTypes.TYPES):
	bullet_type = type
	
 
func set_damage(damage: int):
	self.damage = damage
	

func get_damage() -> int:
	return damage
	

func get_attack_type() -> AttackTypes.TYPES:
	return bullet_type

#endregion

#region Implementation

func _change_bullet_color(color: Color):
	var material = model.get_active_material(0)
	material.set_shader_parameter("albedo", color)
	
	model.material_override = material
	

func _set_direction(direction: Vector3i):
	shot_direction = direction
	

#endregion

#region Listeners

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
	

#endregion
