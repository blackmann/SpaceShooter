extends Node2D

@export var speed: int = 40
@export var rotation_speed: int = 10
@export var health = 1

func _process(delta):
	if health <= 0:
		queue_free()
		Global.score += 1
		return
		
	position += Vector2(0, 1) * delta * speed
	rotation += deg_to_rad(rotation_speed) * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	print_debug("removing", health)
	queue_free()

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("rock_destroyer"):
		area.queue_free()
		health -= 1
