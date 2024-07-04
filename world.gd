extends Node3D

var editor_mode = false
var G = 1

func _physics_process(delta):
	if Input.is_action_just_pressed("edit"):
		editor_mode = not editor_mode
	for body : RigidBody3D in $planets.get_children():
		for other_body : RigidBody3D in $planets.get_children():
			if body == other_body:
				continue
			body.apply_central_force(delta*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared())
			#print(delta*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared())
