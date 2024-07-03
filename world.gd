extends Node3D

var G = 0.1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body : RigidBody3D in $planets.get_children():
		for other_body : RigidBody3D in $planets.get_children():
			if body == other_body:
				continue
			body.apply_central_force(delta*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared())
			print(delta*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared())
