extends LevelParent


func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")
	#call_deferred("change_scene", "res://scenes/levels/inside.tscn")
	
func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
	
	


func _on_house_player_entered_house():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom", Vector2(1,1),1)


func _on_house_player_exited_house():
	var tween2 = get_tree().create_tween()
	tween2.tween_property($Player/Camera2D,"zoom", Vector2(0.6,0.6),2)
	
