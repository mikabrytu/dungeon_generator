extends Node3D

@export var bullet_scene: PackedScene

@onready var spawn_marker: Marker3D = $Marker3D

#region Godot Lifecycle

func _process(_delta):
	if (Input.is_action_just_pressed("fire_gun")):
		var diretion = -get_parent().global_transform.basis.z.normalized()
		
		var bullet = bullet_scene.instantiate() as Bullet
		bullet.setup(Color.RED, diretion)
		bullet.position = spawn_marker.global_position
		
		get_tree().root.add_child(bullet)
	

#endregion
