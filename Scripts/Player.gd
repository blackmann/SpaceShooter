extends Node2D

@export var speed: int = 225
var velocity = Vector2.ZERO
var half = 0

var Nuke: PackedScene = preload("res://Scenes/Nuke.tscn")

func _ready():
	half = 32 * scale.x / 2
	$AnimatedSprite2D.play("idle")

func _process(delta):
	var move_down =  int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	var move_right = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	velocity.x = move_right
	velocity.y = move_down
	
	if velocity.length() > 0:
		velocity = velocity.normalized()
		position += velocity * speed * delta
		
		var screen_size = get_viewport_rect().size
		position = position.clamp(Vector2(half, half), screen_size + Vector2(-half, -half))
		$AnimatedSprite2D.play("moving")
		
	else:
		$AnimatedSprite2D.play("idle")
		
func _physics_process(delta):
	pass

func spawn_nuke():
	var nuke = Nuke.instantiate()
	nuke.position = position + Vector2(0, -half)
	# we know player will be added to the top level so we just add this nuke to that scene
	get_parent().add_child(nuke)

func _on_fire_rate_timeout():
	spawn_nuke()
