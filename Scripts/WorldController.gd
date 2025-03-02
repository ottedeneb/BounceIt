extends Node2D

onready var pointsLabel = $UI/UI/Score

var ball = preload("res://Scenes/Ball.tscn").instance()

func _ready() -> void:
    $CoutDownSFX.start()
    $Timer.start()


        
func _process(_delta: float) -> void:
    pointsLabel.text = str(Global.points)
    
    $UI/UI/Coutdown.text = str(round($Timer.time_left))
    
    
    
    if Global.gameOver:
        if Global.points >= Global.highscore:
            Global.highscore = Global.points 
            Global.save()
            
        $UI/UI/Restart.show()
        $UI/UI/Menu.show()
        $UI/UI/Anim.play("ButtonMove")


func _on_Button_pressed() -> void:
    Global.points = 0
    Global.gameOver = false
    get_tree().reload_current_scene()


func _on_Timer_timeout() -> void:
    add_child(ball)
    ball.global_position = $SpawnBallPos.global_position
    $UI/UI/Coutdown.hide()
    $UI/UI/Score.show()
    $CoutDownSFX.queue_free()


func _on_CoutDownSFX_timeout() -> void:
    $CountdownSound.play()


func _on_Menu_pressed() -> void:
    Global.points = 0
    Global.gameOver = false
    get_tree().change_scene("res://Scenes/Menu.tscn")
