extends Node3D

#region Godot Lifecycle

func _ready():
	_random_rotate()
	

#endregion

#region Implementation

func _random_rotate():
	var axis = [Vector3.UP, Vector3.RIGHT, Vector3.FORWARD]
	var angle = [90, 180, -90, -180]
	
	rotate(axis.pick_random(), deg_to_rad(angle.pick_random()))
	

#endregion
