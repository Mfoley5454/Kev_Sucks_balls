extends Node2D

var vel_city = Vector2(0,0)

var damage = 6
var type = "not beam"

# Called when the node enters the scene tree for the first time.
func _ready():
    
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    global_position += vel_city
    
    if global_position.x >1200 or global_position.x < 0:
        queue_free()
    elif global_position.y >700 or global_position.x < 0:
        queue_free()


func inity(ro_daddy,speed):
    vel_city = speed.rotated(ro_daddy)
    rotation = ro_daddy


func _on_area_2d_area_entered(area):
    queue_free()
    pass # Replace with function body.
