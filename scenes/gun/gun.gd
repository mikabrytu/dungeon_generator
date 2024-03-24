extends Node3D

const AttackTypes = preload("res://scripts/attack_types.gd")

@export var bullet_scene: PackedScene
@export var emission_material: ShaderMaterial

@onready var spawn_marker: Marker3D = $Marker3D

var type: AttackTypes.TYPES
var color: Color

#region Godot Lifecycle

func _ready():
	_switch_shot(AttackTypes.TYPES.BLUE)
	

func _process(_delta):
	if (Input.is_action_just_pressed("fire_gun")):
		_spawn_bullet()
	
	if (Input.is_action_just_pressed("switch_shot_1")):
		_switch_shot(AttackTypes.TYPES.BLUE)
	
	if (Input.is_action_just_pressed("switch_shot_2")):
		_switch_shot(AttackTypes.TYPES.GREEN)
	
	if (Input.is_action_just_pressed("switch_shot_3")):
		_switch_shot(AttackTypes.TYPES.RED)
	

#endregion

#region Implementation

func _spawn_bullet():
	var diretion = -get_parent().global_transform.basis.z.normalized()
	
	var bullet = bullet_scene.instantiate() as Bullet
	bullet.setup(color, diretion)
	bullet.set_type(type)
	bullet.position = spawn_marker.global_position
	
	get_tree().root.add_child(bullet)
	

func _switch_shot(type: AttackTypes.TYPES):
	self.type = type
	
	if (type == AttackTypes.TYPES.BLUE):
		color = Color.BLUE
	
	if (type == AttackTypes.TYPES.GREEN):
		color = Color.GREEN
	
	if (type == AttackTypes.TYPES.RED):
		color = Color.RED
	
	if (type == AttackTypes.TYPES.ALL):
		color = Color.WHITE
	
	if (type == AttackTypes.TYPES.NONE):
		color = Color.BLACK
	
	emission_material.set_shader_parameter("albedo", color)
	

#endregion
