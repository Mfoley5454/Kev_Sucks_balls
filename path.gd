extends Node2D

var body = load("res://path.tscn")
var body_positions = []
var body_length = 5

func _ready():
    body_positions.append(get_parent().get_child(0).global_position)


func make_path(positionz):
    #print(body_positions[-1])
    #print(body_positions[-1].distance_to(positionz))
    if body_positions[-1].distance_to(positionz) > 10:
        body_positions.append(positionz)
        var new_child = body.instantiate()
        new_child.global_position = body_positions[-1]
        add_child(new_child)
