class_name SaveDataComponent
extends Node

@onready var parent_node: Node2D = get_parent() as Node2D

@export var ffg: Resource

func _ready() -> void:
	add_to_group("save_data_component")

func _save_data() -> Resource:
	if parent_node == null:
		return null

	if ffg == null:
		push_error("save_data_resource:", ffg, parent_node.name)
		return 
	
	ffg._save_data(parent_node)
	
	return ffg
