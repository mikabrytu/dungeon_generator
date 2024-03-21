extends Actor

#region Implementation

func _move():
	position = position + Vector3.BACK
	actor_finished.emit()
	

#endregion

#region Actor Override

func can_act():
	_move()

#endregion
