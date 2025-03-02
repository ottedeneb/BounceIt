extends KinematicBody2D

var is_dragging = false
var touchpos = Vector2(0,0)


func _process(delta: float) -> void:
	pass


		
		
		
func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		if event.is_pressed():
			is_dragging = true
		else:
			is_dragging = false
			self.global_position.x = event.position.x
		if is_dragging:
			touchpos.x = event.position.x
			
			
			
func _physics_process(delta: float) -> void:
	if is_dragging:
		self.global_position.x = touchpos.x
		
		



func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Ball"):
		Global.totalTouch += 1
		$Particles2D.emitting = true
		$Racchetta.play("ScenesRacchetta")
		$OnScoreChange.play("zoomScore")
