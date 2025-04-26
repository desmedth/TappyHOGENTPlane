extends StaticBody2D

const WAIT = 3
const VELOCITY = 5

var elapsed = 0.0
var moving = false
var passes = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	moving = false
	elapsed = WAIT / 2 * randf_range(0.8, 1.2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		position.x -= VELOCITY * (1 + passes / 10)
		if position.x < -100:
			moving = false
	else:
		elapsed += delta * (1 + passes / 10)
	
	if elapsed > WAIT:
		elapsed -= WAIT * randf_range(0.5, 1.5)
		moving = true
		position.x = 1250
		position.y = randi_range(-100, 0)
		passes += 1
