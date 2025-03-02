extends Node2D

func _ready() -> void:
	$CanvasLayer/Control/TotalScore.text = "Total Points: " + str(Global.totalTouch)
	
	


func _on_Back_pressed() -> void:
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_DeleteSaves_pressed() -> void:
	$CanvasLayer/Control/Confirm.show()
	$CanvasLayer/Control/Keep.show()


func _on_Confirm_pressed() -> void:
	print("Data Erased")
	var dir = Directory.new()
	dir.remove("user://save.dat")
	get_tree().quit()


func _on_Keep_pressed() -> void:
	$CanvasLayer/Control/Keep.hide()
	$CanvasLayer/Control/Confirm.hide()
