extends Node2D

var bee_ind = load("res://bee.tscn")




# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if get_child_count() < (5+1*Global.level):
        spawn_bee()


func spawn_bee():
    var new_bee = bee_ind.instantiate()
    var ran = randi_range(0,1)
    new_bee.health = 1+1.5*Global.level
    if ran == 0:
        new_bee.global_position = Vector2(randi_range(-200,0),randi_range(-200,400))
    else:
        new_bee.global_position = Vector2(randi_range(1200,1400),randi_range(-200,400))
    add_child(new_bee)
    
