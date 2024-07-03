# MyCustomEditorPlugin.gd
@tool
extends EditorPlugin


const gizmo = preload("res://addons/gravity-gizmo/gizmo.gd")

var gizmo_plugin = gizmo.new()


func _enter_tree():
	add_node_3d_gizmo_plugin(gizmo_plugin)


func _exit_tree():
	remove_node_3d_gizmo_plugin(gizmo_plugin)
