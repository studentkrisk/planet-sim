extends RigidBody3D


# Called when the node enters the scene tree for the first time.
var inship = true

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		$Camera3D.rotation.x -= 0.001*event.relative.y
		$Camera3D.rotation.y -= 0.001*event.relative.x
		$Camera3D.rotation.x = clamp(-PI/2, $Camera3D.rotation.x, PI/2)
		angular_velocity = Vector3.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_key_pressed(KEY_Q):
		inship = false
	else:
		inship = true
	if inship:
		print(linear_velocity)
		Engine.time_scale = 5 if Input.is_key_pressed(KEY_T) else 1
		if Input.is_key_pressed(KEY_R): linear_velocity = Vector3.ZERO
		apply_central_force(-1000*$Camera3D.get_global_transform().basis.z*Input.get_axis("back", "fore"))
		apply_central_force(1000*$Camera3D.get_global_transform().basis.x*Input.get_axis("left", "right"))
		apply_central_force(1000*$Camera3D.get_global_transform().basis.y*Input.get_axis("down", "up"))
	else:
		Engine.time_scale = 5 if Input.is_key_pressed(KEY_T) else 1
		if Input.is_key_pressed(KEY_R): linear_velocity = Vector3.ZERO
		apply_central_force(-10*$Camera3D.get_global_transform().basis.z.normalized()*Input.get_axis("back", "fore"))
		apply_central_force(10*$Camera3D.get_global_transform().basis.x.normalized()*Input.get_axis("left", "right"))
		var min = $"../.".get_child(0)
		for i in $"../.".get_children():
			if i == self:
				continue
			if i.mass/(i.position - position).length_squared() > min.mass/(min.position - position).length_squared():
				min = i
		look_at(min.position, global_transform.basis.z)
		#$Camera3D.look_at(min.position, -global_transform.basis.z)
