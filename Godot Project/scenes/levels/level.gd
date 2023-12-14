extends Node2D

class_name LevelParent

var laser_scene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene = preload("res://scenes/projectiles/grenade.tscn")



	


func _on_player_grenade(pos,direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()
	


func _on_player_laser(pos,direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle())
	laser.direction = direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()
	


func _on_house_player_entered_house():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	#tween.tween_property($Player,"modulate:a",0,2).from(0.5)
	tween.tween_property($Player/Camera2D,"zoom", Vector2(1,1),1)


func _on_house_player_exited_house():
	var tween2 = get_tree().create_tween()
	
	tween2.tween_property($Player/Camera2D,"zoom", Vector2(0.6,0.6),2)
