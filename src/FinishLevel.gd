extends Node

signal player_hit_finish()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterMovement :
		var character_movement = body as CharacterMovement
		if character_movement.type == CharacterMovement.TypeEnum.PLAYER :
			player_hit_finish.emit()
