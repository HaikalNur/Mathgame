extends Area2D

@onready var timer = $Timer
@onready var button = $Control/Button

@onready var label = $Control/Label
@onready var animation_player = $"../entrance/AnimationPlayer"
var animation_played = false  # Flag to track if the animation has been played
func _ready():
	button.visible = false
	
	
func _on_body_entered(body):
	if not animation_played:  # Check if the animation has already been played
		print("close door")
		
		if animation_player and animation_player.has_method("play"):
			animation_player.play("gate")  # Play the animation
			animation_played = true  # Set the flag to true after playing the animation
		else:
			print("Error: AnimationPlayer not found or method 'play' not available")
		label.text = "jawab pertanyaan ku jika kamu ingin lewat"
		timer.start()
		
	else:
		print("Animation has already been played")
		
func _on_timer_timeout():
	button.visible = true
	
func _on_button_button_up():
	if animation_played:
		print("open door")
		if animation_player and animation_player.has_method("play"):
			animation_player.play("open")  # Play the animation
			animation_played = false  # Set the flag to true after playing the animation
		else:
			print("anim played")
	else:
		print("test")
		label.text = "jawab pertanyaan ku jika kamu ingin lewat"
	
