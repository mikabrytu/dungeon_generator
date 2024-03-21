extends Node3D

var actors: Array[Actor]
var current_index: int = 0

func _ready():
	_get_actors()
	

func _get_actors():
	var nodes = get_tree().get_nodes_in_group("actors")
	
	for node in nodes:
		actors.append(node as Actor)
	
	actors.sort_custom(_sort_actors)
	print(actors)
	

func _call_next_actor():
	if (current_index >= actors.size()):
		current_index = 0
	
	actors[current_index].can_act()
	current_index += 1
	

func _sort_actors(a, b):
	return a.priority < b.priority
