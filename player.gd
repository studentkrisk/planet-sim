extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		print(event)
		$Camera3D.rotation.x -= 0.001*event.relative.y
		$Camera3D.rotation.y -= 0.001*event.relative.x
		$Camera3D.rotation.x = clamp(-PI/2, $Camera3D.rotation.x, PI/2)
		angular_velocity = Vector3.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	print(linear_velocity)
	apply_central_force(-1000*$Camera3D.get_global_transform().basis.z*(Vector3.ONE - Vector3.UP)*Input.get_axis("back", "fore"))
	apply_central_force(1000*$Camera3D.get_global_transform().basis.x*(Vector3.ONE - Vector3.UP)*Input.get_axis("left", "right"))
	apply_central_force(1000*Vector3.UP*Input.get_axis("down", "up"))
