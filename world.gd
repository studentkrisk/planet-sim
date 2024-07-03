@tool
extends Node3D

var G = 0.1
func _physics_process(delta):
	if Engine.is_editor_hint():
		var positions = []
		var planets = $planets.duplicate()
		for i in range(20):
			for body : RigidBody3D in planets.get_children():
				for other_body : RigidBody3D in planets.get_children():
					if body == other_body:
						continue
					body.linear_velocity += 0.1/body.mass*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared()
					body.position += body.linear_velocity*0.1
			positions.append(planets.duplicate())
		for i in range(len($planets.get_children())):
			$planets.get_child(i).set_meta("simpos", [i, positions])
	else:
		for body : RigidBody3D in $planets.get_children():
			for other_body : RigidBody3D in $planets.get_children():
				if body == other_body:
					continue
				body.apply_central_force(delta*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared())
				#print(delta*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared())
