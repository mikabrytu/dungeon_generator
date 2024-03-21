extends CSGSphere3D


func _move():
	position = position + Vector3.BACK


func _on_timer_timeout():
	_move()
