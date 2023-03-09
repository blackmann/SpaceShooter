extends Area2D

@export var speed: int = 200

func _process(delta):
	position += Vector2(0, -1 * speed * delta)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
