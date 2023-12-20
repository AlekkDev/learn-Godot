extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var use_right_gun: bool = true
var health: int = 30
var immune: bool = false

signal laser(pos,direction)

func hit():
	if not immune:
		immune = not immune
		print("scout hit")
		health -= 10
		if health <= 0:
			queue_free()
		$ImmunityTimer.start()
			
			

func _process(_delta):
	
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var laser_marker = $LaserSpawnPositions.get_child(use_right_gun)
			use_right_gun = not use_right_gun
			var pos: Vector2 = laser_marker.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos,direction)
			can_laser = false
			$LaserCooldown.start()
		

func _on_attack_area_body_entered(_body):
	player_nearby = true


func _on_attack_area_body_exited(_body):
	player_nearby = false


func _on_laser_cooldown_timeout():
	can_laser  = true
	

func _on_immunity_timer_timeout():
	immune = false
