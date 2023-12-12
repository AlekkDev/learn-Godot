extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.ZERO



func _ready():
	$SelfDestructTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
	


func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit()
	queue_free()
	#if "hit" in body:
		#body.hit()
	
	
	

# WHEN TIMER RUN OUT
func _on_self_destruct_timer_timeout():
	queue_free()
