extends Node3D

@export var enemie_scenes: Array[PackedScene]
@export var enemy_ratio: int
@export var enemy_count: int
@export var enemy_count_override: bool

var max_enemies: int

#region Godot Lifecycle

func _ready():
	_set_max_enemies()
	_spawn_enemies()
	

#endregion

#region Implementation

func _set_max_enemies():
	var map_size = Provider.get_map_size()
	var max = (map_size.x * map_size.y) / enemy_ratio
	
	max_enemies = enemy_count if enemy_count_override else max
	

func _spawn_enemies():
	for i in max_enemies:
		var coord = Provider.get_random_empty_tile()
		var enemy = enemie_scenes.pick_random().instantiate()
		enemy.position = Vector3(coord.x, 0, coord.y)
		add_child(enemy)
	

#endregion
