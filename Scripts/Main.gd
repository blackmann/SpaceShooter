extends Node2D

var SmallRock = preload("res://Scenes/AsteroidSmall.tscn")
var BigRock = preload("res://Scenes/AsteroidBig.tscn")

var rock_types =  [SmallRock, BigRock]

func spawn_rock():
	var rock_type = rock_types[randi() % len(rock_types)]
	var rock = rock_type.instantiate()
	var x = randi() % int(get_viewport_rect().size.x - 32) + 32
	rock.position = Vector2(x, 0)
	add_child(rock)

func _on_rocks_spawn_timeout():
	spawn_rock()
