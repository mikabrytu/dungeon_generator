extends Camera3D

func _ready():
	var map_size = Provider.get_map_size()
	var map_x = (map_size.x / 2)
	var map_y = (map_size.y / 2)
	var map_position = Vector3i(map_x, self.position.y, map_y)
	
	self.position = map_position
	
