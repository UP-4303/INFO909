class_name Trap
extends Node


@export
var damage = 2


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterMovement :
		for child in body.get_children() :
			if child is Health :
				var health = child as Health
				health.damage(damage)
