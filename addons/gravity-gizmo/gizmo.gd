extends EditorNode3DGizmoPlugin


func _init():
	create_material("main", Color(1,0,0))
	create_handle_material("handles")


func _has_gizmo(node):
	return node is RigidBody3D


func _redraw(gizmo):
	gizmo.clear()
	var node3d : RigidBody3D = gizmo.get_node_3d()
	var positions = node3d.get_meta("simpos")[1]
	var id = node3d.get_meta("simpos")[0]
	
	var material : StandardMaterial3D = StandardMaterial3D.new()
	material.albedo_color = Color.GREEN
	for i in range(len(positions)-1):
		print([positions[i].get_child(id).position - node3d.position, positions[i+1].get_child(id).position - node3d.position])
		gizmo.add_lines(PackedVector3Array([positions[i].get_child(id).position - node3d.position, positions[i+1].get_child(id).position - node3d.position]), material, false)
