class_name HealthBar
extends HBoxContainer

@export var HP_indicator_prefab : PackedScene
@export var max_HP : int = 10 
@export var current_HP : int = max_HP
@export var HP_container : HBoxContainer

func init_bar(nb_HP : int) -> void:
	#var children : TextureRect[] = HPContainer.get_children()
	if HP_indicator_prefab == null:
		printerr("ERREUR : HP_indicator_prefab n'est pas assigné dans l'inspecteur !")
		return

	if HP_container == null:
		if self is HBoxContainer:
			HP_container = self
	else:
		printerr("ERREUR : HP_container manquant !")
		return
	for i in range(nb_HP):
		var new_indicator = HP_indicator_prefab.instantiate()
		HP_container.add_child(new_indicator)

func _ready() -> void:
	init_bar(max_HP)
