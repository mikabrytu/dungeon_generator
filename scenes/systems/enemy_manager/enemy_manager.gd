extends Node3D

@export var enemie_scenes: Array[PackedScene]
@export var enemy_count: int

#region Godot Lifecycle

func _ready():
	_spawn_enemies()
	

#endregion

#region Implementation

func _spawn_enemies():
	for i in enemy_count:
		var coord = Provider.get_random_empty_tile()
		var enemy = enemie_scenes.pick_random().instantiate()
		enemy.position = Vector3(coord.x, 0, coord.y)
		add_child(enemy)
	

#endregion
