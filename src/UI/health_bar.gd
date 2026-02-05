class_name HealthBar
extends HBoxContainer

@export var HP_indicator_prefab : PackedScene
@export var max_HP : int = 10 
@export var HP_container : HBoxContainer

var current_hp_internal : int 

func init_bar(nb_HP : int) -> void:
	if HP_indicator_prefab == null:
		printerr("ERREUR : HP_indicator_prefab is not assigned !")
		return

	if HP_container == null:
		if self is HBoxContainer:
			HP_container = self
		else:
			printerr("ERREUR : HP_container missing !")
			return
			
	for child in HP_container.get_children():
		child.queue_free()
		
	for i in range(nb_HP):
		add_heart()
		
	current_hp_internal = nb_HP

func add_heart() -> void:
	var new_indicator = HP_indicator_prefab.instantiate()
	HP_container.add_child(new_indicator)

func remove_heart() -> void:
	var count = HP_container.get_child_count()
	if count > 0:
		var last_child = HP_container.get_child(count - 1)
		last_child.queue_free()
		HP_container.remove_child(last_child) 

func update_health(target_HP : int) -> void:
	target_HP = clampi(target_HP, 0, max_HP)
	
	var current_child_count = HP_container.get_child_count()
	
	while current_child_count > target_HP:
		remove_heart()
		current_child_count -= 1
		
	while current_child_count < target_HP:
		add_heart()
		current_child_count += 1

func set_max_HP(new_max : int) -> void:
	max_HP = new_max
	if HP_container.get_child_count() > max_HP:
		update_health(max_HP)

func _ready() -> void:
	init_bar(max_HP)
