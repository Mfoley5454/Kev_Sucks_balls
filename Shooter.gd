extends Node2D
var shot = load("res://lazer_beam.tscn")
var beam = load("res://real_laser_beam.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

    pass

func create_shot(direction,speed,flower_pos):
    var new_child = shot.instantiate()
    new_child.inity(direction,speed)
    new_child.global_position = flower_pos
    add_child(new_child)

func create_beam(flower_pos,rot):
    var new_child = beam.instantiate()
    new_child.global_position = flower_pos
    new_child.inity(rot)
    add_child(new_child)
    
