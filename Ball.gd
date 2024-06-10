extends CharacterBody2D

var speed = 400
var ball_velocity = Vector2.ZERO
@onready var ball_sound = $BallSound

func _ready():
	start_ball()

func _physics_process(delta):
	var collision_object = move_and_collide(ball_velocity*speed * delta)
	if collision_object:
		ball_velocity = ball_velocity.bounce(collision_object.get_normal())
		$BallSound.play()

func reset_ball():
	position = Vector2(640,200)

func stop_ball():
	speed = 0

func start_ball():
	speed = 400
	ball_velocity.x = [1,-1][randi()%2]
	ball_velocity.y = [-0.8, 0.8][randi()%2]
