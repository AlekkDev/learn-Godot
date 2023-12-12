extends LevelParent


func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	call_deferred("change_scene", "res://scenes/levels/inside.tscn")
	
func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
