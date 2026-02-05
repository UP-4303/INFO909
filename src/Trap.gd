class_name Trap
extends Area2D


@export
var damage = 2




func _process(delta: float) -> void:
	for body in get_overlapping_bodies() :
		if body is CharacterMovement :
			for child in body.get_children() :
				if child is Health :
					var health = child as Health
					health.damage(damage)
