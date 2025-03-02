extends Camera2D
 
var shake_amount = 5
var isShake = false



func shake():
	isShake = true


func _physics_process(_delta: float) -> void:
	if isShake == true:
		self.set_offset(Vector2( \
			rand_range(-1.0, 1.0) * shake_amount, \
			rand_range(-1.0, 1.0) * shake_amount \
		))
	else:
		self.set_offset(Vector2(0,0))
