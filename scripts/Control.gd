extends Control

var current_question = ""
var correct_answer = 0

func _ready():
	hide()

func show_question(question, answer):
	current_question = question
	correct_answer = answer
	$Panel/Label.text = question
	$Panel/LineEdit.text = ""
	show()

func _on_Button_pressed():
	var player_answer = $Panel/LineEdit.text.to_int()
	if player_answer == correct_answer:
		print("Correct!")
	else:
		print("Wrong answer.")
	hide()

# Fungsi untuk menghubungkan sinyal tombol
func _on_LineEdit_text_entered(new_text):
	_on_Button_pressed()
