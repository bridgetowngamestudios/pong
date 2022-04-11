extends Node

var Player1Score = 0
var Player2Score = 0

func _on_Left_body_entered(body):
	$Ball.position = Vector2(517, 210)
	Player2Score +=1


func _on_Right_body_entered(body):
	$Ball.position = Vector2(517, 210)
	Player1Score += 1

func _process(delta):
	$Player1Score.text = str(Player1Score)
	$Player2Score.text = str(Player2Score)
