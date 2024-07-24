extends Node2D

signal hit_path

var speed = Vector2(4,0)
var velocity = Vector2(5,0)
var rotation_speed = .1
var tail = []
var tail_length = 10
# Called when the node enters the scene tree for the first time.
func _ready():
    tail.append(global_position)
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if global_position.distance_to(get_global_mouse_position()) > 10:
        rotation =rotate_toward(rotation, position.angle_to_point(get_global_mouse_position()),rotation_speed)
        #look_at(get_global_mouse_position())
        velocity = (speed.rotated(rotation))
    if global_position.y+velocity.y < 150:
        velocity.y = 0
    global_position += velocity


func _on_area_2d_area_entered(area):
    hit_path.emit()
    pass # Replace with function body.


func _on_area_2d_2_area_entered(area):
    print("woot")
    if area.get_parent().type == "gem":
        print("weet")
        get_parent().gems += 1
    else:
        get_parent().batteries += 1
