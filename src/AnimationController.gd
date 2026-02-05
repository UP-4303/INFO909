class_name AnimationController
extends AnimatedSprite2D

@export var health : Health
@export var character_controller : CharacterMovement

const ANIM_IDLE = "idle"
const ANIM_RUN = "run"


func _ready() -> void:
	if health:
		if health.has_signal("damage_taken"):
			health.damage_taken.connect(_on_damage_taken)
	animation_finished.connect(_on_animation_finished)

func _process(delta: float) -> void:
	var velocity : Vector2 = character_controller.velocity
	
	if velocity.x != 0:
		flip_h = velocity.x < 0
		
	if velocity.length() > 0:
		play(ANIM_RUN)
	else:
		play(ANIM_IDLE)

func _on_damage_taken(amount: int) -> void:
	pass

func _on_animation_finished() -> void:
		play(ANIM_IDLE)
