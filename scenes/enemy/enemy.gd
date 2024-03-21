extends Actor

func _move():
	position = position + Vector3.BACK
	

func can_act():
	_move()
