extends Node

var Player1Score = 0
var Player2Score = 0

func _on_Left_body_entered(body):
	if body.name != "Ball":
		return
	$Ball.reset_ball()
	Player2Score +=1
	get_tree().call_group('BallGroup', 'stop_ball')
	$Countdown.start()

func _on_Right_body_entered(body):
	if body.name != "Ball":
		return
	$Ball.reset_ball()
	Player1Score += 1
	get_tree().call_group('BallGroup', 'stop_ball')
	$Countdown.start()

func _process(delta):
	$Player1Score.text = str(Player1Score)
	$Player2Score.text = str(Player2Score)


func _on_Countdown_timeout():
	get_tree().call_group('BallGroup', 'restart_ball')
