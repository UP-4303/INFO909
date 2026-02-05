class_name HealthBar
extends HBoxContainer

@export var HP_indicator_prefab : PackedScene
@export var health : Health

func init_bar(nb_HP : int) -> void:
	if HP_indicator_prefab == null:
		printerr("ERROR : HP_indicator_prefab is not assigned !")
		return
	for i in range(nb_HP):
		add_heart()

func add_heart() -> void:
	var new_indicator = HP_indicator_prefab.instantiate()
	print("create")
	add_child(new_indicator)

func remove_heart() -> void:
	var count = get_child_count()
	if count > 0:
		var last_child = get_child(count - 1)
		last_child.queue_free()
		remove_child(last_child) 

func update_health(target_HP : int) -> void:
	target_HP = clampi(target_HP, 0, health.max_health)	
	var current_child_count = get_child_count()
	while current_child_count > target_HP:
		remove_heart()
		current_child_count -= 1
	while current_child_count < target_HP:
		add_heart()
		current_child_count += 1

func _ready() -> void:
	if (not health):
		printerr("ERROR : Health is not assigned on hp_bar")
		return
	init_bar(health.max_health)
