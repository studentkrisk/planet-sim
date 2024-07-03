@tool
extends Node3D

var G = 0.1
var bodies = []

func _physics_process(delta):
	if Engine.is_editor_hint():
		#PhysicsServer3D.set_active(true)
		#var planets = $planets.duplicate()
		#for i in planets.get_children():
			#i.set_meta("simpos", [])
		#for i in range(10):
			#for body : RigidBody3D in planets.get_children():
				#for other_body : RigidBody3D in planets.get_children():
					#if body == other_body:
						#continue
					#body.set_meta("simpos", body.get_meta("simpos") + [body.position])
					#body.position += (other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared()
		#print(planets.get_child(0).get_meta("simpos"))
	else:
		for body : RigidBody3D in $planets.get_children():
			for other_body : RigidBody3D in $planets.get_children():
				if body == other_body:
					continue
				body.apply_central_force(delta*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared())
				#print(delta*(other_body.position - body.position).normalized()*G*body.mass*other_body.mass/(other_body.position - body.position).length_squared())
