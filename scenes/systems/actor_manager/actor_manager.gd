extends Node3D

@onready var next_turn_delay: Timer = $"Next Turn Delay"

var actors: Array[Actor]
var current_index: int = 0

#region Godot Lifecycle

func _ready():
	next_turn_delay.timeout.connect(_on_delay_timeout)
	
	_get_actors()
	_call_next_actor()
	

#endregion

#region Implementation

func _get_actors():
	var nodes = get_tree().get_nodes_in_group("actors")
	
	for node in nodes:
		var actor = node as Actor
		actor.actor_finished.connect(_on_actor_finished)
		
		actors.append(actor)
	
	actors.sort_custom(func(a, b): return a.priority < b.priority)
	print(actors)
	

func _call_next_actor():
	if (current_index >= actors.size()):
		current_index = 0
	
	actors[current_index].can_act()
	current_index = current_index + 1
	

#endregion

#region Listeners

func _on_actor_finished():
	next_turn_delay.start()
	

func _on_delay_timeout():
	_call_next_actor()

#endregion
