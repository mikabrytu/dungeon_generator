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
	var start_tile = Vector2i(randi_range(0, size.x - 1), 0)
	var end_tile = Vector2i(randi_range(0, size.x - 1), size.y -1)
	
	_fill(start_tile, Color.GREEN)
	_fill(end_tile, Color.RED)
	
	var current_coord = start_tile
	var axis = randi_range(0, 1)
	
	while current_coord != end_tile:
		var destination = end_tile.x if axis == 0 else end_tile.y
		var current = current_coord.x if axis == 0 else current_coord.y
		var remaining = destination - current
		var direction = 1 if remaining > 0 else -1
		
		if (remaining == 0):
			axis = 1 if axis == 0 else 0
			continue
		
		if axis == 0:
			current_coord.x += direction
		elif axis ==  1:
			current_coord.y += direction
		
		if (current_coord != end_tile):
			_fill(current_coord, Color.BLUE)
	

func _fill(coord: Vector2i, color: Color = Color.WHITE):
	var position = Vector3i(coord.x, 0, coord.y)
	
	var tile = tile_scene.instantiate()
	add_child(tile)
	tile.position = position
	
	if (color != Color.WHITE):
		var material = StandardMaterial3D.new()
		material.albedo_color = color
		
		tile.get_node("Model").set_material(material)
	
