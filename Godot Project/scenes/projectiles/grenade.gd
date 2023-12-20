extends RigidBody2D

var speed = 750
var explosion_active: bool= false
var explosion_radius: int = 400
func explode():
	$AnimationPlayer.play("Explosion")
	explosion_active = true
	
func _process(_delta):
	if explosion_active:
		var targets = get_tree().get_nodes_in_group('Entities') + get_tree().get_nodes_in_group('Container')
		
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < explosion_radius
			if "hit" in target and in_range:
				target.hit()
