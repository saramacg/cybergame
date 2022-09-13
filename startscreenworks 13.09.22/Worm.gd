extends RigidBody

func _physics_process(delta):
	set_linear_velocity(Vector3(50,0,0) * delta)
