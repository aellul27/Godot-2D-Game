extends CanvasLayer
signal start_game
var highscore = 0

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# make a one-shot timer
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
	
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
		$StartButton.hide()
		emit_signal("start_game")
	

func _on_MessageTimer_timeout():
	$Message.hide()


func update_high_score(score):
	if highscore < score:
		highscore = score
		$Highscore.text = str(score)
