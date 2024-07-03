extends EditorNode3DGizmoPlugin


func _init():
	create_material("main", Color(1,0,0))
	create_handle_material("handles")


func _has_gizmo(node):
	return node is RigidBody3D


func _redraw(gizmo):
	gizmo.clear()
	var node3d : RigidBody3D = gizmo.get_node_3d()
	var lines = PackedVector3Array([Vector3(2, 1, 3), Vector3.ZERO])
	var material : StandardMaterial3D = StandardMaterial3D.new()
	material.albedo_color = Color.GREEN
	gizmo.add_lines(lines, material, false)


# You should implement the rest of handle-related callbacks
# (_get_handle_name(), _get_handle_value(), _commit_handle(), ...).
