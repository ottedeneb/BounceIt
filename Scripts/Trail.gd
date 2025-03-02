extends Line2D

var target
var point
export(NodePath) var targetPath
export var trailLenght = 10

func _ready() -> void:
    target = get_node(targetPath)


func _physics_process(delta: float) -> void:
    global_position = Vector2(0,0)
    global_rotation = 0
    point = target.global_position
    add_point(point)
    while get_point_count() > trailLenght:
        remove_point(0)
