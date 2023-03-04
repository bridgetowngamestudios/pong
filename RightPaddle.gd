extends CharacterBody2D

var speed = 450

var ball

func _ready():
	ball = get_parent().find_child("Ball")

func _physics_process(delta):
	set_velocity(Vector2(0,determine_direction())*speed)
	move_and_slide()
	
func determine_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else: 
			return -1
	else:
		return 0
