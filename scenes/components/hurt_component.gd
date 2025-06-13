class_name HurtComponent
extends Area2D

@export var tool: DataTypes.Tools = DataTypes.Tools.None

signal hurt



func _on_area_entered(area: Area2D) -> void:
	var hit_componnent = area as HitComponent
	
	if tool == hit_componnent.current_tool:
		hurt.emit(hit_componnent.hit_damage)
