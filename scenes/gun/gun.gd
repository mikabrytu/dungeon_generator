extends Node3D

@export var bullet_scene: PackedScene

@onready var spawn_marker: Marker3D = $Marker3D

#region Godot Lifecycle

func _process(_delta):
	if (Input.is_action_just_pressed("fire_gun")):
		var bullet = bullet_scene.instantiate() as Bullet
		bullet.setup(Color.RED, Vector3i.FORWARD)
		bullet.position = spawn_marker.position
		
		add_child(bullet)
		bullet.reparent(get_tree().root)
	

#endregion
