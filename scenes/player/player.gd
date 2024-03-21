extends Actor

@export var tween_duration: float

var can_move: bool = false
var is_moving: bool = false

#region Godot Lifecycle

func _process(delta):
	if (!can_move):
		return
	
	if (is_moving):
		return
	
	_check_move()
	_check_rotate()
	

#endregion

#region Implementation

func _check_move():
	var direction = Vector3.ZERO
	if (Input.is_action_just_pressed("forward")):
		direction = -self.transform.basis.z.normalized()
	if (Input.is_action_just_pressed("back")):
		direction = self.transform.basis.z.normalized()
	if (Input.is_action_just_pressed("left")):
		direction = -self.transform.basis.x.normalized()
	if (Input.is_action_just_pressed("right")):
		direction = self.transform.basis.x.normalized()
	
	if (direction == Vector3.ZERO):
		return
	
	is_moving = true
	
	var position = self.position + direction
	create_tween() \
	.tween_property(self, "position", position, tween_duration) \
	.finished \
	.connect(_on_tween_finished)
	

func _check_rotate():
	var axis = 0
	if (Input.is_action_just_pressed("rotate_left")):
		axis = 90
	if (Input.is_action_just_pressed("rotate_right")):
		axis = -90
	
	if (axis == 0):
		return
	
	is_moving = true
	
	var angle = self.rotation_degrees + (Vector3.UP * axis)
	create_tween() \
	.tween_property(self, "rotation_degrees", angle, tween_duration) \
	.finished \
	.connect(_on_tween_finished)
	

#endregion

#region Actor Override

func can_act():
	can_move = true
	

#endregion

#region Listeners

func _on_tween_finished():
	is_moving = false
	can_move = false
	
	actor_finished.emit()

#endregion
