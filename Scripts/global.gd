extends Node

var points : int = 0
var highscore : int
var totalTouch : int = 0


var gameOver : bool = false



var save_path = "user://save.dat"


func save():
	var data = {
		"highscore" : highscore,
		"touch" : totalTouch
	}
	
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()


func _load():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			highscore = player_data["highscore"]
			totalTouch = player_data["touch"]
			file.close()
		
