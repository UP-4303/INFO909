class_name Health
extends Node

@export
var max_health = 10

var current_health: int

signal get_healed(new_health: int)
signal take_damage(new_health: int)
signal die()


func damage(value: int) -> void :
	current_health -= value
	current_health = clamp(current_health, 0, max_health)
	
	take_damage.emit(current_health)
	if current_health == 0 :
		die.emit()
	print(current_health)
	
func heal(value: int) -> void :
	current_health += value
	current_health = clamp(current_health, 0, max_health)
	
	get_healed.emit(current_health)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health
