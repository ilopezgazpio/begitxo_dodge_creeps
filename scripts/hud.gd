extends CanvasLayer

signal start_game

func _ready():
	$ScoreLabel.hide()
	$EnergyLabel.hide()
	$LevelLabel.hide()
	
func showHUD():
	$ScoreLabel.show()
	$EnergyLabel.show()
	$LevelLabel.show()

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Dodge the Creeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update(score, energy, level):
	$ScoreLabel.text = "Alive: " + str(score)
	$EnergyLabel.text = "Energy: " + str(energy) + "%"
	$LevelLabel.text = "Level: " + str(level)

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
