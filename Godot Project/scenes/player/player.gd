extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	
	velocity = direction * 500
	move_and_slide()
	if Input.is_action_pressed("primary action") and can_laser:
		print("Shoot Laser")
		can_laser = false
		$Timer.start()
		
			
		pass
	if Input.is_action_pressed("secondary action") and can_grenade:
		print("Shoot Grenade")
		can_grenade = false
		$Timer2.start()


func _on_timer_timeout():
	can_laser = true
	

func _on_timer_2_timeout():
	can_grenade = true
