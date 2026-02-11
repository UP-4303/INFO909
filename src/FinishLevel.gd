class_name FinishLevel
extends Node

signal player_hit_finish()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterMovement :
		var character_movement = body as CharacterMovement
		print(character_movement.type, CharacterMovement.TypeEnum.PLAYER, character_movement.type == CharacterMovement.TypeEnum.PLAYER)
		if character_movement.type == CharacterMovement.TypeEnum.PLAYER :
			player_hit_finish.emit()
