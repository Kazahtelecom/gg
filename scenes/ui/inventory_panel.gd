extends PanelContainer

@onready var log_label: Label = $MarginContainer/VBoxContainer/Logs/LogLabel
@onready var stone_label: Label = $MarginContainer/VBoxContainer/stone/stoneLabel
@onready var corn_label: Label = $MarginContainer/VBoxContainer/corn/cornLabel
@onready var tomato_label: Label = $MarginContainer/VBoxContainer/tomato/tomatoLabel
@onready var egg_label: Label = $MarginContainer/VBoxContainer/egg/eggLabel
@onready var milk_label: Label = $MarginContainer/VBoxContainer/milk/milkLabel


func _ready() -> void:
	InventoryManagement.inventory_changed.connect(on_inventory_changed)

func on_inventory_changed() -> void:
	var inventory: Dictionary = InventoryManagement.inventory
	
	if inventory.has("log"):
		log_label.text = str(inventory["log"])
	
	if inventory.has("stone"):
		stone_label.text = str(inventory["stone"])
	
	if inventory.has("corn"):
		corn_label.text = str(inventory["corn"])
	
	if inventory.has("tomato"):
		tomato_label.text = str(inventory["tomato"])
	
	if inventory.has("egg"):
		egg_label.text = str(inventory["egg"])
	
	if inventory.has("milk"):
		milk_label.text = str(inventory["milk"])
	
