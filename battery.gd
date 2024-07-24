extends Node2D

var type = "battery"
var local_max = 10
var up = true
var test = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if up:
        position.y += 1
        test +=1
        if test >= local_max:
            up = false
            test = 0
    else:
        position.y -= 1
        test +=1
        if test >= local_max:
            up = true
            test = 0


func _on_area_2d_area_entered(area):
    queue_free()
    pass # Replace with function body.
