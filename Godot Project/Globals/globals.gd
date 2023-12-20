extends Node
signal stat_change

var laser_amount = 20:
	get:
		return laser_amount
	set(value):
		laser_amount = value
		stat_change.emit()

var grenade_amount = 5:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		stat_change.emit()

var player_immune: bool = false
func player_volnurable_timer():
	await get_tree().create_timer(0.5).timeout
	player_immune = false

var health = 60:
	get:
		return health
	set(value):
		if value >= health:
				health = min(value, 100)
		else:
			if not player_immune:	
				health = value
				player_immune = true
				player_volnurable_timer()
		stat_change.emit()
		
var player_pos: Vector2
