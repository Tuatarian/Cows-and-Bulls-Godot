extends Node2D
var correct_word_substr = []

func _on_Button_pressed():
	correct_word_substr = convertCorrectStr($LineEdit.text)
	var are_letters_doubled = checkDoubleLetters(correct_word_substr)
	if !are_letters_doubled:
		Globals.correct_word_substr = correct_word_substr
		Globals.correct_word = $LineEdit.text
		get_tree().change_scene("Main.tscn")

func checkDoubleLetters(input_substr):
	for i in range (0, input_substr.size()-1, 1):
		for j in range (0, input_substr.size(), 1):
			if !i==j:
				if input_substr[i] == input_substr[j]:
					$LineEdit.set_text("You are not allowed to choose a word in which a letter repeats!")
					return true
	return false

func convertCorrectStr(correct_word):
	var correct_word_substr = []
	for i in range (0, correct_word.length(), 1):
		correct_word_substr.append(correct_word.substr(i,1))
	return correct_word_substr

func _on_LineEdit_focus_entered():
	$LineEdit.text = ""
