class_name FielCursorComponent
extends Node


@export var grass_tilemap_layer: TileMapLayer
@export var tilled_soil_tilemap_layer: TileMapLayer
@export var terrain_set: int = 0 
@export var terrain: int = 3 

var player: Player

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
			remove_tilled_soil_cell()
		
	elif event.is_action_pressed("hit"):
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse() 
			add_tilled_soil_cell()


func get_cell_under_mouse() -> void:
	mouse_position = grass_tilemap_layer.get_local_mouse_position()
	cell_positon = grass_tilemap_layer.local_to_map(mouse_position)
	cell_source_id = grass_tilemap_layer.get_cell_source_id(cell_positon)
	local_cell_position = grass_tilemap_layer.map_to_local(cell_positon)
	distane = player.global_position.distance_to(local_cell_position)
	

func add_tilled_soil_cell() -> void:
	if distane < 20.0 && cell_source_id != -1 :
		tilled_soil_tilemap_layer.set_cells_terrain_connect([cell_positon], terrain_set, terrain, true)
		
	
	
	

func remove_tilled_soil_cell() -> void:
	if distane < 20.0 :
		tilled_soil_tilemap_layer.set_cells_terrain_connect([cell_positon], 0, -1, true)
	
