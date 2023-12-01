extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Logo.rotation_degrees = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Logo.rotation_degrees += 360 * delta
	
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
