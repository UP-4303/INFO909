class_name MonsterController
extends Node

@export
var _characterMovement: CharacterMovement

@export
var _distance = 100


@export
var stopped = false

var _on_return = false
var _current_distance = 0


func stop() :
	stopped = true

func start() :
	stopped = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stopped :
		return
			
	if _on_return :
		_characterMovement.move_right()
	else :
		_characterMovement.move_left()

	_current_distance += delta * _characterMovement.speed
	
	if _current_distance >= _distance :
		_on_return = !_on_return
		_current_distance = 0
	
