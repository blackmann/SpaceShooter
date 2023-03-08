extends Node2D

@export var speed: int = 200

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, -1 * speed * delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
