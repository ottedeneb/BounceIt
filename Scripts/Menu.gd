extends Node2D


var isActive : bool = false




func _ready() -> void:
	$CanvasLayer/Control/AnimationPlayer.play("PlayButtonAnim")
	Global._load()
	$CanvasLayer/Control/Label.text = "HS:" + str(Global.highscore)




func _on_Play_pressed() -> void:
	$Trans/Trans.show()
	$Trans/Trans/Transition.play("transition")
	


func _on_Transition_animation_finished(_anim_name: String) -> void:
	get_tree().change_scene("res://Scenes/World.tscn")





func _on_About_pressed() -> void:
	if $CanvasLayer/Control/Panel.visible == true:
		$CanvasLayer/Control/Panel.visible = false
	else:
		if $CanvasLayer/Control/Panel.visible == false:
			$CanvasLayer/Control/Panel.visible = true



func _on_Stats_pressed() -> void:
	get_tree().change_scene("res://Scenes/Stats.tscn")
