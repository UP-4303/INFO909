class_name Health
extends Node

@export
var max_health = 10

@export
var invincibility_duration = 0.1

var current_health: int

signal get_healed(new_health: int)
signal take_damage(new_health: int)
signal die()


var _is_invincible = false
var _time = 0

func damage(value: int) -> void :
	if _is_invincible :
		return
		
	current_health -= value
	current_health = clamp(current_health, 0, max_health)
	_is_invincible = true
	
	take_damage.emit(current_health)
	if current_health == 0 :
		die.emit()
	
func heal(value: int) -> void :
	current_health += value
	current_health = clamp(current_health, 0, max_health)
	
	get_healed.emit(current_health)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health
	
func _process(delta: float) -> void:
	if _is_invincible :
		_time += delta
		if _time >= invincibility_duration :
			_is_invincible = false
			_time = 0
