extends Node

var Player1Score = 0
var Player2Score = 0

func _input(event):
	if event.is_action_pressed("Pause"):
		if get_tree().paused:
			get_tree().paused = false
			$PauseMenu.hide()
			return
		get_tree().paused = true
		$PauseMenu.show()

func _on_Left_body_entered(body):
	if body.name != "Ball":
		return
	$Ball.stop_ball()
	$Ball.reset_ball()
	Player2Score +=1
	$Countdown.start()

func _on_Right_body_entered(body):
	if body.name != "Ball":
		return
	$Ball.stop_ball()
	$Ball.reset_ball()
	Player1Score += 1
	$Countdown.start()

func _process(delta):
	$Player1Score.text = str(Player1Score)
	$Player2Score.text = str(Player2Score)
	if Player1Score == 10:
		pass 
		# Player win condition
	elif Player2Score == 10:
		pass
		# AI win condition

func _on_Countdown_timeout():
	$Ball.start_ball()

func _on_restart_button_pressed():
	Player1Score = 0
	Player2Score = 0
	$Ball.stop_ball()
	$Ball.reset_ball()
	$Countdown.start()

func _on_options_button_pressed():
	print("Options")

func _on_quit_button_pressed():
	get_tree().quit()
