extends CharacterBody2D

const JUMP_VELOCITY = -500.0
var xPos = 0

func _ready():
	xPos = position.x

func _physics_process(delta):
	
	if is_on_floor():
		get_tree().change_scene_to_file("res://gameover.tscn")
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 0.75

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
	if position.x < xPos:
		get_tree().change_scene_to_file("res://gameover.tscn")
