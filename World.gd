extends Node

var Player1Score = 0
var Player2Score = 0

func _input(event):
	if event.is_action_pressed("Pause"):
		if get_tree().paused:
			unpause_game()
			return
		pause_game()

func pause_game():
	get_tree().paused = true
	$PauseMenu.show()

func unpause_game():
	get_tree().paused = false
	$PauseMenu.hide()

func _on_Left_body_entered(body):
	if body.name != "Ball":
		return
	$Ball.stop_ball()
	$Ball.reset_ball()
	Player2Score +=1
	$PointSound.play()
	$Countdown.start()

func _on_Right_body_entered(body):
	if body.name != "Ball":
		return
	$Ball.stop_ball()
	$Ball.reset_ball()
	Player1Score += 1
	$PointSound.play()
	$Countdown.start()

func _process(delta):
	$Player1Score.text = str(Player1Score)
	$Player2Score.text = str(Player2Score)
	if !get_tree().paused:
		if Player1Score == 10:
			pause_game()
			$PlayerWinSound.play()
			show_message("Player Won!")
		elif Player2Score == 10:
			pause_game()
			$PlayerLoseSound.play()
			show_message("Enemy Won...")

func show_message(message):
	$WonLabel.text = message
	$WonLabel.show()

func hide_message():
	$WonLabel.text = ""
	$WonLabel.hide()

func _on_Countdown_timeout():
	$Ball.start_ball()

func _on_restart_button_pressed():
	pause_game()
	hide_message()
	Player1Score = 0
	Player2Score = 0
	$Ball.stop_ball()
	$Ball.reset_ball()
	$Countdown.start()
	unpause_game()

func _on_quit_button_pressed():
	get_tree().quit()
