extends RigidBody2D

var speed = 750

func explode():
	$AnimationPlayer.play("Explosion")
