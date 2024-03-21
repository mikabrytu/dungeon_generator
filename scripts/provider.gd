extends Node

var map_generator: MapGenerator

func _ready():
	map_generator = get_tree().root.get_node("/root/Main/MapGenerator")
	

func get_map_size() -> Vector2i:
	return map_generator.get_map_size()

func get_random_empty_tile() -> Vector2i:
	return map_generator.get_random_empty_tile()

func is_coord_wall(coord: Vector2i) -> bool:
	return map_generator.is_coord_wall(coord)
	
