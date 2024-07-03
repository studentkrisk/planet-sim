# MyCustomEditorPlugin.gd
@tool
extends EditorPlugin


const MyCustomGizmoPlugin = preload("res://addons/gravity-gizmo/gizmo.gd")

var gizmo_plugin = MyCustomGizmoPlugin.new()


func _enter_tree():
	add_node_3d_gizmo_plugin(gizmo_plugin)


func _exit_tree():
	remove_node_3d_gizmo_plugin(gizmo_plugin)
