extends Node3D

@export var size: Vector2i
@export var tile_scene: PackedScene

func _ready():
	_set_map()
	

func _set_map():
	_recenter_map()
	_create_path()
	

func _recenter_map():
	var map_x = (size.x / 2) * -1
	var map_y = (size.y / 2) * -1
	var map_position = Vector3i(map_x, 0, map_y)
	
	self.position = map_position
	

func _create_path():
	print("Calc new path to end level")
	pass
	

func _fill(coord: Vector2i):
	var position = Vector3i(coord.x, 0, coord.y)
	
	var tile = tile_scene.instantiate()
	add_child(tile)
	tile.position = position
	
