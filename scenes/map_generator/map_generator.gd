extends Node3D

@export var size: Vector2i
@export var tile_scene: PackedScene
@export_category("Algorithm Parameters")
@export var max_carv_attempts: int
@export var wall_count_divider: float

var walls: Array[Vector2i] = []
var wall_count: int
var carv_attempts: int = 0

#region Godot Lifecycle

func _ready():
	_set_map()
	

#endregion

#region Implementation

func _set_map():
	_recenter_map()
	_set_wall_count()
	_carv_dungeon()
	_set_boundaries()
	

func _set_wall_count():
	wall_count = (size.x * size.y) / wall_count_divider
	

func _carv_dungeon():
	var stop: bool = false
	
	while (!stop):
		if (walls.size() >= wall_count):
			stop = true
			continue
		
		var x = randi_range(0, size.x - 1)
		var y = randi_range(0, size.y - 1)
		var coord = Vector2i(x, y)
		
		if (!_try_to_add(coord)):
			if (carv_attempts == max_carv_attempts):
				stop = true
			else:
				var neighbor = _get_empty_neighbor(coord)
				if (neighbor == (Vector2i.ONE * -1)):
					carv_attempts += 1
				else:
					_try_to_add(coord)
	
	print("Map is generated with " + str(walls.size()) + " walls")
	

func _set_boundaries():
	for x in size.x:
		_fill(Vector2i(x, -1))
		_fill(Vector2i(x, size.y))
	
	for y in size.y:
		_fill(Vector2i(-1, y))
		_fill(Vector2i(size.x, y))
	

func _try_to_add(coord: Vector2i) -> bool:
	if (walls.find(coord) == -1):
		walls.append(coord)
		_fill(coord)
		return true
	
	return false
	

func _get_empty_neighbor(coord: Vector2i) -> Vector2i:
	var empty = Vector2i(-1, -1)
	var neighbours = [
		Vector2i(coord.x, coord.y + 1), 
		Vector2i(coord.x, coord.y - 1), 
		Vector2i(coord.x - 1, coord.y), 
		Vector2i(coord.x + 1, coord.y)
	]
	
	for n in neighbours:
		if (_is_coord_valid(n) && walls.find(n) == -1):
			return n
	
	return empty
	

func _is_coord_valid(coord: Vector2i) -> bool:
	return coord.x > 0 && coord.x < size.x - 1 && coord.y > 0 && coord.y < size.y - 1
	

func _recenter_map():
	var map_x = (size.x / 2) * -1
	var map_y = (size.y / 2) * -1
	var map_position = Vector3i(map_x, 0, map_y)
	
	self.position = map_position
	

func _fill(coord: Vector2i):
	var position = Vector3i(coord.x, 0, coord.y)
	
	var tile = tile_scene.instantiate()
	add_child(tile)
	tile.position = position
	

#endregion
