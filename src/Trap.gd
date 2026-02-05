class_name Trap
extends Area2D


@export
var damage = 2

@export
var exclude_types: Array[CharacterMovement.TypeEnum] = []


func _process(delta: float) -> void:
	for body in get_overlapping_bodies() :
		if body is CharacterMovement :
			var characterMovement = body as CharacterMovement
			if characterMovement.type in exclude_types :
				continue
				
			for child in characterMovement.get_children() :
				if child is Health :
					var health = child as Health
					health.damage(damage)
