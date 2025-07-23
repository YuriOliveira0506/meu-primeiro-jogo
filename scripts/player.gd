extends KinematicBody2D

var velocity = Vector2.ZERO
var move_speed = 400
var gravity = 1200
var jump_force = -720
var is_grounded
onready var raycasts = $raycasts

func _process(delta: float) -> void:
	velocity.y += gravity * delta

	_get_input()

	if Input.is_action_pressed("jump"):
		velocity.y = jump_force / 2
	
	move_and_slide(velocity)

func _get_input():
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = move_speed * move_direction
	
	if move_direction != 0:
		$texture.scale.x = move_direction
