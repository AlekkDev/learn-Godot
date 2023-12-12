extends LevelParent

#var outside_level_scene: PackedScene = preload("res://scenes/levels/outside.tscn")

	
func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
	#get_tree().change_scene_to_packed(outside_level_scene)


func _on_exit_gate_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	call_deferred("change_scene", "res://scenes/levels/outside.tscn")
