class_name CropsCursorComponent
extends Node


@export var tilled_soil_tilemap_layer: TileMapLayer


var player: Player

var corn_plant_scene = preload("res://scenes/objects/plants/corn.tscn")
var tomato_plant_scene = preload("res://scenes/objects/plants/tomota.tscn")

var mouse_position: Vector2
var cell_positon: Vector2i
var cell_source_id: int
var local_cell_position: Vector2
var distane: float


func _ready() -> void:
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_girt"):
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse()
			remove_crop()
		
	elif event.is_action_pressed("hit"):
		if ToolManager.selected_tool == DataTypes.Tools.PlantCorn or  ToolManager.selected_tool == DataTypes.Tools.PlantTomato:
			get_cell_under_mouse() 
			add_crop()



func get_cell_under_mouse() -> void:
	mouse_position = tilled_soil_tilemap_layer.get_local_mouse_position()
	cell_positon = tilled_soil_tilemap_layer.local_to_map(mouse_position)
	cell_source_id = tilled_soil_tilemap_layer.get_cell_source_id(cell_positon)
	local_cell_position = tilled_soil_tilemap_layer.map_to_local(cell_positon)
	distane = player.global_position.distance_to(local_cell_position)


func add_crop() -> void:
	if distane < 20.0:
		if ToolManager.selected_tool == DataTypes.Tools.PlantCorn:
			var corn_instance = corn_plant_scene.instantiate() as Node2D 
			corn_instance.global_position = local_cell_position
			get_parent().find_child("GropFields").add_child(corn_instance)
		
		
		if ToolManager.selected_tool == DataTypes.Tools.PlantTomato:
			var tomato_instane = tomato_plant_scene.instantiate() as Node2D 
			tomato_instane.global_position = local_cell_position
			get_parent().find_child("GropFields").add_child(tomato_instane)


func remove_crop() -> void:
	if distane < 20.0:
		var crop_nodes = get_parent().find_child("GropFields").get_children()
		
		for node: Node2D in crop_nodes:
			if node.global_position == local_cell_position:
				node.queue_free()
		
		
		
		
		
