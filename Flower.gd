extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if global_position.angle_to_point(get_global_mouse_position()) < 0:
        look_at(get_global_mouse_position())
    pass
